using System;
using System.Collections.Generic;
using System.IO;
using System.Text.RegularExpressions;
using System.Xml.Linq;
using Newtonsoft.Json;

//https://www.newtonsoft.com/json
namespace xml2json {
    class Program {
        private static char FS = ' ';
        private static char RS = '\n';
        private static string EMPTY = "";
        private static string CHECK_INPUT_FILE_NAME = "xml";
        private static string CHECK_OUTPUT_FILE_NAME = "json";

        private static void Usage (string appName) {
            Console.WriteLine (EMPTY +
                "\nUsage:" +
                RS +
                "\n  CMD: " + appName + FS + "test.xml" + FS + "test.json" +
                RS +
                "\n    or" +
                RS +
                "\n  CMD: " + "echo" + FS + "test.xml" + FS + "test.json" + FS + "|" + FS + appName +
                RS
            );

            Environment.Exit (0);
        }

        public static void Main (string[] args) {
            var appName = Environment.GetCommandLineArgs () [0];
            appName = Regex.Replace (appName, ".*/", EMPTY); //ファイル名のみにする
            appName = Regex.Replace (appName, "\\..*", EMPTY); //拡張子を取り除く

            if (args.Length == 0) {
                //パイプ経由からの入力の場合
                if (!Console.IsInputRedirected) {
                    //パイプ経由からの入力がない場合
                    Usage (appName);

                }

                string s;
                int n = 0;
                Dictionary<int, List<string>> map = new Dictionary<int, List<string>> ();
                while ((s = Console.ReadLine ()) != null) {
                    //標準入力からの文字列を読み込み、空文字列でない限り、繰り返し処理
                    List<string> liz = new List<string> ();
                    int cnt = s.Split (FS).Length;
                    string[] ss = s.Split (FS);
                    for (int i = 0; i <= cnt - 1; i++) {
                        liz.Add (ss[i]);
                    }
                    map.Add (n, liz);
                    n++;
                }
                if (map.Count != 1) {
                    //単一行でない場合
                    Usage (appName);
                }

                var inputFileExtenstion = Regex.Replace (map[0][0], ".*\\.", EMPTY);
                var outputFileExtenstion = Regex.Replace (map[0][1], ".*\\.", EMPTY);

                if (inputFileExtenstion != CHECK_INPUT_FILE_NAME) {
                    Usage (appName);
                }
                if (outputFileExtenstion != CHECK_OUTPUT_FILE_NAME) {
                    Usage (appName);
                }

                XmlToJson (map[0][0], map[0][1]);

            } else {
                //コマンドライン引数経由からの入力の場合

                if (args.Length != 2) {
                    Usage (appName);
                }

                var inputFileExtenstion = Regex.Replace (args[0], ".*\\.", EMPTY);
                var outputFileExtenstion = Regex.Replace (args[1], ".*\\.", EMPTY);

                if (inputFileExtenstion != CHECK_INPUT_FILE_NAME) {
                    Usage (appName);
                }
                if (outputFileExtenstion != CHECK_OUTPUT_FILE_NAME) {
                    Usage (appName);
                }

                XmlToJson (args[0], args[1]);
            }

        }

        // XML => JSON
        private static void XmlToJson (string xmlFileName, string jsonFileName) {
            var xdoc = XDocument.Load (xmlFileName);
            // XDocumentをJSON形式の文字列に変換
            var json = JsonConvert.SerializeXNode (xdoc, Formatting.Indented);

            File.WriteAllText (jsonFileName, json);
        }
    }
}
