using GraphQL.Types;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DotNetCoreDemoPOC.GraphQL
{
    /// <summary>
    /// Generated C# Class based on response from
    /// Reference from https://jsonplaceholder.typicode.com/todos
    /// </summary>
    public class JsonPlaceholderExample
    {
        public int userId { get; set; }
        public int id { get; set; }
        public string title { get; set; }
        public bool completed { get; set; }
    }
    public class JsonPlaceholderExampleType : ObjectGraphType<JsonPlaceholderExample>
    {
        public JsonPlaceholderExampleType()
        {
            Field(i => i.id);
            Field(i => i.userId);
            Field(i => i.title);
            Field(i => i.completed);
        }
    }
}
