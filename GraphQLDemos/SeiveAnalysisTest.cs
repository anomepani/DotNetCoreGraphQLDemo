using System;
using System.Collections.Generic;

namespace GraphQLDemos
{
    public partial class SeiveAnalysisTest
    {
        public SeiveAnalysisTest()
        {
            SeiveTestResultEntries = new HashSet<SeiveTestResultEntry>();
        }

        public int Id { get; set; }
        public string TestMethod { get; set; }
        public string TestNameCalculated { get; set; }
        public int? ProjectId { get; set; }
        public string Material { get; set; }
        public string Source { get; set; }
        public string OriginalSource { get; set; }
        public int? SampleNo { get; set; }
        public DateTime? SampledDate { get; set; }
        public DateTime? TestedDate { get; set; }
        public string TestedBy { get; set; }
        public string Bsspecification { get; set; }
        public double? FinenessModulas { get; set; }
        public string ContractorSign { get; set; }
        public string Approved { get; set; }
        public double? MoistureContentOfSand { get; set; }
        public string LaboratoryName { get; set; }
        public string LaboratoryDescription { get; set; }

        public virtual ProjectMaster Project { get; set; }
        public virtual ICollection<SeiveTestResultEntry> SeiveTestResultEntries { get; set; }
    }
}