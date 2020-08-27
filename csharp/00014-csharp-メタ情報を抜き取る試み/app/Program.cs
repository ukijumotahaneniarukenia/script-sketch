using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.Remoting;
using System.Text.RegularExpressions;

namespace app {

    class Program {

        private static List<Type> CURRENT_FULL_NAME_TYPE_LIST = AppDomain.CurrentDomain.GetAssemblies().SelectMany(type =>type.GetTypes()).ToList();
        private static string USAGE_SAMPLE_ARGUMENT = "System.DateTime";
        private static List<string> USAGE_SAMPLE_ARGUMENT_LIST = new List<string> {
            "System.DateTime"
            ,"System.Text.NormalizationForm"
            ,"System.Text.Rune"
        };
        private static string EMPTY = "";
        private static string SEPARATOR = " ";
        private static string FS = "\t";
        private static char RS = '\n';
        private static string STRING_JOINER = ",";
        private static string GROUP_DIGIT = "{0:00000000}";
        private static string GROUP_SEQ_DIGIT = "{0:00000}";

        private static string GROUP = "グループ番号";
        private static string GROUP_SEQ = "グループシーケンス番号";
        private static string TYPE_NAME = "型名";
        private static List<string> OUTPUT_COMMON_HEADER_LIST = new List<string>{
            GROUP
            ,TYPE_NAME
            ,GROUP_SEQ
        };

        private static string PROPERTY_OF_STATIC = "スタティックプロパティ名";
        private static string PROPERTY_OF_STATIC_RETURN_TYPE_NAME = "スタティックプロパティ名の戻り値の型名";
        private static List<string> OUTPUT_STATIC_PROPERTY_HEADER_LIST = new List<string>{
            PROPERTY_OF_STATIC
            ,PROPERTY_OF_STATIC_RETURN_TYPE_NAME
        };

        private static string PROPERTY_OF_INSTANCE = "インスタンスプロパティ名";
        private static string PROPERTY_OF_INSTANCE_RETURN_TYPE_NAME = "インスタンスプロパティ名の戻り値の型名";
        private static List<string> OUTPUT_INSTANCE_PROPERTY_HEADER_LIST = new List<string>{
            PROPERTY_OF_INSTANCE
            ,PROPERTY_OF_INSTANCE_RETURN_TYPE_NAME
        };
        private static string METHOD_OF_STATIC_NAME = "スタティックメソッド名";
        private static string METHOD_OF_STATIC_RETURN_TYPE_NAME = "スタティックメソッドの戻り値の型名";
        private static string METHOD_OF_STATIC_PHONY_ARGUMENT_COUNT = "スタティックメソッドの仮引数の個数";
        private static string METHOD_OF_STATIC_PHONY_ARGUMENT_POSITION_NO = "スタティックメソッドの仮引数の位置番号";
        private static string METHOD_OF_STATIC_PHONY_ARGUMENT_VARIABLE_NAME = "スタティックメソッドの仮引数の変数名";
        private static string METHOD_OF_STATIC_PHONY_ARGUMENT_RETURN_TYPE_NAME = "スタティックメソッドの仮引数の型名";
        private static List<string> OUTPUT_STATIC_METHOD_HEADER_LIST = new List<string>{
            METHOD_OF_STATIC_NAME
            ,METHOD_OF_STATIC_RETURN_TYPE_NAME
            ,METHOD_OF_STATIC_PHONY_ARGUMENT_COUNT
            ,METHOD_OF_STATIC_PHONY_ARGUMENT_POSITION_NO
            ,METHOD_OF_STATIC_PHONY_ARGUMENT_VARIABLE_NAME
            ,METHOD_OF_STATIC_PHONY_ARGUMENT_RETURN_TYPE_NAME
        };

