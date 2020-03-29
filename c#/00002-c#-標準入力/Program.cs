using System;

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
            while ((s = Console.ReadLine())!=null) {
                Console.WriteLine(s);
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