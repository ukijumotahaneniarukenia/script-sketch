using System;
using System.Diagnostics;
using System.Text.RegularExpressions;

namespace _00007_csharp_実行ファイル名の取得
{
    class Program
    {
        static void Main(string[] args)
        {
            String path = "";
            path = Process.GetCurrentProcess().MainModule.FileName;
            Console.WriteLine(path);
            path = Regex.Replace(path, ".*/","");
            Console.WriteLine(path);
        }
    }
}