        private static string METHOD_OF_INSTANCE_NAME = "インスタンスメソッド名";
        private static string METHOD_OF_INSTANCE_RETURN_TYPE_NAME = "インスタンスメソッドの戻り値の型名";
        private static string METHOD_OF_INSTANCE_PHONY_ARGUMENT_COUNT = "インスタンスメソッドの仮引数の個数";
        private static string METHOD_OF_INSTANCE_PHONY_ARGUMENT_POSITION_NO = "インスタンスメソッドの仮引数の位置番号";
        private static string METHOD_OF_INSTANCE_PHONY_ARGUMENT_VARIABLE_NAME = "インスタンスメソッドの仮引数の変数名";
        private static string METHOD_OF_INSTANCE_PHONY_ARGUMENT_RETURN_TYPE_NAME = "インスタンスメソッドの仮引数の型名";

        private static List<string> OUTPUT_INSTANCE_METHOD_HEADER_LIST = new List<string>{
            METHOD_OF_INSTANCE_NAME
            ,METHOD_OF_INSTANCE_RETURN_TYPE_NAME
            ,METHOD_OF_INSTANCE_PHONY_ARGUMENT_COUNT
            ,METHOD_OF_INSTANCE_PHONY_ARGUMENT_POSITION_NO
            ,METHOD_OF_INSTANCE_PHONY_ARGUMENT_VARIABLE_NAME
            ,METHOD_OF_INSTANCE_PHONY_ARGUMENT_RETURN_TYPE_NAME
        };

        private static int DEFAULT_NONE_INT_VALUE = 0;
        private static string DEFAULT_NONE_STRING_VALUE = "ないよーん";
        private static List<string> DEFAULT_OUTPUT_HEADER_LIST = OUTPUT_INSTANCE_PROPERTY_HEADER_LIST;
        private static string DEFAULT_OPTION_VALUE = "--property-instance";
        private const string OPTION_PROPERTY_INSTANCE = "--property-instance";
        private const string OPTION_PROPERTY_STATIC = "--property-static";
        private const string OPTION_METHOD_INSTANCE = "--method-instance";
        private const string OPTION_METHOD_STATIC = "--method-static";
        private static List<string> OPTION_LIST = new List<string> {
            OPTION_PROPERTY_INSTANCE,
            OPTION_PROPERTY_STATIC,
            OPTION_METHOD_INSTANCE,
            OPTION_METHOD_STATIC
        };

        private static Dictionary<string, Dictionary<string, Dictionary<string, string>>> getPropertyOfStaticSummaryInfoDict (HashSet<string> typeNameSet) {

            Dictionary<string, Dictionary<string, Dictionary<string, string>>> propertyOfStaticSummaryInfoByTypeDict = new Dictionary<string, Dictionary<string, Dictionary<string, string>>> ();

            foreach (string typeName in typeNameSet) {

                Type type = Type.GetType (typeName); //名前空間からのクラス名までのフル名

                //クラスのパブリックなスタティックプロパティを取得
                Dictionary<string, Dictionary<string, string>> propertyOfStaticSummaryInfoDict = new Dictionary<string, Dictionary<string, string>> ();

                int grpseq = 0;

                PropertyInfo[] propertyInfoList = type.GetProperties (BindingFlags.Static | BindingFlags.Public);

                foreach (PropertyInfo propertyInfo in propertyInfoList) {
                    grpseq++;

                    Dictionary<string, string> propertyOfStaticDetailInfoDict = new Dictionary<string, string> ();

                    propertyOfStaticDetailInfoDict.Add (PROPERTY_OF_INSTANCE, propertyInfo.Name); //スタティックプロパティ名
                    propertyOfStaticDetailInfoDict.Add (PROPERTY_OF_INSTANCE_RETURN_TYPE_NAME, propertyInfo.ToString ().Split (SEPARATOR) [0]); //スタティックプロパティ名の戻り値の型名

                    propertyOfStaticSummaryInfoDict.Add (String.Format (GROUP_SEQ_DIGIT, grpseq), propertyOfStaticDetailInfoDict);
                }

                propertyOfStaticSummaryInfoByTypeDict.Add (typeName, propertyOfStaticSummaryInfoDict);
            }

            return propertyOfStaticSummaryInfoByTypeDict;
        }

