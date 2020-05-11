using System;
using System.Linq;
using System.Collections.Generic;

namespace _00004_c__reduce
{
    class Program
    {
        static void Main(string[] args)
        {
            var ary = new [] { 1, 2, 3, 4, 5 }; //配列
            var v = ary.Aggregate((p, x) => p + x);
            Console.WriteLine(v);

            var liz = new List<int> { 6,7,8,9,10};//リスト
            var vv = liz.Aggregate((p, x) => p + x);
            Console.WriteLine(vv);
        }
    }
}