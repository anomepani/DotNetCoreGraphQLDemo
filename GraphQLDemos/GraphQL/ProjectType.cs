using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;
using GraphQL.Types;
using GraphQLDemos;

namespace DotNetCoreDemoPOC.GraphQL
{
    public class ProjectType : ObjectGraphType<ProjectMaster>
    {
        public ProjectType()
        {
            Field(i => i.Id);
            Field(i => i.ProjectName);
            Field(i => i.ConsultingCompany);
            Field(i => i.Description);
        }
    }

    public class ProductType : ObjectGraphType<Product>
    {
        public ProductType()
        {
            Field(i => i.Id);
            Field(i => i.Name);
        }
    }
    public class Product
    {
        [Description("Product Id")]
        public int Id { get; set; }
        public string Name { get; set; }

    }
}
