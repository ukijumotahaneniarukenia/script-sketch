using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.Remoting;
using System.Text.RegularExpressions;
using Newtonsoft.Json;

namespace app {
    class Program {

        private const string ASSEMBLY_NAME = "assemblyName";
        private const string FS = "\t";
        private const string DEFAULT_NONE_STRING_VALUE = "ないよーん";
        private const string NAMESPACE_NAME = "nameSpaceName";
        private const string TYPE_NAME = "typeName";

        private static List<Dictionary<string, string>> getStdLibAssemblyList () {
            //デフォルトの標準ライブラリのみ
            List<Assembly> stdlibAssemblyList = AppDomain.CurrentDomain.GetAssemblies ().ToList ();

            List<Dictionary<string, string>> assemblyNameSpaceTypeSummaryList = new List<Dictionary<string, string>> ();

            foreach (Assembly assembly in stdlibAssemblyList) {

                string assemblyName = assembly.GetName ().Name;

                List<Type> typeList = assembly.GetTypes ().ToList ();

                foreach (Type type in typeList) {

                    Dictionary<string, string> assemblyNameSpaceTypeDetailDict = new Dictionary<string, string> ();

                    assemblyNameSpaceTypeDetailDict.Add (ASSEMBLY_NAME, assemblyName == null ? DEFAULT_NONE_STRING_VALUE : assemblyName);
                    assemblyNameSpaceTypeDetailDict.Add (NAMESPACE_NAME, type.Namespace == null? DEFAULT_NONE_STRING_VALUE : type.Namespace);
                    assemblyNameSpaceTypeDetailDict.Add (TYPE_NAME, type.FullName == null ? DEFAULT_NONE_STRING_VALUE : type.FullName);

                    assemblyNameSpaceTypeSummaryList.Add (assemblyNameSpaceTypeDetailDict);
                }
            }
            return assemblyNameSpaceTypeSummaryList;
        }

        private static List<Dictionary<string, string>> getExtLibAssemblyList (List<string> extLibAssemblyList) {
            //外部ライブラリ指定
            List<Dictionary<string, string>> assemblyNameSpaceTypeSummaryList = new List<Dictionary<string, string>> ();

            foreach (string extLibAssembly in extLibAssemblyList) {

                Assembly assembly = Assembly.Load (extLibAssembly);

                string assemblyName = assembly.GetName ().Name;

                List<Type> typeList = assembly.GetTypes ().ToList ();

                foreach (Type type in typeList) {
                    Dictionary<string, string> assemblyNameSpaceTypeDetailDict = new Dictionary<string, string> ();

                    assemblyNameSpaceTypeDetailDict.Add (ASSEMBLY_NAME, assemblyName == null ? DEFAULT_NONE_STRING_VALUE : assemblyName);
                    assemblyNameSpaceTypeDetailDict.Add (NAMESPACE_NAME, type.Namespace == null? DEFAULT_NONE_STRING_VALUE : type.Namespace);
                    assemblyNameSpaceTypeDetailDict.Add (TYPE_NAME, type.FullName == null ? DEFAULT_NONE_STRING_VALUE : type.FullName);

                    assemblyNameSpaceTypeSummaryList.Add (assemblyNameSpaceTypeDetailDict);
                }

            }
            return assemblyNameSpaceTypeSummaryList;
        }

        static void Main (string[] args) {

            List<Dictionary<string, string>> assemblyNameSpaceTypeSummaryList = getStdLibAssemblyList();

            foreach (Dictionary<string, string> assemblyNameSpaceTypeDetailDict in assemblyNameSpaceTypeSummaryList)
            {
                {
                    Console.Write(assemblyNameSpaceTypeDetailDict[ASSEMBLY_NAME]);
                    Console.Write(FS);
                    Console.Write(assemblyNameSpaceTypeDetailDict[NAMESPACE_NAME]);
                    Console.Write(FS);
                    Console.Write(assemblyNameSpaceTypeDetailDict[TYPE_NAME]);
                }
                Console.WriteLine();
            }

            List<string> extLibAssemblyList = new List<string> {
                "Newtonsoft.Json"
            };

            List<Dictionary<string, string>> assemblyNameSpaceTypeSummaryList = getExtLibAssemblyList (extLibAssemblyList);

            foreach (Dictionary<string, string> assemblyNameSpaceTypeDetailDict in assemblyNameSpaceTypeSummaryList) {
                {
                    Console.Write (assemblyNameSpaceTypeDetailDict[ASSEMBLY_NAME]);
                    Console.Write (FS);
                    Console.Write (assemblyNameSpaceTypeDetailDict[NAMESPACE_NAME]);
                    Console.Write (FS);
                    Console.Write (assemblyNameSpaceTypeDetailDict[TYPE_NAME]);
                }
                Console.WriteLine ();
            }
        }
    }
}
