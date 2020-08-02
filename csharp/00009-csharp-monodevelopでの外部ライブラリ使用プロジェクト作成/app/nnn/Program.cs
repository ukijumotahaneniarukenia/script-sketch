﻿using System;
using System.Xml.Linq;
using Sgml;


//http://neue.cc/2010/03/02_244.html

namespace _00009_csharp_monodevelopでの外部ライブラリ使用プロジェクト作成
{
    class MainClass
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
