using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using Dapper;
using GraphQL.Types;
using GraphQLDemos;
using MediatR;
using Newtonsoft.Json;

namespace DotNetCoreDemoPOC.GraphQL
{
    public class ProjectQuery : ObjectGraphType
    {
        public ProjectQuery(EstimlabsContext db, IMediator _mediatr, IDbConnection conn)
        {
            Field<ListGraphType<ProjectType>>("projects",
                resolve: context => db.ProjectMasters);

            Field<ProjectType>("project",
                //While configuring type of argument provide GraphQL Types. e.g. IntGraphType
                arguments: new QueryArguments(new QueryArgument<IntGraphType>() { Name = "id" }),
    resolve: context =>
    {
        //Extract Id from argument and pass it  to EfContext/Mediatr/Dapper
        //While extarcting argument provide C# type e.g. int,string,bool,double etc
        var id = context.GetArgument<int>("id");
        return db.ProjectMasters.Find(id);
    });

            // GraphQL with Mediatr CQRS Pattern


            Field<ProjectType>("projectByMediatr",
               //While configuring type of argument provide GraphQL Types. e.g. IntGraphType
               arguments: new QueryArguments(new QueryArgument<IntGraphType>() { Name = "id" }),
   resolve: context =>
   {
       //Extract Id from argument and pass it  to EfContext/Mediatr/Dapper
       //While extarcting argument provide C# type e.g. int,string,bool,double etc
       var id = context.GetArgument<int>("id");
       return _mediatr.Send(new GraphQLDemos.Models.ProjectQuery() { Id = id });
   });

            //GraphQL query with Dapper 

            Field<ProjectType>("projectByDapper",
         //While configuring type of argument provide GraphQL Types. e.g. IntGraphType
         arguments: new QueryArguments(new QueryArgument<IntGraphType>() { Name = "id" }),
resolve: context =>
{
    //Extract Id from argument and pass it  to EfContext/Mediatr/Dapper
    //While extarcting argument provide C# type e.g. int,string,bool,double etc
    var id = context.GetArgument<int>("id");
    DynamicParameters param = new DynamicParameters();
    param.Add("@id", id);
    return conn.QuerySingleOrDefault<ProjectMaster>("Select * from ProjectMaster where id=@id", param);
});
            //Integrate GraphQL With RemoteWeb EndPoint todos demo

            Field<ListGraphType<JsonPlaceholderExampleType>>("todos",
               resolve: context =>
               {
                   //Reference from : https://johnthiriet.com/efficient-api-calls/
                   using (var client = new HttpClient())
                   {
                       var url = "https://jsonplaceholder.typicode.com/todos/";
                       var content = client.GetStringAsync(url).Result;
                       return JsonConvert.DeserializeObject<List<JsonPlaceholderExample>>(content);
                   }
               });

            //GraphQL With Remote Endpoint Get todo Item By Id
            Field<JsonPlaceholderExampleType>("todo",
         //While configuring type of argument provide GraphQL Types. e.g. IntGraphType
         arguments: new QueryArguments(new QueryArgument<IntGraphType>() { Name = "id" }),
resolve: context =>
{
    //Extract Id from argument and pass it  to EfContext/Mediatr/Dapper
    //While extarcting argument provide C# type e.g. int,string,bool,double etc
    var id = context.GetArgument<int>("id");
    using (var client = new HttpClient())
    {
        var url = "https://jsonplaceholder.typicode.com/todos/" + id;
        var content = client.GetStringAsync(url).Result;
        return JsonConvert.DeserializeObject<JsonPlaceholderExample>(content);
    }
});

        }
    }
}
