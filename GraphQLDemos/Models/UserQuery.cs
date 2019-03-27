using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MediatR;
namespace GraphQLDemos.Models
{
    public class ProjectQuery : IRequest<ProjectMaster>
    {
        public int Id { get; set; }
    }

    public class ProjectMasterQueryHandler : RequestHandler<ProjectQuery, ProjectMaster>
    {
        //Inject DBContext or Repository context here To Access Real DB Call
        private readonly EstimlabsContext _context;
        public ProjectMasterQueryHandler(EstimlabsContext context)
        {
            _context = context;

        }
        protected override ProjectMaster Handle(ProjectQuery message)
        {
            // Could query a db here and get the columns we need.
            return _context.ProjectMasters.Find(message.Id);

            //OLD Static Code with CQRS Pattern
            //var   viewModel = new UserViewModel();
            //   viewModel.UserId = 100;
            //   viewModel.Username = "sgordon";
            //   viewModel.Forename = "Steve";
            //   viewModel.Surname = "Gordon";

            //   return viewModel;
        }

        //protected override UserViewModel Handle(UserQuery request)
        //{
        //    throw new NotImplementedException();
        //}
    }

    public class UserViewModel
    {
        public int UserId { get; internal set; }
        public string Username { get; internal set; }
        public string Forename { get; internal set; }
        public string Surname { get; internal set; }
    }
}
