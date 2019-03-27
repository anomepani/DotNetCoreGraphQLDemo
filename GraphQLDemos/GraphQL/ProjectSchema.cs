using GraphQL;
using GraphQL.Types;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DotNetCoreDemoPOC.GraphQL
{
    public class ProjectSchema:Schema
    {
        public ProjectSchema(IDependencyResolver resolver) : base(resolver)
        {
            Query = resolver.Resolve<ProjectQuery>();
        }
    }
}