        private static Dictionary<string, Dictionary<string, Dictionary<string, string>>> getPropertyOfInstanceSummaryInfoDict (HashSet<String> typeNameSet) {

            Dictionary<string, Dictionary<string, Dictionary<string, string>>> propertyOfInstanceSummaryInfoByTypeDict = new Dictionary<string, Dictionary<string, Dictionary<string, string>>> ();

            foreach (string typeName in typeNameSet) {

                Type type = Type.GetType (typeName); //名前空間からのクラス名までのフル名

                //クラスのパブリックなインスタンスプロパティを取得
                Dictionary<string, Dictionary<string, string>> propertyOfInstanceSummaryInfoDict = new Dictionary<string, Dictionary<string, string>> ();

                int grpseq = 0;

                PropertyInfo[] propertyInfoList = type.GetProperties (BindingFlags.Instance | BindingFlags.Public);

                foreach (PropertyInfo propertyInfo in propertyInfoList) {
                    grpseq++;

                    Dictionary<string, string> propertyOfInstanceDetailInfoDict = new Dictionary<string, string> ();

                    propertyOfInstanceDetailInfoDict.Add (PROPERTY_OF_STATIC, propertyInfo.Name); //インスタンスプロパティ名
                    propertyOfInstanceDetailInfoDict.Add (PROPERTY_OF_STATIC_RETURN_TYPE_NAME, propertyInfo.ToString ().Split (SEPARATOR) [0]); //インスタンスプロパティ名の戻り値の型名

                    propertyOfInstanceSummaryInfoDict.Add (String.Format (GROUP_SEQ_DIGIT, grpseq), propertyOfInstanceDetailInfoDict);
                }

                propertyOfInstanceSummaryInfoByTypeDict.Add (typeName, propertyOfInstanceSummaryInfoDict);
            }

            return propertyOfInstanceSummaryInfoByTypeDict;

        }

        private static Dictionary<string, Dictionary<string, Dictionary<string, string>>> getMethodOfStaticSummaryInfoDict (HashSet<string> typeNameSet) {

            Dictionary<string, Dictionary<string, Dictionary<string, string>>> methodOfStaticSummaryInfoByTypeDict = new Dictionary<string, Dictionary<string, Dictionary<string, string>>> ();

            foreach (string typeName in typeNameSet) {

                Type type = Type.GetType (typeName); //名前空間からのクラス名までのフル名

                // クラスのパブリックなスタティックメソッドを取得
                List<MethodInfo> methodOfStaticInfoList = type.GetMethods (BindingFlags.Static | BindingFlags.Public).ToList ();

                Dictionary<string, Dictionary<string, string>> methodOfStaticSummaryInfoDict = new Dictionary<string, Dictionary<string, string>> ();

                int grpseq = 0;

                foreach (MethodInfo methodOfStaticInfo in methodOfStaticInfoList) {

                    grpseq++;

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

                    methodOfStaticSummaryInfoDict.Add (String.Format (GROUP_SEQ_DIGIT, grpseq), methodOfStaticDetailInfoDict);
                }

                methodOfStaticSummaryInfoByTypeDict.Add (typeName, methodOfStaticSummaryInfoDict);

            }
            return methodOfStaticSummaryInfoByTypeDict;

        }

