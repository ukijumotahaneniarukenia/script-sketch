using System;
using System.Collections.Generic;

namespace _00002_c__パイプ経由引数
{
    class Program
    {
        static void Main(string[] args)
        {
            if (! Console.IsInputRedirected) 
            {
                //標準入力からの入力がない場合は、Usage
                Usage();
                return; 
            }

            String s;
            int n=0;
            Dictionary<int, List<String>> map = new Dictionary<int, List<String>>();
            while ((s = Console.ReadLine())!=null) 
            {
                List<String> liz = new List<String>();
                int cnt=s.Split(" ").Length;
                String[] ss=s.Split(" ");
                for (int i=0;i<=cnt-1;i++)
                {
                    liz.Add(ss[i]);
                }
                map.Add(n,liz);
                n++;
            }
            debug(map);
        }

        private static void debug(Dictionary<int, List<String>> map )
        {
            foreach(int k in map.Keys)
            {
                int cnt = map[k].Count;
                for (int i=0;i<=cnt-1;i++)
                {
                    Console.WriteLine(k+":"+i+":"+map[k][i]);
                }
            }
        }

        private static void Usage()
        {
            String doc =@"
Usage:
IN: echo {a..f} | xargs -n2 | dotnet run
OUT:
    0:0:a
    0:1:b
    1:0:c
    1:1:d
    2:0:e
    2:1:f

or

IN: echo {a..f} | xargs -n1 | dotnet run
OUT:
    0:0:a
    1:0:b
    2:0:c
    3:0:d
    4:0:e
    5:0:f

";
            Console.WriteLine(doc);
        }
    }
}