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

        private static string EMPTY = "";
        private static string SEPARATOR = " ";
        private static string FS = "\t";
        private static char RS = '\n';
        private static string STRING_JOINER = ",";
        private static string COLUMN_JOINER = "-";
        private static string GROUP_DIGIT = "{0:00000000}";
        private static string SUB_GROUP_DIGIT = "{0:000000}";
        private static string GROUP_SEQ_DIGIT = "{0:0000}";
        private static string GROUP = "グループ番号";
        private static string GROUP_SEQ = "グループシーケンス番号";
        private const string ASSEMBLY_NAME = "アセンブリ名";
        private const string NAMESPACE_NAME = "名前空間名";
        private static string TYPE_NAME = "型名";
        private static List<string> OUTPUT_COMMON_HEADER_LIST = new List<string> {
            GROUP,
            ASSEMBLY_NAME,
            NAMESPACE_NAME,
            TYPE_NAME,
            GROUP_SEQ
        };
        private static string PROPERTY_OF_STATIC = "スタティックプロパティ名";
        private static string PROPERTY_OF_STATIC_RETURN_TYPE_NAME = "スタティックプロパティ名の戻り値の型名";
        private static List<string> OUTPUT_STATIC_PROPERTY_HEADER_LIST = new List<string> {
            PROPERTY_OF_STATIC,
            PROPERTY_OF_STATIC_RETURN_TYPE_NAME
        };
        private static string PROPERTY_OF_INSTANCE = "インスタンスプロパティ名";
        private static string PROPERTY_OF_INSTANCE_RETURN_TYPE_NAME = "インスタンスプロパティ名の戻り値の型名";
        private static List<string> OUTPUT_INSTANCE_PROPERTY_HEADER_LIST = new List<string> {
            PROPERTY_OF_INSTANCE,
            PROPERTY_OF_INSTANCE_RETURN_TYPE_NAME
        };
        private static string METHOD_OF_STATIC_NAME = "スタティックメソッド名";
        private static string METHOD_OF_STATIC_RETURN_TYPE_NAME = "スタティックメソッドの戻り値の型名";
        private static string METHOD_OF_STATIC_PHONY_ARGUMENT_COUNT = "スタティックメソッドの仮引数の個数";
        private static string METHOD_OF_STATIC_PHONY_ARGUMENT_POSITION_NO = "スタティックメソッドの仮引数の位置番号";
        private static string METHOD_OF_STATIC_PHONY_ARGUMENT_VARIABLE_NAME = "スタティックメソッドの仮引数の変数名";
        private static string METHOD_OF_STATIC_PHONY_ARGUMENT_RETURN_TYPE_NAME = "スタティックメソッドの仮引数の型名";
        private static List<string> OUTPUT_STATIC_METHOD_HEADER_LIST = new List<string> {
            METHOD_OF_STATIC_NAME,
            METHOD_OF_STATIC_RETURN_TYPE_NAME,
            METHOD_OF_STATIC_PHONY_ARGUMENT_COUNT,
            METHOD_OF_STATIC_PHONY_ARGUMENT_POSITION_NO,
            METHOD_OF_STATIC_PHONY_ARGUMENT_VARIABLE_NAME,
            METHOD_OF_STATIC_PHONY_ARGUMENT_RETURN_TYPE_NAME
        };
        private static string METHOD_OF_INSTANCE_NAME = "インスタンスメソッド名";
        private static string METHOD_OF_INSTANCE_RETURN_TYPE_NAME = "インスタンスメソッドの戻り値の型名";
        private static string METHOD_OF_INSTANCE_PHONY_ARGUMENT_COUNT = "インスタンスメソッドの仮引数の個数";
        private static string METHOD_OF_INSTANCE_PHONY_ARGUMENT_POSITION_NO = "インスタンスメソッドの仮引数の位置番号";
        private static string METHOD_OF_INSTANCE_PHONY_ARGUMENT_VARIABLE_NAME = "インスタンスメソッドの仮引数の変数名";
        private static string METHOD_OF_INSTANCE_PHONY_ARGUMENT_RETURN_TYPE_NAME = "インスタンスメソッドの仮引数の型名";
        private static List<string> OUTPUT_INSTANCE_METHOD_HEADER_LIST = new List<string> {
            METHOD_OF_INSTANCE_NAME,
            METHOD_OF_INSTANCE_RETURN_TYPE_NAME,
            METHOD_OF_INSTANCE_PHONY_ARGUMENT_COUNT,
            METHOD_OF_INSTANCE_PHONY_ARGUMENT_POSITION_NO,
            METHOD_OF_INSTANCE_PHONY_ARGUMENT_VARIABLE_NAME,
            METHOD_OF_INSTANCE_PHONY_ARGUMENT_RETURN_TYPE_NAME
        };
        private const string DEFAULT_NONE_STRING_VALUE = "ないよーん";
        private static int DEFAULT_NONE_INT_VALUE = 0;
        private static List<string> DEFAULT_OUTPUT_HEADER_LIST = OUTPUT_INSTANCE_PROPERTY_HEADER_LIST;
        private static string DEFAULT_OPTION_VALUE = "--property-instance";
        private const string OPTION_PROPERTY_INSTANCE = "--property-instance";
        private const string OPTION_PROPERTY_STATIC = "--property-static";
        private const string OPTION_METHOD_INSTANCE = "--method-instance";
        private const string OPTION_METHOD_STATIC = "--method-static";

        //クラスのパブリックなスタティックプロパティを取得
        private static Dictionary<string, Dictionary<string, string>> getPropertyOfStaticSummaryInfoDict (Type type) {
            Dictionary<string, Dictionary<string, string>> propertyOfStaticSummaryInfoDict = new Dictionary<string, Dictionary<string, string>> ();

            int subgrp = 0;

            List<PropertyInfo> propertyInfoList = type.GetProperties (BindingFlags.Static | BindingFlags.Public).ToList ();

            foreach (PropertyInfo propertyInfo in propertyInfoList) {

                subgrp++;

                Dictionary<string, string> propertyOfStaticDetailInfoDict = new Dictionary<string, string> ();

                propertyOfStaticDetailInfoDict.Add (PROPERTY_OF_INSTANCE, propertyInfo.Name); //スタティックプロパティ名
                propertyOfStaticDetailInfoDict.Add (PROPERTY_OF_INSTANCE_RETURN_TYPE_NAME, propertyInfo.ToString ().Split (SEPARATOR) [0]); //スタティックプロパティ名の戻り値の型名

                propertyOfStaticSummaryInfoDict.Add (String.Format (SUB_GROUP_DIGIT, subgrp) + COLUMN_JOINER + type.FullName, propertyOfStaticDetailInfoDict);
            }

            return propertyOfStaticSummaryInfoDict;
        }

        //クラスのパブリックなインスタンスプロパティを取得
        private static Dictionary<string, Dictionary<string, string>> getPropertyOfInstanceSummaryInfoDict (Type type) {
            Dictionary<string, Dictionary<string, string>> propertyOfInstanceSummaryInfoDict = new Dictionary<string, Dictionary<string, string>> ();

            int subgrp = 0;

            List<PropertyInfo> propertyInfoList = type.GetProperties (BindingFlags.Instance | BindingFlags.Public).ToList ();

            foreach (PropertyInfo propertyInfo in propertyInfoList) {

                subgrp++;

                Dictionary<string, string> propertyOfInstanceDetailInfoDict = new Dictionary<string, string> ();

                propertyOfInstanceDetailInfoDict.Add (PROPERTY_OF_STATIC, propertyInfo.Name); //インスタンスプロパティ名
                propertyOfInstanceDetailInfoDict.Add (PROPERTY_OF_STATIC_RETURN_TYPE_NAME, propertyInfo.ToString ().Split (SEPARATOR) [0]); //インスタンスプロパティ名の戻り値の型名

                propertyOfInstanceSummaryInfoDict.Add (String.Format (SUB_GROUP_DIGIT, subgrp) + COLUMN_JOINER + type.FullName, propertyOfInstanceDetailInfoDict);
            }

            return propertyOfInstanceSummaryInfoDict;

        }

        // クラスのパブリックなスタティックメソッドを取得
        private static Dictionary<string, Dictionary<string, string>> getMethodOfStaticSummaryInfoDict (Type type) {
            Dictionary<string, Dictionary<string, string>> methodOfStaticSummaryInfoDict = new Dictionary<string, Dictionary<string, string>> ();

            int subgrp = 0;

            List<MethodInfo> methodOfStaticInfoList = type.GetMethods (BindingFlags.Static | BindingFlags.Public).ToList ();

            foreach (MethodInfo methodOfStaticInfo in methodOfStaticInfoList) {

                subgrp++;

                List<ParameterInfo> parameterOfStaticInfoList = methodOfStaticInfo.GetParameters ().ToList ();

                Dictionary<string, string> methodOfStaticDetailInfoDict = new Dictionary<string, string> ();

                methodOfStaticDetailInfoDict.Add (METHOD_OF_STATIC_NAME, methodOfStaticInfo.Name); //メソッド名
                methodOfStaticDetailInfoDict.Add (METHOD_OF_STATIC_RETURN_TYPE_NAME, methodOfStaticInfo.ReturnType.FullName); //メソッドの戻り値の型名

                if (parameterOfStaticInfoList.Count == 0) {
                    methodOfStaticDetailInfoDict.Add (METHOD_OF_STATIC_PHONY_ARGUMENT_COUNT, DEFAULT_NONE_INT_VALUE.ToString ()); //メソッドの仮引数の個数
                    methodOfStaticDetailInfoDict.Add (METHOD_OF_STATIC_PHONY_ARGUMENT_POSITION_NO, DEFAULT_NONE_STRING_VALUE); //メソッドの仮引数の位置番号
                    methodOfStaticDetailInfoDict.Add (METHOD_OF_STATIC_PHONY_ARGUMENT_VARIABLE_NAME, DEFAULT_NONE_STRING_VALUE); //メソッドの仮引数の変数名
                    methodOfStaticDetailInfoDict.Add (METHOD_OF_STATIC_PHONY_ARGUMENT_RETURN_TYPE_NAME, DEFAULT_NONE_STRING_VALUE); //メソッドの仮引数の型名
                } else {
                    methodOfStaticDetailInfoDict.Add (METHOD_OF_STATIC_PHONY_ARGUMENT_COUNT, string.Join (STRING_JOINER, parameterOfStaticInfoList.Count.ToString ())); //メソッドの仮引数の個数
                    methodOfStaticDetailInfoDict.Add (METHOD_OF_STATIC_PHONY_ARGUMENT_POSITION_NO, string.Join (STRING_JOINER, parameterOfStaticInfoList.Select (parameterInfo => parameterInfo.Position).ToArray ())); //メソッドの仮引数の位置番号
                    methodOfStaticDetailInfoDict.Add (METHOD_OF_STATIC_PHONY_ARGUMENT_VARIABLE_NAME, string.Join (STRING_JOINER, parameterOfStaticInfoList.Select (parameterInfo => parameterInfo.Name).ToArray ())); //メソッドの仮引数の変数名
                    methodOfStaticDetailInfoDict.Add (METHOD_OF_STATIC_PHONY_ARGUMENT_RETURN_TYPE_NAME, string.Join (STRING_JOINER, parameterOfStaticInfoList.Select (parameterInfo => parameterInfo.ParameterType.Name).ToArray ())); //メソッドの仮引数の型名
                }

                methodOfStaticSummaryInfoDict.Add (String.Format (SUB_GROUP_DIGIT, subgrp) + COLUMN_JOINER + type.FullName, methodOfStaticDetailInfoDict);
            }

            return methodOfStaticSummaryInfoDict;

        }

        // クラスのパブリックなインスタンスメソッドを取得
        private static Dictionary<string, Dictionary<string, string>> getMethodOfInstanceSummaryInfoDict (Type type) {
            Dictionary<string, Dictionary<string, string>> methodOfInstanceSummaryInfoDict = new Dictionary<string, Dictionary<string, string>> ();

            int subgrp = 0;

            List<MethodInfo> methodOfInstanceInfoList = type.GetMethods (BindingFlags.Instance | BindingFlags.Public).ToList ();

            foreach (MethodInfo methodOfInstanceInfo in methodOfInstanceInfoList) {

                subgrp++;

                List<ParameterInfo> parameterOfInstanceInfoList = methodOfInstanceInfo.GetParameters ().ToList ();

                Dictionary<string, string> methodOfInstanceDetailInfoDict = new Dictionary<string, string> ();

                methodOfInstanceDetailInfoDict.Add (METHOD_OF_INSTANCE_NAME, methodOfInstanceInfo.Name); //メソッド名
                methodOfInstanceDetailInfoDict.Add (METHOD_OF_INSTANCE_RETURN_TYPE_NAME, methodOfInstanceInfo.ReturnType.FullName); //メソッドの戻り値の型名

                if (parameterOfInstanceInfoList.Count == 0) {
                    methodOfInstanceDetailInfoDict.Add (METHOD_OF_INSTANCE_PHONY_ARGUMENT_COUNT, DEFAULT_NONE_INT_VALUE.ToString ()); //メソッドの仮引数の個数
                    methodOfInstanceDetailInfoDict.Add (METHOD_OF_INSTANCE_PHONY_ARGUMENT_POSITION_NO, DEFAULT_NONE_STRING_VALUE); //メソッドの仮引数の位置番号
                    methodOfInstanceDetailInfoDict.Add (METHOD_OF_INSTANCE_PHONY_ARGUMENT_VARIABLE_NAME, DEFAULT_NONE_STRING_VALUE); //メソッドの仮引数の変数名
                    methodOfInstanceDetailInfoDict.Add (METHOD_OF_INSTANCE_PHONY_ARGUMENT_RETURN_TYPE_NAME, DEFAULT_NONE_STRING_VALUE); //メソッドの仮引数の型名
                } else {
                    methodOfInstanceDetailInfoDict.Add (METHOD_OF_INSTANCE_PHONY_ARGUMENT_COUNT, string.Join (STRING_JOINER, parameterOfInstanceInfoList.Count.ToString ())); //メソッドの仮引数の個数
                    methodOfInstanceDetailInfoDict.Add (METHOD_OF_INSTANCE_PHONY_ARGUMENT_POSITION_NO, string.Join (STRING_JOINER, parameterOfInstanceInfoList.Select (parameterInfo => parameterInfo.Position).ToArray ())); //メソッドの仮引数の位置番号
                    methodOfInstanceDetailInfoDict.Add (METHOD_OF_INSTANCE_PHONY_ARGUMENT_VARIABLE_NAME, string.Join (STRING_JOINER, parameterOfInstanceInfoList.Select (parameterInfo => parameterInfo.Name).ToArray ())); //メソッドの仮引数の変数名
                    methodOfInstanceDetailInfoDict.Add (METHOD_OF_INSTANCE_PHONY_ARGUMENT_RETURN_TYPE_NAME, string.Join (STRING_JOINER, parameterOfInstanceInfoList.Select (parameterInfo => parameterInfo.ParameterType.Name).ToArray ())); //メソッドの仮引数の型名
                }

                methodOfInstanceSummaryInfoDict.Add (String.Format (SUB_GROUP_DIGIT, subgrp) + COLUMN_JOINER + type.FullName, methodOfInstanceDetailInfoDict);
            }

            return methodOfInstanceSummaryInfoDict;

        }

        private static Dictionary<string, List<Type>> getStdLibTypeList () {
            //デフォルトの標準ライブラリのみ

            Dictionary<string, List<Type>> assemblyTypeDict = new Dictionary<string, List<Type>> ();

            List<Assembly> stdlibAssemblyList = AppDomain.CurrentDomain.GetAssemblies ().ToList ();

            foreach (Assembly assembly in stdlibAssemblyList) {

                string assemblyName = assembly.GetName ().Name;

                List<Type> typeList = assembly.GetTypes ().ToList ();

                assemblyTypeDict.Add (assemblyName, typeList);

            }
            return assemblyTypeDict;
        }

        private static Dictionary<string, List<Type>> getExtLibAssemblyList (List<string> extLibAssemblyList) {
            //外部ライブラリ指定
            Dictionary<string, List<Type>> assemblyTypeDict = new Dictionary<string, List<Type>> ();

            foreach (string extLibAssembly in extLibAssemblyList) {

                Assembly assembly = Assembly.Load (extLibAssembly);

                string assemblyName = assembly.GetName ().Name;

                List<Type> typeList = assembly.GetTypes ().ToList ();

                assemblyTypeDict.Add (assemblyName, typeList);
            }
            return assemblyTypeDict;
        }

        private static void Usage (string appName) {
            Console.WriteLine (EMPTY +
                // "\nOption:" + String.Join (SEPARATOR, OPTION_LIST.ToArray ()) +
                RS +
                "\nUsage:" +
                RS +
                // "\n  CMD: " + appName + SEPARATOR + USAGE_SAMPLE_ARGUMENT +
                RS +
                RS
            );

            Environment.Exit (0);
        }

        static void Main (string[] args) {

            string appName = Environment.GetCommandLineArgs () [0];
            appName = Regex.Replace (appName, ".*/", EMPTY); //ファイル名のみにする
            appName = Regex.Replace (appName, "\\..*", EMPTY); //拡張子を取り除く

            List<string> cmdLineArgs = args.ToList ();

            Dictionary<string, List<Type>> stdLibTypeDict = getStdLibTypeList ();

            foreach (string assemblyName in stdLibTypeDict.Keys) {

                // Console.WriteLine(assemblyName);

                foreach (Type type in stdLibTypeDict[assemblyName]) {

                    Dictionary<string, Dictionary<string, string>> summaryMap = null;

                    DEFAULT_OPTION_VALUE = OPTION_METHOD_INSTANCE;

                    switch (DEFAULT_OPTION_VALUE) {

                        case OPTION_PROPERTY_STATIC:
                            summaryMap = getPropertyOfStaticSummaryInfoDict (type);
                            break;
                        case OPTION_PROPERTY_INSTANCE:
                            summaryMap = getPropertyOfInstanceSummaryInfoDict (type);
                            break;
                        case OPTION_METHOD_STATIC:
                            summaryMap = getMethodOfStaticSummaryInfoDict (type);
                            break;
                        case OPTION_METHOD_INSTANCE:
                            summaryMap = getMethodOfInstanceSummaryInfoDict (type);
                            break;
                        default:
                            Usage (appName);
                            break;
                    }


                    foreach (string rowNum in summaryMap.Keys) {

                        Dictionary<string, string> detailMap = summaryMap[rowNum];

                        {
                            Console.Write (assemblyName);
                            Console.Write (FS);
                            Console.Write (type.Namespace == null ? DEFAULT_NONE_STRING_VALUE : type.Namespace);
                            Console.Write (FS);
                            Console.Write (type.FullName);
                            Console.Write (FS);
                            Console.Write (detailMap[METHOD_OF_INSTANCE_NAME]);
                            Console.Write (FS);
                            Console.Write (detailMap[METHOD_OF_INSTANCE_RETURN_TYPE_NAME]);
                            Console.Write (FS);
                            Console.Write (detailMap[METHOD_OF_INSTANCE_PHONY_ARGUMENT_COUNT]);
                            Console.Write (FS);
                            Console.Write (detailMap[METHOD_OF_INSTANCE_PHONY_ARGUMENT_POSITION_NO]);
                            Console.Write (FS);
                            Console.Write (detailMap[METHOD_OF_INSTANCE_PHONY_ARGUMENT_VARIABLE_NAME]);
                            Console.Write (FS);
                            Console.Write (detailMap[METHOD_OF_INSTANCE_PHONY_ARGUMENT_RETURN_TYPE_NAME]);
                        }
                        Console.WriteLine ();

                    }

                }

            }

            // List<Dictionary<string, string>> assemblyNameSpaceTypeSummaryList = getStdLibAssemblyList ();

            // foreach (Dictionary<string, string> assemblyNameSpaceTypeDetailDict in assemblyNameSpaceTypeSummaryList) {

            //     {
            //         Console.Write (assemblyNameSpaceTypeDetailDict[ASSEMBLY_NAME]);
            //         Console.Write (FS);
            //         Console.Write (assemblyNameSpaceTypeDetailDict[NAMESPACE_NAME]);
            //         Console.Write (FS);
            //         Console.Write (assemblyNameSpaceTypeDetailDict[TYPE_NAME]);

            //         Type type = Type.GetType(assemblyNameSpaceTypeDetailDict[TYPE_NAME]);

            //         if(type ==  null){
            //             Console.WriteLine("NULLLLLLLLLLLLLLL");
            //         }else{
            //             Console.WriteLine("YESSSSSSSSSSSSSSS");
            //         }

            //     }
            //     Console.WriteLine ();
            // }

            // List<string> extLibAssemblyList = new List<string> {
            //     "Newtonsoft.Json"
            // };

            // List<Dictionary<string, string>> assemblyNameSpaceTypeSummaryList = getExtLibAssemblyList (extLibAssemblyList);

            // foreach (Dictionary<string, string> assemblyNameSpaceTypeDetailDict in assemblyNameSpaceTypeSummaryList) {
            //     {
            //         Console.Write (assemblyNameSpaceTypeDetailDict[ASSEMBLY_NAME]);
            //         Console.Write (FS);
            //         Console.Write (assemblyNameSpaceTypeDetailDict[NAMESPACE_NAME]);
            //         Console.Write (FS);
            //         Console.Write (assemblyNameSpaceTypeDetailDict[TYPE_NAME]);
            //     }
            //     Console.WriteLine ();
            // }
        }
    }
}
