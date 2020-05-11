using System;
using System.Linq;
using System.Collections.Generic;

namespace _00005_c__range
{
    class Program
    {
        static void Main(string[] args)
        {
            IEnumerable<int> squares = Enumerable.Range(1, 10).Select(x => x);
            var v = Enumerable.Range(1, 10).Aggregate((p, x) => p + x);

            Console.WriteLine(v);

            foreach (int num in squares)
            {
                Console.WriteLine(num);
            }
        }
    }
}
