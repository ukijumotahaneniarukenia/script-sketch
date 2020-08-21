using System;
using System.Collections.Generic;
using System.IO;
using System.Text.RegularExpressions;
using System.Xml.Linq;
using Newtonsoft.Json;

//https://www.newtonsoft.com/json
namespace json2xml {
    class Program {
        private static char FS = ' ';
        private static char RS = '\n';
        private static string EMPTY = "";
        private static string INPUT_FILE_EXTENSION = "json";
        private static string OUTPUT_FILE_EXTENSION = "xml";

        private static void Usage (string appName) {
            Console.WriteLine (EMPTY +
                "\nUsage:" +
                RS +
                "\n  CMD: " + appName + FS + "test" + "." + INPUT_FILE_EXTENSION +
                RS +
                "\n    or" +
                RS +
                "\n  CMD: " + "echo" + FS + "test" + "." + INPUT_FILE_EXTENSION + FS + "|" + FS + appName +
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

                if (map[0].Count != 1){
                    //単一列でない場合
                    Usage (appName);
                }

                var inputFileExtenstion = Regex.Replace (map[0][0], ".*\\.", EMPTY);

                if (inputFileExtenstion != INPUT_FILE_EXTENSION) {
                    Usage (appName);
                }

                JsonToXml (map[0][0]);

            } else {
                //コマンドライン引数経由からの入力の場合

                if (args.Length != 1) {
                    //単一引数でない場合
                    Usage (appName);
                }

                var inputFileExtenstion = Regex.Replace (args[0], ".*\\.", EMPTY);

                if (inputFileExtenstion != INPUT_FILE_EXTENSION) {
                    Usage (appName);
                }

                JsonToXml (args[0]);
            }

        }

        // JSON => XML
        private static void JsonToXml (string jsonFileName) {
            var json = string.Empty;
            var xmlFileName = Regex.Replace(jsonFileName,"(?<=\\.).*",EMPTY) + OUTPUT_FILE_EXTENSION;
            using (var reader = new StreamReader (jsonFileName)) {
                json = reader.ReadToEnd ();
            }
            // JSON形式の文字列をXDocumentに変換
            var xdoc = JsonConvert.DeserializeXNode (json);
            if (File.Exists (xmlFileName)) {
                File.Delete (xmlFileName);
            }

            Console.WriteLine(xdoc.Declaration + Environment.NewLine);
            Console.WriteLine(xdoc + Environment.NewLine);

            File.AppendAllText (xmlFileName, xdoc.Declaration + Environment.NewLine);
            File.AppendAllText (xmlFileName, xdoc + Environment.NewLine);
        }
    }
}
