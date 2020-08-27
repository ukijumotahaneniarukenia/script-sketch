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
            ASSEMBLY_NAME,
            NAMESPACE_NAME,
            TYPE_NAME
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
        private const string OPTION_INTERNAL_LIB = "--internal-lib";
        private const string OPTION_EXTERNAL_LIB = "--external-lib";
        private static string DEFAULT_PATTERN = OPTION_INTERNAL_LIB;
        private const string OPTION_PROPERTY_INSTANCE = "--property-instance";
        private const string OPTION_PROPERTY_STATIC = "--property-static";
        private const string OPTION_METHOD_INSTANCE = "--method-instance";
        private const string OPTION_METHOD_STATIC = "--method-static";
        private static string DEFAULT_OPTION_VALUE = OPTION_PROPERTY_INSTANCE;

        private static List<string> OPTION_LIST = new List<string> {
            OPTION_PROPERTY_INSTANCE,
            OPTION_PROPERTY_STATIC,
            OPTION_METHOD_INSTANCE,
            OPTION_METHOD_STATIC
        };
        private static string USAGE_SAMPLE_ARGUMENT = "System.DateTime";
        private static List<string> USAGE_SAMPLE_ARGUMENT_LIST = new List<string> {
            "System.DateTime",
            "System.Text.NormalizationForm",
            "System.Text.Rune",
            "Newtonsoft.Json"
        };

        //クラスのパブリックなスタティックプロパティを取得
        private static Dictionary<string, Dictionary<string, string>> getPropertyOfStaticSummaryInfoDict (Type type) {
            Dictionary<string, Dictionary<string, string>> propertyOfStaticSummaryInfoDict = new Dictionary<string, Dictionary<string, string>> ();

            int subgrp = 0;

            List<PropertyInfo> propertyInfoList = type.GetProperties (BindingFlags.Static | BindingFlags.Public).ToList ();

            foreach (PropertyInfo propertyInfo in propertyInfoList) {

                subgrp++;

                Dictionary<string, string> propertyOfStaticDetailInfoDict = new Dictionary<string, string> ();

                propertyOfStaticDetailInfoDict.Add (PROPERTY_OF_STATIC, propertyInfo.Name); //スタティックプロパティ名
                propertyOfStaticDetailInfoDict.Add (PROPERTY_OF_STATIC_RETURN_TYPE_NAME, propertyInfo.ToString ().Split (SEPARATOR) [0]); //スタティックプロパティ名の戻り値の型名

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

                propertyOfInstanceDetailInfoDict.Add (PROPERTY_OF_INSTANCE, propertyInfo.Name); //インスタンスプロパティ名
                propertyOfInstanceDetailInfoDict.Add (PROPERTY_OF_INSTANCE_RETURN_TYPE_NAME, propertyInfo.ToString ().Split (SEPARATOR) [0]); //インスタンスプロパティ名の戻り値の型名

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

        private static Dictionary<string, List<Type>> getExtLibTypeList (HashSet<string> extLibAssemblyHashSet) {
            //外部ライブラリ指定
            Dictionary<string, List<Type>> assemblyTypeDict = new Dictionary<string, List<Type>> ();

            foreach (string extLibAssembly in extLibAssemblyHashSet) {

                Assembly assembly = Assembly.Load (extLibAssembly);

                string assemblyName = assembly.GetName ().Name;

                List<Type> typeList = assembly.GetTypes ().ToList ();

                assemblyTypeDict.Add (assemblyName, typeList);
            }
            return assemblyTypeDict;
        }

        private static void Usage (string appName) {
            Console.WriteLine (EMPTY +
                "\nOption:" + String.Join (SEPARATOR, OPTION_LIST.ToArray ()) +
                RS +
                "\nUsage:" +
                RS +
                "\n  CMD: " + appName + SEPARATOR + USAGE_SAMPLE_ARGUMENT +
                RS +
                "\n    or" +
                "\n  CMD: " + appName + SEPARATOR + USAGE_SAMPLE_ARGUMENT + SEPARATOR + OPTION_METHOD_INSTANCE +
                RS +
                "\n    or" +
                RS +
                "\n  CMD: " + appName + SEPARATOR + String.Join (SEPARATOR, USAGE_SAMPLE_ARGUMENT_LIST.ToArray ()) +
                RS
            );

            Environment.Exit (0);
        }

        private static void outputHeader (List<string> defaultOutputHeaderList) {
            //header
            {
                {
                    Console.Write (String.Join (FS, OUTPUT_COMMON_HEADER_LIST.ToArray ()));
                    Console.Write (FS);
                    Console.Write (String.Join (FS, defaultOutputHeaderList.ToArray ()));
                }
                Console.WriteLine ();
            }
        }

        private static void outputPropertyOfStaticSummaryInfoDict (string assemblyName, Type type, Dictionary<string, Dictionary<string, string>> summaryDict) {
            //body
            foreach (string rowNum in summaryDict.Keys) {

                Dictionary<string, string> detailDict = summaryDict[rowNum];

                {
                    Console.Write (assemblyName);
                    Console.Write (FS);
                    Console.Write (type.Namespace == null ? DEFAULT_NONE_STRING_VALUE : type.Namespace);
                    Console.Write (FS);
                    Console.Write (type.FullName);
                    Console.Write (FS);
                    Console.Write (detailDict[PROPERTY_OF_STATIC]);
                    Console.Write (FS);
                    Console.Write (detailDict[PROPERTY_OF_STATIC_RETURN_TYPE_NAME]);
                }
                Console.WriteLine ();

            }
        }

        private static void outputPropertyOfInstanceSummaryInfoDict (string assemblyName, Type type, Dictionary<string, Dictionary<string, string>> summaryDict) {
            //body
            foreach (string rowNum in summaryDict.Keys) {

                Dictionary<string, string> detailDict = summaryDict[rowNum];

                {
                    Console.Write (assemblyName);
                    Console.Write (FS);
                    Console.Write (type.Namespace == null ? DEFAULT_NONE_STRING_VALUE : type.Namespace);
                    Console.Write (FS);
                    Console.Write (type.FullName);
                    Console.Write (FS);
                    Console.Write (detailDict[PROPERTY_OF_INSTANCE]);
                    Console.Write (FS);
                    Console.Write (detailDict[PROPERTY_OF_INSTANCE_RETURN_TYPE_NAME]);
                }
                Console.WriteLine ();

            }
        }

        private static void outputMethodOfStaticSummaryInfoDict (string assemblyName, Type type, Dictionary<string, Dictionary<string, string>> summaryDict) {
            //body
            foreach (string rowNum in summaryDict.Keys) {

                Dictionary<string, string> detailDict = summaryDict[rowNum];

                {
                    Console.Write (assemblyName);
                    Console.Write (FS);
                    Console.Write (type.Namespace == null ? DEFAULT_NONE_STRING_VALUE : type.Namespace);
                    Console.Write (FS);
                    Console.Write (type.FullName);
                    Console.Write (FS);
                    Console.Write (detailDict[METHOD_OF_STATIC_NAME]);
                    Console.Write (FS);
                    Console.Write (detailDict[METHOD_OF_STATIC_RETURN_TYPE_NAME]);
                    Console.Write (FS);
                    Console.Write (detailDict[METHOD_OF_STATIC_PHONY_ARGUMENT_COUNT]);
                    Console.Write (FS);
                    Console.Write (detailDict[METHOD_OF_STATIC_PHONY_ARGUMENT_POSITION_NO]);
                    Console.Write (FS);
                    Console.Write (detailDict[METHOD_OF_STATIC_PHONY_ARGUMENT_VARIABLE_NAME]);
                    Console.Write (FS);
                    Console.Write (detailDict[METHOD_OF_STATIC_PHONY_ARGUMENT_RETURN_TYPE_NAME]);
                }
                Console.WriteLine ();

            }
        }
        private static void outputMethodOfInstanceSummaryInfoDict (string assemblyName, Type type, Dictionary<string, Dictionary<string, string>> summaryDict) {
            //body
            foreach (string rowNum in summaryDict.Keys) {

                Dictionary<string, string> detailDict = summaryDict[rowNum];

                {
                    Console.Write (assemblyName);
                    Console.Write (FS);
                    Console.Write (type.Namespace == null ? DEFAULT_NONE_STRING_VALUE : type.Namespace);
                    Console.Write (FS);
                    Console.Write (type.FullName);
                    Console.Write (FS);
                    Console.Write (detailDict[METHOD_OF_INSTANCE_NAME]);
                    Console.Write (FS);
                    Console.Write (detailDict[METHOD_OF_INSTANCE_RETURN_TYPE_NAME]);
                    Console.Write (FS);
                    Console.Write (detailDict[METHOD_OF_INSTANCE_PHONY_ARGUMENT_COUNT]);
                    Console.Write (FS);
                    Console.Write (detailDict[METHOD_OF_INSTANCE_PHONY_ARGUMENT_POSITION_NO]);
                    Console.Write (FS);
                    Console.Write (detailDict[METHOD_OF_INSTANCE_PHONY_ARGUMENT_VARIABLE_NAME]);
                    Console.Write (FS);
                    Console.Write (detailDict[METHOD_OF_INSTANCE_PHONY_ARGUMENT_RETURN_TYPE_NAME]);
                }
                Console.WriteLine ();

            }
        }

        private static void showInternalLibInfo (string appName,HashSet<string> targetTypeNameHashSet) {

            Dictionary<string, List<Type>> stdLibTypeDict = getStdLibTypeList ();

            //header
            outputHeader (DEFAULT_OUTPUT_HEADER_LIST);

            //body
            foreach (string assemblyName in stdLibTypeDict.Keys) {

                //フィルタリング機能が必要
                foreach (Type type in stdLibTypeDict[assemblyName]) {

                    Dictionary<string, Dictionary<string, string>> summaryDict = null;

                    DEFAULT_OPTION_VALUE = OPTION_METHOD_INSTANCE;

                    switch (DEFAULT_OPTION_VALUE) {

                        case OPTION_PROPERTY_STATIC:
                            summaryDict = getPropertyOfStaticSummaryInfoDict (type);
                            outputPropertyOfStaticSummaryInfoDict (assemblyName, type, summaryDict);
                            break;
                        case OPTION_PROPERTY_INSTANCE:
                            summaryDict = getPropertyOfInstanceSummaryInfoDict (type);
                            outputPropertyOfInstanceSummaryInfoDict (assemblyName, type, summaryDict);
                            break;
                        case OPTION_METHOD_STATIC:
                            summaryDict = getMethodOfStaticSummaryInfoDict (type);
                            outputMethodOfStaticSummaryInfoDict (assemblyName, type, summaryDict);
                            break;
                        case OPTION_METHOD_INSTANCE:
                            summaryDict = getMethodOfInstanceSummaryInfoDict (type);
                            outputMethodOfInstanceSummaryInfoDict (assemblyName, type, summaryDict);
                            break;
                        default:
                            Usage (appName);
                            break;
                    }
                }
            }
        }

        private static void showExternalLibInfo (string appName,HashSet<string> targetTypeNameHashSet) {

            // List<string> extLibAssemblyList = new List<string> {
            //     "Newtonsoft.Json"
            // };

            Dictionary<string, List<Type>> extLibTypeDict = getExtLibTypeList (targetTypeNameHashSet);

            foreach (string assemblyName in extLibTypeDict.Keys) {

                //フィルタリング機能が必要
                foreach (Type type in extLibTypeDict[assemblyName]) {

                    Dictionary<string, Dictionary<string, string>> summaryDict = null;

                    DEFAULT_OPTION_VALUE = OPTION_PROPERTY_STATIC;

                    switch (DEFAULT_OPTION_VALUE) {

                        case OPTION_PROPERTY_STATIC:
                            summaryDict = getPropertyOfStaticSummaryInfoDict (type);
                            outputPropertyOfStaticSummaryInfoDict (assemblyName, type, summaryDict);
                            break;
                        case OPTION_PROPERTY_INSTANCE:
                            summaryDict = getPropertyOfInstanceSummaryInfoDict (type);
                            outputPropertyOfInstanceSummaryInfoDict (assemblyName, type, summaryDict);
                            break;
                        case OPTION_METHOD_STATIC:
                            summaryDict = getMethodOfStaticSummaryInfoDict (type);
                            outputMethodOfStaticSummaryInfoDict (assemblyName, type, summaryDict);
                            break;
                        case OPTION_METHOD_INSTANCE:
                            summaryDict = getMethodOfInstanceSummaryInfoDict (type);
                            outputMethodOfInstanceSummaryInfoDict (assemblyName, type, summaryDict);
                            break;
                        default:
                            Usage (appName);
                            break;
                    }
                }
            }
        }

        static void Main (string[] args) {

            string appName = Environment.GetCommandLineArgs () [0];
            appName = Regex.Replace (appName, ".*/", EMPTY); //ファイル名のみにする
            appName = Regex.Replace (appName, "\\..*", EMPTY); //拡張子を取り除く

            List<string> cmdLineArgs = args.ToList ();

            HashSet<string> targetTypeNameHashSet = new HashSet<string> ();

            //オプション引数が指定したもの以外にマッチした場合は早期リターン オプションリスト作って除外

            if (cmdLineArgs.Count == 0) {

                //パイプ経由からの入力の場合
                if (!Console.IsInputRedirected) {
                    //パイプ経由からの入力がない場合
                    Usage (appName);

                }

                string line;
                int rowNum = 0;

                Dictionary<int, List<string>> map = new Dictionary<int, List<string>> ();

                while ((line = Console.ReadLine ()) != null) {
                    //標準入力からの文字列を読み込み、空文字列でない限り、繰り返し処理
                    rowNum++;
                    map.Add (rowNum, line.Split (SEPARATOR).ToList ());
                }

                if (map.Count != 1) {
                    //単一行でない場合
                    Usage (appName);
                }

                foreach (string arg in map[1]) {
                    switch (arg) {
                        case OPTION_INTERNAL_LIB:
                            DEFAULT_PATTERN = OPTION_INTERNAL_LIB;
                            break;
                        case OPTION_EXTERNAL_LIB:
                            DEFAULT_PATTERN = OPTION_EXTERNAL_LIB;
                            break;
                        case OPTION_PROPERTY_STATIC:
                            DEFAULT_OPTION_VALUE = OPTION_PROPERTY_STATIC;
                            DEFAULT_OUTPUT_HEADER_LIST = OUTPUT_STATIC_PROPERTY_HEADER_LIST;
                            break;
                        case OPTION_PROPERTY_INSTANCE:
                            DEFAULT_OPTION_VALUE = OPTION_PROPERTY_INSTANCE;
                            DEFAULT_OUTPUT_HEADER_LIST = OUTPUT_INSTANCE_PROPERTY_HEADER_LIST;
                            break;
                        case OPTION_METHOD_STATIC:
                            DEFAULT_OPTION_VALUE = OPTION_METHOD_STATIC;
                            DEFAULT_OUTPUT_HEADER_LIST = OUTPUT_STATIC_METHOD_HEADER_LIST;
                            break;
                        case OPTION_METHOD_INSTANCE:
                            DEFAULT_OPTION_VALUE = OPTION_METHOD_INSTANCE;
                            DEFAULT_OUTPUT_HEADER_LIST = OUTPUT_INSTANCE_METHOD_HEADER_LIST;
                            break;
                        default:
                            //TODO
                            targetTypeNameHashSet.Add (arg);
                            break;
                    }
                }

            } else {
                foreach (string arg in cmdLineArgs) {
                    switch (arg) {
                        case OPTION_INTERNAL_LIB:
                            DEFAULT_PATTERN = OPTION_INTERNAL_LIB;
                            break;
                        case OPTION_EXTERNAL_LIB:
                            DEFAULT_PATTERN = OPTION_EXTERNAL_LIB;
                            break;
                        case OPTION_PROPERTY_STATIC:
                            DEFAULT_OPTION_VALUE = OPTION_PROPERTY_STATIC;
                            DEFAULT_OUTPUT_HEADER_LIST = OUTPUT_STATIC_PROPERTY_HEADER_LIST;
                            break;
                        case OPTION_PROPERTY_INSTANCE:
                            DEFAULT_OPTION_VALUE = OPTION_PROPERTY_INSTANCE;
                            DEFAULT_OUTPUT_HEADER_LIST = OUTPUT_INSTANCE_PROPERTY_HEADER_LIST;
                            break;
                        case OPTION_METHOD_STATIC:
                            DEFAULT_OPTION_VALUE = OPTION_METHOD_STATIC;
                            DEFAULT_OUTPUT_HEADER_LIST = OUTPUT_STATIC_METHOD_HEADER_LIST;
                            break;
                        case OPTION_METHOD_INSTANCE:
                            DEFAULT_OPTION_VALUE = OPTION_METHOD_INSTANCE;
                            DEFAULT_OUTPUT_HEADER_LIST = OUTPUT_INSTANCE_METHOD_HEADER_LIST;
                            break;
                        default:
                            //TODO
                            targetTypeNameHashSet.Add (arg);
                            break;
                    }
                }
            }
        }
    }
}
