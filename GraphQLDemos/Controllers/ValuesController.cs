using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Runtime.InteropServices.ComTypes;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace GraphQLDemos.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        // GET api/values
        [HttpGet]
        public ActionResult<IEnumerable<string>> Get()
        {
            return new string[] { "value1", "value2" };
        }

        [HttpGet]
        [Route("Redirecttest")]
        public ActionResult Redirecttest(string fileData="")
        {
            //Reference from : https://stackoverflow.com/questions/11324711/redirect-from-asp-net-web-api-post-action


            //For HttpClient usage more info : http://www.bizcoder.com/httpclient-it-lives-and-it-is-glorious
            //MSFT Response :https://docs.microsoft.com/en-us/aspnet/web-api/overview/advanced/calling-a-web-api-from-a-net-client
            //var response = Request.CreateResponse(HttpStatusCode.Moved);
            //response.Headers.Location = new Uri("http://www.abcmvc.com");

            // return Redirect("/api/values"); ;
            //   return RedirectPermanent("/api/values");


            //Reference from : http://www.csharp411.com/c-convert-string-to-stream-and-stream-to-string/
            // convert string to stream
            byte[] byteArray = Encoding.ASCII.GetBytes(fileData+"This is sample content for testing purpose");
            MemoryStream stream = new MemoryStream(byteArray);

            //// convert stream to string
            //StreamReader reader = new StreamReader(stream);
            //string text = reader.ReadToEnd();

            HttpResponseMessage response = new HttpResponseMessage();
            response.StatusCode = HttpStatusCode.OK;
            response.Content = new StreamContent(stream);
            //response.Content.Headers.ContentDisposition = new ContentDispositionHeaderValue("attachment")
            //{
            //     FileName= "foo.txt"
            //};

            //One way
           // return File(byteArray, GetContentType("foo.txt"),"foo.txt"); ;
            //Second way 
            return File(stream, "application/octet-stream", "foo.txt");
        }
        private string GetContentType(string path)
        {
            var types = GetMimeTypes();
            var ext = Path.GetExtension(path).ToLowerInvariant();
            return types[ext];
        }

        private Dictionary<string, string> GetMimeTypes()
        {
            return new Dictionary<string, string>
            {
                {".txt", "text/plain"},
                {".pdf", "application/pdf"},
                {".doc", "application/vnd.ms-word"},
                {".docx", "application/vnd.ms-word"},
                {".xls", "application/vnd.ms-excel"},
                {".xlsx", "application/vnd.openxmlformatsofficedocument.spreadsheetml.sheet"},  
                {".png", "image/png"},
                {".jpg", "image/jpeg"},
                {".jpeg", "image/jpeg"},
                {".gif", "image/gif"},
                {".csv", "text/csv"}
            };
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            return "value";
        }

        // POST api/values
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
