using Microsoft.EntityFrameworkCore.Internal;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace CodeGeneratorDemo
{
    class Program
    {

        static void Main(string[] args)
        {
            // The code provided will print ‘Hello World’ to the console.
            // Press Ctrl+F5 (or go to Debug > Start Without Debugging) to run your app.
            Console.WriteLine("GraphQL TypeClass  Generation started...");
            GetClassInfo(typeof(Product));
            GetClassInfo(typeof(SeiveAnalysisTest));
            Console.WriteLine("GraphQL TypeClass  Generation Ended and saved in BaseDirectory Bin Folder...");
            Console.ReadKey();

            // Go to http://aka.ms/dotnet-get-started-console to continue learning how to build a console app! 
        }
        public static void GetClassInfo(Type type)
        {
            //  Console.WriteLine("###########GraphQL Class Type Generatr start ##########\n\n");
            //Console.WriteLine(type.GetProperties()[0].GetCustomAttribute<DescriptionAttribute>().Description);

            IndentedStringBuilder codeBuilder = new IndentedStringBuilder();
            codeBuilder.AppendLine(@"
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;
using GraphQL.Types;
");

            codeBuilder.AppendLine($"namespace {type.Namespace} {{");
            using (codeBuilder.Indent())
            {
                codeBuilder.AppendLine($"public class {type.Name}Type : ObjectGraphType<{type.Name}>{{");


                using (codeBuilder.Indent())
                {
                    codeBuilder.AppendLine($"public {type.Name}Type(){{");
                    foreach (var item in type.GetProperties())
                    {
                        var graphField = string.Empty;
                        graphField = $"Field(i=>i.{item.Name})";
                        if (GetDescription(item) != null)
                        {
                            graphField += $".Description({ GetDescription(item)})";

                        }
                        codeBuilder.AppendLine(graphField + ";");
                    }
                    codeBuilder.AppendLine("}");
                }
                codeBuilder.AppendLine("}");

            }
            codeBuilder.AppendLine("}");
            Console.WriteLine(codeBuilder);
            var fullPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, type.Name + ".cs");
            WriteCode(fullPath, codeBuilder.ToString());

            // Console.WriteLine("\n\n##########GraphQL Class Type Generatr END ###########");
        }


        public static void WriteCode(string path, string content)
        {
            var fullPath = Path.GetFullPath(path);
            var directory = Path.GetDirectoryName(fullPath);

            if (!Directory.Exists(directory))
                Directory.CreateDirectory(directory);

            if (File.Exists(fullPath)) File.Delete(fullPath);
            File.WriteAllText(fullPath, content);
        }
        /// <summary>
        /// Utility or reusable method to Property Description value
        /// </summary>
        /// <param name="property"></param>
        /// <returns></returns>
        public static string GetDescription(PropertyInfo property)
        {
            return property.GetCustomAttribute<DescriptionAttribute>()?.Description;
        }
    }
    /// <summary>
    /// Reference from https://stackoverflow.com/questions/295104/what-is-the-difference-between-a-field-and-a-property?rq=1
    /// </summary>
    public static class Extension
    {
        public static T GetCustomAttribute<T>(this System.Reflection.MemberInfo mi) where T : Attribute
        {
            return mi.GetCustomAttributes(typeof(T), true).FirstOrDefault() as T;
        }
    }

    public partial class SeiveAnalysisTest
    {

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


    }


    class Product
    {

        [Description("Product Id")]
        public int Id { get; set; }

        /// <summary>
        /// Product Name
        /// </summary>
        public string Name { get; set; }

    }
}
