using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using GraphQLDemos;
using System.Data;
using Dapper;
using MediatR;
using GraphQLDemos.Models;
using Microsoft.AspNet.OData;

namespace GraphQLDemos.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TestCategoryMastersController : ControllerBase
    {

        private readonly IMediator _mediator;

        private readonly EstimlabsContext _context;
        private readonly IDbConnection _conn;

        public TestCategoryMastersController(EstimlabsContext context, IDbConnection conn, IMediator mediator)
        {
            _context = context;
            _conn = conn;
            _mediator = mediator;
        }


        [HttpGet]
        [Route("GetUserDetails")]
        public async Task<ProjectMaster> GetUserDetails(int userId)
        {
            //Sample Static request Response using mediator
            var model = await _mediator.Send(new ProjectQuery { Id = userId });

            //if (model == null)
            //    return HttpNotFound();

            return model;
        }

        [HttpGet]
        [Route("GetMasters")]
        [EnableQuery]
        public ActionResult<object> GetMasters()
        {
            return _context.ProjectMasters;
        }

        // GET: api/TestCategoryMasters https://localhost:44303/api/TestCategoryMasters?$expand=ProjectMaster($select=Id,ProjectName),seiveAnalysisTest,testEntry($select=Id,SeiveSize,WeightRetained)
        [HttpGet]
        [EnableQuery]
        public ActionResult<object> GetTestCategoryMasters()
        {
            //var data = _context.Set<TestCategoryMaster>().FromSql("GetAllMasterTestCategory").ToListAsync();
            //  return await _context.TestCategoryMasters.ToListAsync();
            //var parameters = new DynamicParameters();
            //var resultset=_conn.QueryMultiple("GetAllMasterTestCategory", null, commandType: CommandType.StoredProcedure);
            //return   resultset.Read<TestCategoryMaster>().ToList();

            var resultset = _conn.QueryMultiple("GetAllSeiveAnalysisTestData", null, commandType: CommandType.StoredProcedure);
            return new { projectMaster = resultset.Read<ProjectMaster>(), seiveAnalysisTest = resultset.Read<SeiveAnalysisTest>(), testEntry = resultset.Read<SeiveTestResultEntry>() };
        }

        // GET: api/TestCategoryMasters/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TestCategoryMaster>> GetTestCategoryMaster(int id)
        {
            var testCategoryMaster = await _context.TestCategoryMasters.FindAsync(id);

            if (testCategoryMaster == null)
            {
                return NotFound();
            }

            return testCategoryMaster;
        }

        // PUT: api/TestCategoryMasters/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTestCategoryMaster(int id, TestCategoryMaster testCategoryMaster)
        {
            if (id != testCategoryMaster.Id)
            {
                return BadRequest();
            }

            _context.Entry(testCategoryMaster).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TestCategoryMasterExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/TestCategoryMasters
        [HttpPost]
        public async Task<ActionResult<TestCategoryMaster>> PostTestCategoryMaster(TestCategoryMaster testCategoryMaster)
        {
            _context.TestCategoryMasters.Add(testCategoryMaster);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetTestCategoryMaster", new { id = testCategoryMaster.Id }, testCategoryMaster);
        }

        // DELETE: api/TestCategoryMasters/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<TestCategoryMaster>> DeleteTestCategoryMaster(int id)
        {
            var testCategoryMaster = await _context.TestCategoryMasters.FindAsync(id);
            if (testCategoryMaster == null)
            {
                return NotFound();
            }

            _context.TestCategoryMasters.Remove(testCategoryMaster);
            await _context.SaveChangesAsync();

            return testCategoryMaster;
        }

        private bool TestCategoryMasterExists(int id)
        {
            return _context.TestCategoryMasters.Any(e => e.Id == id);
        }
    }
}
