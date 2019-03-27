using System;
using System.Collections.Generic;

namespace GraphQLDemos
{
    public partial class ProjectMaster
    {
        public ProjectMaster()
        {
            SeiveAnalysisTests = new HashSet<SeiveAnalysisTest>();
        }

        public int Id { get; set; }
        public string ProjectName { get; set; }
        public string Description { get; set; }
        public string Contractor { get; set; }
        public string ContractNo { get; set; }
        public string Engineer { get; set; }
        public string ConsultingCompany { get; set; }
        public DateTime? ProjectStartDate { get; set; }
        public DateTime? ProjectEndDate { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string ModifiedBy { get; set; }
        public bool? Status { get; set; }

        public virtual ICollection<SeiveAnalysisTest> SeiveAnalysisTests { get; set; }
    }
}