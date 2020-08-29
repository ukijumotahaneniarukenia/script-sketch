using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Globalization;
using System.Unicode;

namespace app {
    class Program {

        private const string FS = "\t";
        static void Main (string[] args) {

            //https://docs.microsoft.com/ja-jp/dotnet/api/system.char?view=netcore-3.1#Relationship
            //https://github.com/GoldenCrystal/NetUnicodeInfo
            // int s = 0;
            // int s = 160;
            int s = 400;
            // int s = 0x1F4A0;
            int c = 200;

            // List<string> list = Enumerable.Range (s, e).Where( i => i < 55296 || i > 57343 ).Select (i => Convert.ToString (i, 16)).ToList ();
            List<int> codePointList = Enumerable.Range (s, c).Where (i => i < 55296 || i > 57343).ToList ();

            int grp = 0;
            foreach (var codePoint in codePointList) {

                grp++;

                string item = Char.ConvertFromUtf32 (codePoint);

                List<char> charList = item.ToCharArray ().ToList ();

                var charInfo = UnicodeInfo.GetCharInfo(codePoint);

                {
                    int grpseq = 0;
                    foreach (Char ch in charList) {

                        grpseq++;

                        {
                            Console.Write(grp);
                            Console.Write(FS);
                            Console.Write(grpseq);
                            Console.Write(FS);
                            Console.Write(grpseq);
                            Console.Write(FS);
                            Console.Write(codePoint);
                            Console.Write(FS);
                            Console.Write(charInfo.Name);
                            Console.Write(FS);
                            Console.Write(charInfo.NumericValue);
                            Console.Write(FS);
                            Console.Write(charInfo.BidirectionalClass);
                            Console.Write(FS);
                            Console.Write(charInfo.BidirectionalMirrored);
                            Console.Write(FS);
                            Console.Write(charInfo.Block);
                            Console.Write(FS);
                            Console.Write(charInfo.CanonicalCombiningClass);
                            Console.Write(FS);
                            Console.Write(charInfo.CantoneseReading);
                            Console.Write(FS);
                            Console.Write(charInfo.Category);
                            Console.Write(FS);
                            Console.Write(charInfo.DecompositionMapping);
                            Console.Write(FS);
                            Console.Write(charInfo.DecompositionType);
                            Console.Write(FS);
                            Console.Write(charInfo.Definition);
                            Console.Write(FS);
                            Console.Write(charInfo.HangulReading);
                            Console.Write(FS);
                            Console.Write(charInfo.JapaneseKunReading);
                            Console.Write(FS);
                            Console.Write(charInfo.JapaneseOnReading);
                            Console.Write(FS);
                            Console.Write(charInfo.KoreanReading);
                            Console.Write(FS);
                            Console.Write(charInfo.MandarinReading);
                            Console.Write(FS);
                            Console.Write(charInfo.NameAliases);
                            Console.Write(FS);
                            Console.Write(charInfo.NumericType);
                            Console.Write(FS);
                            Console.Write(charInfo.OldName);
                            Console.Write(FS);
                            Console.Write(charInfo.SimpleLowerCaseMapping);
                            Console.Write(FS);
                            Console.Write(charInfo.SimpleTitleCaseMapping);
                            Console.Write(FS);
                            Console.Write(charInfo.SimpleUpperCaseMapping);
                            Console.Write(FS);
                            Console.Write(charInfo.SimplifiedVariant);
                            Console.Write(FS);
                            Console.Write(charInfo.TraditionalVariant);
                            Console.Write(FS);
                            Console.Write(charInfo.UnicodeRadicalStrokeCounts);
                            Console.Write(FS);
                            Console.Write(charInfo.VietnameseReading);
                            Console.Write(FS);
                        }
                    }

                    // int cnt = 0;
                    List<Rune> runeList = item.EnumerateRunes().ToList ();

                    foreach (Rune rune in runeList) {
                        {
                            //https://docs.microsoft.com/ja-jp/dotnet/api/system.text.rune?view=netcore-3.1#constructors
                            Console.Write(rune.IsAscii);
                            Console.Write(FS);
                            Console.Write(rune.IsBmp);
                            Console.Write(FS);
                            Console.Write(rune.Plane); //これ重要
                        }
                    }

                    Console.WriteLine();

                }
            }
        }
    }
}
