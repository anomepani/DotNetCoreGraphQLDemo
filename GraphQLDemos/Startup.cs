using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using DotNetCoreDemoPOC.GraphQL;
using GraphQL;
using GraphQL.Server;
using GraphQL.Server.Ui.Playground;
using MediatR;
using Microsoft.AspNet.OData.Extensions;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;

namespace GraphQLDemos
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)

        {
            //Register Mediater Services
            //services.AddScoped<IMediator, Mediator>();
            //services.AddTransient<SingleInstanceFactory>(sp => t => sp.GetService(t));
            //services.AddTransient<MultiInstanceFactory>(sp => t => sp.GetServices(t));
            //services.AddMediatorHandlers(typeof(Startup).GetTypeInfo().Assembly);

            //Easy way to plug in Mediatr by using nuget package by Jimmy Bogard
            //MediatR.Extensions.Microsoft.DependencyInjection
            //services.AddMediatR(typeof(Startup).GetTypeInfo().Assembly);
            services.AddMediatR(typeof(Startup).GetTypeInfo().Assembly);

            services.AddMiddlewareAnalysis();

            services.AddDbContext<EstimlabsContext>(options => options.UseSqlServer(Configuration.GetConnectionString("EstimLabConnection"), b => b.UseRowNumberForPaging()));

            services.AddTransient<IDbConnection>(provider => new SqlConnection(Configuration.GetConnectionString("EstimLabConnection")));
            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_2);

            //GraphQL configuration
            services.AddScoped<ProjectSchema>();
            services.AddScoped<IDependencyResolver>(s => new FuncDependencyResolver(s.GetRequiredService));

            services.AddGraphQL(o => { o.ExposeExceptions = false; })
                .AddGraphTypes(ServiceLifetime.Scoped);

            services.AddOData();

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {

                app.UseDeveloperExceptionPage();
                app.UseMiddleware<StackifyMiddleware.RequestTracerMiddleware>();
            }
            else
            {
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }
            //Configure Schema of GraphQL
            app.UseGraphQL<ProjectSchema>();
            //Add PlayGround middleWare and browse with Endpoint : https://localhost:44303/ui/playground
            app.UseGraphQLPlayground(new GraphQLPlaygroundOptions());


            app.UseHttpsRedirection();
            app.UseMvc(o =>
            {
                o.EnableDependencyInjection();
                o.Expand().Filter().Select().OrderBy().Count().MaxTop(100);
            });
        }
    }
}