        private static Dictionary<string, Dictionary<string, Dictionary<string, string>>> getMethodOfInstanceSummaryInfoDict (HashSet<string> typeNameSet) {

            Dictionary<string, Dictionary<string, Dictionary<string, string>>> methodOfInstanceSummaryInfoByTypeDict = new Dictionary<string, Dictionary<string, Dictionary<string, string>>> ();

            foreach (string typeName in typeNameSet) {

                Type type = Type.GetType (typeName); //名前空間からのクラス名までのフル名

                // クラスのパブリックなインスタンスメソッドを取得
                List<MethodInfo> methodOfInstanceInfoList = type.GetMethods (BindingFlags.Instance | BindingFlags.Public).ToList ();

                Dictionary<string, Dictionary<string, string>> methodOfInstanceSummaryInfoDict = new Dictionary<string, Dictionary<string, string>> ();

                int grpseq = 0;

                foreach (MethodInfo methodOfInstanceInfo in methodOfInstanceInfoList) {

                    grpseq++;

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

                    methodOfInstanceSummaryInfoDict.Add (String.Format (GROUP_SEQ_DIGIT, grpseq), methodOfInstanceDetailInfoDict);
                }

                methodOfInstanceSummaryInfoByTypeDict.Add (typeName, methodOfInstanceSummaryInfoDict);

            }

            return methodOfInstanceSummaryInfoByTypeDict;

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

        static void Main (string[] args) {

            HashSet<string> targetTypeNameHashSet = new HashSet<string> ();

            string appName = Environment.GetCommandLineArgs () [0];
            appName = Regex.Replace (appName, ".*/", EMPTY); //ファイル名のみにする
            appName = Regex.Replace (appName, "\\..*", EMPTY); //拡張子を取り除く

            List<string> cmdLineArgs = args.ToList ();

            //オプション引数が指定したもの以外にマッチした場合は早期リターン オプションリスト作って除外

            if (cmdLineArgs.Count == cmdLineArgs.Where (arg => arg.IndexOf ("--") >= 0).ToList ().Count) {
                //オプション引数指定のみの場合
                Usage (appName);
            }

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
                            Console.WriteLine(CURRENT_ASSEMBLY_LIST.Where(type => type.FullName == arg).ToList().Count);

                            Console.WriteLine();

                            if(arg.IndexOf("--") >= 0){
                                Usage(appName);
                            }else{
                                targetTypeNameHashSet.Add (arg);
                            }
                            break;
                    }
                }

            } else {
                foreach (string arg in cmdLineArgs) {
                    switch (arg) {
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

            Dictionary<string, Dictionary<string, Dictionary<string, string>>> summaryMap = new Dictionary<string, Dictionary<string, Dictionary<string, string>>> ();

            switch (DEFAULT_OPTION_VALUE) {

                case OPTION_PROPERTY_STATIC:
                    summaryMap = getPropertyOfStaticSummaryInfoDict (targetTypeNameHashSet);
                    break;
                case OPTION_PROPERTY_INSTANCE:
                    summaryMap = getPropertyOfInstanceSummaryInfoDict (targetTypeNameHashSet);
                    break;
                case OPTION_METHOD_STATIC:
                    summaryMap = getMethodOfStaticSummaryInfoDict(targetTypeNameHashSet);
                    break;
                case OPTION_METHOD_INSTANCE:
                    summaryMap = getMethodOfInstanceSummaryInfoDict(targetTypeNameHashSet);
                    break;
                default:
                    Usage (appName);
                    break;
            }

            int grp = 0;

            //header
            {
                {
                    Console.Write (String.Join(FS,OUTPUT_COMMON_HEADER_LIST.ToArray()));
                    Console.Write (FS);
                    Console.Write (String.Join(FS,DEFAULT_OUTPUT_HEADER_LIST.ToArray()));
                }
                Console.WriteLine ();
            }

            //body
            foreach (string type in summaryMap.Keys) {

                grp++;

                Dictionary<string, Dictionary<string, string>> detailMap = summaryMap[type];

                foreach (string key in detailMap.Keys) {
                    {
                        Console.Write(String.Format (GROUP_DIGIT, grp));
                        Console.Write (FS);
                        Console.Write (type);
                        Console.Write (FS);
                        Console.Write (key);
                        Console.Write (FS);
                        Console.Write (String.Join (FS, detailMap[key].Values));
                    }
                    Console.WriteLine ();
                }
            }
        }
    }
}
