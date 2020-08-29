```
$ dotnet add package UnicodeInformation --version 2.5.0



$ git clone https://github.com/GoldenCrystal/NetUnicodeInfo.git

$ cd NetUnicodeInfo


$ grep -A 1 ValueName System.Unicode/UnicodeCharInfo.cs|sed '/--/d' | sed -r 's/^\s+//g' | ruby -anle 'puts $F.join("@@@")' | xargs -n2 | grep -P '=>' | ruby -F'@@@' -anle 'puts $F[$F.find_index("=>")-1]'|sort


$ grep -A 1 ValueName System.Unicode/UnicodeCharInfo.cs|sed '/--/d' | sed -r 's/^\s+//g' | ruby -anle 'puts $F.join("@@@")' | xargs -n2 | grep -P '=>' | ruby -F'@@@' -anle 'puts $F[$F.find_index("=>")-1]'|sort|xargs -I@ echo 'Console.Write(charInfo.@);'

$ grep -A 1 ValueName System.Unicode/UnicodeCharInfo.cs|sed '/--/d' | sed -r 's/^\s+//g' | ruby -anle 'puts $F.join("@@@")' | xargs -n2 | grep -P '=>' | ruby -F'@@@' -anle 'puts $F[$F.find_index("=>")-1]'|sort|xargs -I@ bash -c "echo 'Console.Write(charInfo.@);';echo 'Console.Write(FS);'"


$ grep -A 1 ValueName System.Unicode/UnicodeCharInfo.cs|sed '/--/d' | sed -r 's/^\s+//g' | ruby -anle 'puts $F.join("@@@")' | xargs -n2 | grep -P '=>' | ruby -F'@@@' -anle 'puts $F[$F.find_index("=>")-1]'|sort| while read s;do echo $s|jq -rR '[splits("(?=[A-Z])")|select(""!=.)]|join("_")'|tr '[a-z]' '[A-Z]'; echo $s;done|xargs -n2 | awk '{print "private const string "$1" = \x22"$2"\x22;"}'
private const string BIDIRECTIONAL_CLASS = "BidirectionalClass";
private const string BIDIRECTIONAL_MIRRORED = "BidirectionalMirrored";
private const string BLOCK = "Block";
private const string CANONICAL_COMBINING_CLASS = "CanonicalCombiningClass";
private const string CANTONESE_READING = "CantoneseReading";
private const string CATEGORY = "Category";
private const string DECOMPOSITION_MAPPING = "DecompositionMapping";
private const string DECOMPOSITION_TYPE = "DecompositionType";
private const string DEFINITION = "Definition";
private const string HANGUL_READING = "HangulReading";
private const string JAPANESE_KUN_READING = "JapaneseKunReading";
private const string JAPANESE_ON_READING = "JapaneseOnReading";
private const string KOREAN_READING = "KoreanReading";
private const string MANDARIN_READING = "MandarinReading";
private const string NAME_ALIASES = "NameAliases";
private const string NUMERIC_TYPE = "NumericType";
private const string OLD_NAME = "OldName";
private const string SIMPLE_LOWER_CASE_MAPPING = "SimpleLowerCaseMapping";
private const string SIMPLE_TITLE_CASE_MAPPING = "SimpleTitleCaseMapping";
private const string SIMPLE_UPPER_CASE_MAPPING = "SimpleUpperCaseMapping";
private const string SIMPLIFIED_VARIANT = "SimplifiedVariant";
private const string TRADITIONAL_VARIANT = "TraditionalVariant";
private const string UNICODE_RADICAL_STROKE_COUNTS = "UnicodeRadicalStrokeCounts";
private const string VIETNAMESE_READING = "VietnameseReading";


$ grep -A 1 ValueName System.Unicode/UnicodeCharInfo.cs|sed '/--/d' | sed -r 's/^\s+//g' | ruby -anle 'puts $F.join("@@@")' | xargs -n2 | grep -P '=>' | ruby -F'@@@' -anle 'puts $F[$F.find_index("=>")-1]'|sort| while read s;do echo $s|jq -rR '[splits("(?=[A-Z])")|select(""!=.)]|join("_")'|tr '[a-z]' '[A-Z]'; echo $s;done|xargs -n2|awk '{print "detailDict.Add("$1",charInfo."$2".ToString());"}'
detailDict.Add(BIDIRECTIONAL_CLASS,charInfo.BidirectionalClass.ToString());
detailDict.Add(BIDIRECTIONAL_MIRRORED,charInfo.BidirectionalMirrored.ToString());
detailDict.Add(BLOCK,charInfo.Block.ToString());
detailDict.Add(CANONICAL_COMBINING_CLASS,charInfo.CanonicalCombiningClass.ToString());
detailDict.Add(CANTONESE_READING,charInfo.CantoneseReading.ToString());
detailDict.Add(CATEGORY,charInfo.Category.ToString());
detailDict.Add(DECOMPOSITION_MAPPING,charInfo.DecompositionMapping.ToString());
detailDict.Add(DECOMPOSITION_TYPE,charInfo.DecompositionType.ToString());
detailDict.Add(DEFINITION,charInfo.Definition.ToString());
detailDict.Add(HANGUL_READING,charInfo.HangulReading.ToString());
detailDict.Add(JAPANESE_KUN_READING,charInfo.JapaneseKunReading.ToString());
detailDict.Add(JAPANESE_ON_READING,charInfo.JapaneseOnReading.ToString());
detailDict.Add(KOREAN_READING,charInfo.KoreanReading.ToString());
detailDict.Add(MANDARIN_READING,charInfo.MandarinReading.ToString());
detailDict.Add(NAME_ALIASES,charInfo.NameAliases.ToString());
detailDict.Add(NUMERIC_TYPE,charInfo.NumericType.ToString());
detailDict.Add(OLD_NAME,charInfo.OldName.ToString());
detailDict.Add(SIMPLE_LOWER_CASE_MAPPING,charInfo.SimpleLowerCaseMapping.ToString());
detailDict.Add(SIMPLE_TITLE_CASE_MAPPING,charInfo.SimpleTitleCaseMapping.ToString());
detailDict.Add(SIMPLE_UPPER_CASE_MAPPING,charInfo.SimpleUpperCaseMapping.ToString());
detailDict.Add(SIMPLIFIED_VARIANT,charInfo.SimplifiedVariant.ToString());
detailDict.Add(TRADITIONAL_VARIANT,charInfo.TraditionalVariant.ToString());
detailDict.Add(UNICODE_RADICAL_STROKE_COUNTS,charInfo.UnicodeRadicalStrokeCounts.ToString());
detailDict.Add(VIETNAMESE_READING,charInfo.VietnameseReading.ToString());

```
