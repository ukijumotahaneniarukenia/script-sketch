using System;
using System.Collections.Generic;

namespace _00002_c__標準入力
{
    class Program
    {
        public static void Main()
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
                n++;
                int cnt=s.Split(" ").Length;
                String[] ss=s.Split(" ");
                for (int i=0;i<=cnt-1;i++)
                {
                    liz.Add(ss[i]);
                }
                map.Add(n,liz);
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
    1:0:a
    1:1:b
    2:0:c
    2:1:d
    3:0:e
    3:1:f

or

IN: echo {a..f} | xargs -n1 | dotnet run
OUT:
    1:0:a
    2:0:b
    3:0:c
    4:0:d
    5:0:e
    6:0:f

";
            Console.WriteLine(doc);
        }
    }
}