using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace GraphQLDemos
{
    public partial class EstimlabsContext : DbContext
    {
        public EstimlabsContext()
        {
        }

        public EstimlabsContext(DbContextOptions<EstimlabsContext> options)
            : base(options)
        {
        }

        public virtual DbSet<ProjectMaster> ProjectMasters { get; set; }
        public virtual DbSet<SeiveAnalysisTest> SeiveAnalysisTests { get; set; }
        public virtual DbSet<SeiveTestResultEntry> SeiveTestResultEntries { get; set; }
        public virtual DbSet<TestCategoryMaster> TestCategoryMasters { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            //Reference from : https://www.clearlyagileinc.com/agile-blog/singular-table-name-convention-in-entity-framework-core-v2
            //This will singularize all table names
            foreach (IMutableEntityType entityType in modelBuilder.Model.GetEntityTypes())
            {
                entityType.Relational().TableName = entityType.DisplayName();
            }
        }

    }
}