using System;
using System.Collections.Generic;

namespace _00002_c__標準入力
{
    class Program
    {
        public static void Main()
        {
            if (! Console.IsInputRedirected) {
                //標準入力からの入力がない場合は、Usage
                Usage();
                return; 
            }

            String s;
            int n=0;
            Dictionary<int, List<String>> map = new Dictionary<int, List<String>>();
            String[,] nnn = new string[0, 0];
            while ((s = Console.ReadLine())!=null) {
                List<String> liz = new List<String>();
                n++;
                int cnt=s.Split(" ").Length;
                String[] ss=s.Split(" ");
                for (int i=0;i<=cnt-1;i++){
                    liz.Add(ss[i]);
                }
                map.Add(n,liz);
            }
            foreach(int k in map.Keys)
            {
                int cnt = map[k].Count;
                for (int i=0;i<=cnt-1;i++){
                    Console.WriteLine(k+":"+i+":"+map[k][i]);
                }
            }
        }

        private static void Usage(){
            String doc =@"
Usage:
IN: echo {a..f} | xargs -n3 | dotnet run
OUT:
    a b c
    d e f
";
            Console.WriteLine(doc);
        }
    }
}