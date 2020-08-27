using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.Remoting;
using System.Text.RegularExpressions;

//https://docs.microsoft.com/en-us/dotnet/api/system.activator.createinstance?redirectedfrom=MSDN&view=netcore-3.1#System_Activator_CreateInstance_System_String_System_String_

// https://www.it-swarm.dev/ja/c%23/typegettype%EF%BC%88-namespaceabclassname%EF%BC%89%E3%81%AFnull%E3%82%92%E8%BF%94%E3%81%97%E3%81%BE%E3%81%99/968571891/

// https://answers.unity.com/questions/206665/typegettypestring-does-not-work-in-unity.html

namespace app {
    class Program {

        //https://www.it-swarm.dev/ja/c%23/%E3%83%AA%E3%83%95%E3%83%AC%E3%82%AF%E3%82%B7%E3%83%A7%E3%83%B3%E3%82%92%E4%BB%8B%E3%81%97%E3%81%A6%E5%90%8D%E5%89%8D%E7%A9%BA%E9%96%93%E3%81%AE%E3%81%99%E3%81%B9%E3%81%A6%E3%81%AE%E5%9E%8B%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B/957386241/
        private static List<Type> CURRENT_ASSEMBLY_LIST = AppDomain.CurrentDomain.GetAssemblies().SelectMany(type =>type.GetTypes()).ToList();

        static void Main (string[] args) {

            String typeName ="System.DateTime";

            foreach(Type type in CURRENT_ASSEMBLY_LIST){
                if(type.FullName == typeName){
                    Console.WriteLine(type.FullName);
                }
            }
        }
    }
}
