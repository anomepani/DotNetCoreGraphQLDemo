using System;
using System.Collections.Generic;

namespace GraphQLDemos
{
    public partial class SeiveTestResultEntry
    {
        public int Id { get; set; }
        public int? ReferenceTestId { get; set; }
        public double? SeiveSize { get; set; }
        public double? WeightRetained { get; set; }
        public int? SampleNo { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string ModifiedBy { get; set; }
        public bool? Status { get; set; }

        public virtual SeiveAnalysisTest ReferenceTest { get; set; }
    }
}