using System;
using System.Xml.Linq;
using Sgml;

namespace _00010_csharp_vscodeでの外部ライブラリ使用プロジェクトの作成
{
    class Program
    {
        public static void Main(string[] args)
        {

            Console.WriteLine(ParseHtml("https://ukijumotahaneniarukenia.site/"));

        }
        private static XDocument ParseHtml(String url)
        {
            var sgmlReader = new SgmlReader
            {
                Href = url
            };

            {
                return XDocument.Load(sgmlReader);
            }
        }
    }
}
