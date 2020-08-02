using System;
using System.Collections.Generic;

namespace _00003_csharp_コマンドライン引数
{
    class Program
    {
        static int Main(string[] args)
        {
            if (args.Length == 0)
            {
                Usage();
                return 0;
            }else
            {
                Dictionary<int, List<String>> map = new Dictionary<int, List<String>>();
                List<String> liz = new List<String>(args);
                int cnt=liz.Count;
                if(cnt == 1)
                {
                    List<String> lizz = new List<String>(liz[0].Split("\n"));
                    int cc=lizz.Count;
                    for(int i=0;i<=cc-1;i++)
                    {
                        List<String> lizzz = new List<String>(lizz[i].Split(" "));
                        List<String> lizzzz = new List<String>();
                        int ccc=lizzz.Count;
                        for(int j=0;j<=ccc-1;j++)
                        {
                            lizzzz.Add(lizzz[j]);
                        }
                    map.Add(i,lizzzz);
                    }
                    debug(map);
                }else
                {
                    List<String> lizzzz = new List<String>();
                    for(int i=0;i<=cnt-1;i++)
                    {
                        lizzzz.Add(liz[i]);
                        // Console.WriteLine(i+liz[i]);
                    }
                    map.Add(0,lizzzz);
                    debug(map);
                }
                return 0;
            }
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

        private static int CountChar(String s, String ss) {
            return s.Length - s.Replace(ss, "").Length;
        }

        private static void Usage()
        {
            String doc =@"
Usage:
IN: ./bin/*/*/00003-c#-コマンドライン引数 ""$(echo {a..f} | xargs -n3)""
OUT:
    0:0:a
    0:1:b
    0:2:c
    1:0:d
    1:1:e
    1:2:f

or

IN: ./bin/*/*/00003-c#-コマンドライン引数 ""$(echo {a..f} | xargs -n2)""
OUT:
    0:0:a
    0:1:b
    1:0:c
    1:1:d
    2:0:e
    2:1:f

or

IN: ./bin/*/*/00003-c#-コマンドライン引数 ""$(echo {a..f} | xargs -n1)""
OUT:
    0:0:a
    1:0:b
    2:0:c
    3:0:d
    4:0:e
    5:0:f
or

IN: ./bin/*/*/00003-c#-コマンドライン引数 $(echo {a..f} | xargs -n2)
OUT:
    0:0:a
    0:1:b
    0:2:c
    0:3:d
    0:4:e
    0:5:f

or

IN: ./bin/*/*/00003-c#-コマンドライン引数 $(echo {a..f} | xargs -n1)
OUT:
    0:0:a
    0:1:b
    0:2:c
    0:3:d
    0:4:e
    0:5:f

";
            Console.WriteLine(doc);
        }
    }
}