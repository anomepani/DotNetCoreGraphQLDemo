using System;
using System.Collections.Generic;

namespace GraphQLDemos
{
    public partial class TestCategoryMaster
    {
        public int Id { get; set; }
        public string Category { get; set; }
        public int? ParentId { get; set; }
    }
}