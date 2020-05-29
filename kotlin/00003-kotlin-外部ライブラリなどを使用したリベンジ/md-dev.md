

```
$ cd 00003-kotlin-外部ライブラリなどを使用したリベンジ


ビルド
$ ./gradlew build

実行
$ java -jar ./nnn/build/libs/nnn-1.0-SNAPSHOT.jar
うんこ
{"name":"Abcd","greeting":"Hello"}
Abcd
Hello


```


ポータブルか

```
$ cp ./nnn/build/libs/nnn-1.0-SNAPSHOT.jar $HOME/nnn-1.0-SNAPSHOT.jar




```


ポータブル

```

$ cd $HOME

$ java -jar nnn-1.0-SNAPSHOT.jar
うんこ
{"name":"Abcd","greeting":"Hello"}
Abcd
Hello
```


中身確認

```

$ ls -lhF nnn-1.0-SNAPSHOT.jar
-rw-r--r--. 1 kuraine kuraine 1.7M  5月 30 00:34 nnn-1.0-SNAPSHOT.jar



$ jar tvf nnn-1.0-SNAPSHOT.jar


```


けっこうもりもりでる

```
$ jar tvf nnn-1.0-SNAPSHOT.jar | grep gson
     0 Fri Oct 04 11:54:58 UTC 2019 META-INF/maven/com.google.code.gson/
     0 Fri Oct 04 11:54:58 UTC 2019 META-INF/maven/com.google.code.gson/gson/
   109 Fri Oct 04 11:54:58 UTC 2019 META-INF/maven/com.google.code.gson/gson/pom.properties
  2527 Fri Oct 04 11:54:30 UTC 2019 META-INF/maven/com.google.code.gson/gson/pom.xml
     0 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/
  6536 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/DefaultDateTypeAdapter.class
   291 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/ExclusionStrategy.class
  2185 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/FieldAttributes.class
   711 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/FieldNamingPolicy$1.class
   837 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/FieldNamingPolicy$2.class
   938 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/FieldNamingPolicy$3.class
  1017 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/FieldNamingPolicy$4.class
  1017 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/FieldNamingPolicy$5.class
  1017 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/FieldNamingPolicy$6.class
  3203 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/FieldNamingPolicy.class
   207 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/FieldNamingStrategy.class
  2020 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/Gson$1.class
  2023 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/Gson$2.class
  1928 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/Gson$3.class
  1746 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/Gson$4.class
  2584 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/Gson$5.class
  1719 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/Gson$FutureTypeAdapter.class
 22352 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/Gson.class
  9790 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/GsonBuilder.class
   302 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/InstanceCreator.class
  5637 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/JsonArray.class
   413 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/JsonDeserializationContext.class
   510 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/JsonDeserializer.class
  3872 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/JsonElement.class
   731 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/JsonIOException.class
   966 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/JsonNull.class
  4549 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/JsonObject.class
   732 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/JsonParseException.class
  3134 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/JsonParser.class
  4822 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/JsonPrimitive.class
   301 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/JsonSerializationContext.class
   437 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/JsonSerializer.class
  2707 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/JsonStreamParser.class
   743 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/JsonSyntaxException.class
   735 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/LongSerializationPolicy$1.class
   876 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/LongSerializationPolicy$2.class
  1507 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/LongSerializationPolicy.class
  1665 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/TypeAdapter$1.class
  3547 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/TypeAdapter.class
   384 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/TypeAdapterFactory.class
     0 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/annotations/
   523 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/annotations/Expose.class
   548 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/annotations/JsonAdapter.class
   566 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/annotations/SerializedName.class
   456 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/annotations/Since.class
   456 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/annotations/Until.class
     0 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/
   892 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/$Gson$Preconditions.class
  1536 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/$Gson$Types$GenericArrayTypeImpl.class
  3167 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/$Gson$Types$ParameterizedTypeImpl.class
  2347 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/$Gson$Types$WildcardTypeImpl.class
 11501 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/$Gson$Types.class
  1268 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/ConstructorConstructor$1.class
  1045 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/ConstructorConstructor$10.class
  1024 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/ConstructorConstructor$11.class
  1030 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/ConstructorConstructor$12.class
  1045 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/ConstructorConstructor$13.class
  2012 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/ConstructorConstructor$14.class
  1271 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/ConstructorConstructor$2.class
  2118 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/ConstructorConstructor$3.class
  1022 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/ConstructorConstructor$4.class
  1741 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/ConstructorConstructor$5.class
  1028 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/ConstructorConstructor$6.class
  1025 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/ConstructorConstructor$7.class
  1024 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/ConstructorConstructor$8.class
  1047 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/ConstructorConstructor$9.class
  5962 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/ConstructorConstructor.class
  2346 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/Excluder$1.class
  7203 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/Excluder.class
   394 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/GsonBuildConfig.class
  1990 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/JavaVersion.class
   484 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/JsonReaderInternalAccess.class
  1953 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/LazilyParsedNumber.class
   922 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/LinkedHashTreeMap$1.class
  2441 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/LinkedHashTreeMap$AvlBuilder.class
  1673 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/LinkedHashTreeMap$AvlIterator.class
  1563 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/LinkedHashTreeMap$EntrySet$1.class
  2111 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/LinkedHashTreeMap$EntrySet.class
  1364 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/LinkedHashTreeMap$KeySet$1.class
  1722 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/LinkedHashTreeMap$KeySet.class
  2073 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/LinkedHashTreeMap$LinkedTreeMapIterator.class
  3457 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/LinkedHashTreeMap$Node.class
 13915 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/LinkedHashTreeMap.class
   906 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/LinkedTreeMap$1.class
  1511 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/LinkedTreeMap$EntrySet$1.class
  2055 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/LinkedTreeMap$EntrySet.class
  1312 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/LinkedTreeMap$KeySet$1.class
  1678 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/LinkedTreeMap$KeySet.class
  2021 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/LinkedTreeMap$LinkedTreeMapIterator.class
  3348 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/LinkedTreeMap$Node.class
 11270 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/LinkedTreeMap.class
   262 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/ObjectConstructor.class
  1943 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/PreJava9DateFormatProvider.class
  1584 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/Primitives.class
   950 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/Streams$AppendableWriter$CurrentWrite.class
  1336 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/Streams$AppendableWriter.class
  2384 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/Streams.class
  1195 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/UnsafeAllocator$1.class
  1238 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/UnsafeAllocator$2.class
  1117 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/UnsafeAllocator$3.class
  1083 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/UnsafeAllocator$4.class
  3095 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/UnsafeAllocator.class
     0 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/
  1963 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/ArrayTypeAdapter$1.class
  3251 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/ArrayTypeAdapter.class
  3657 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/CollectionTypeAdapterFactory$Adapter.class
  2660 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/CollectionTypeAdapterFactory.class
  1165 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/DateTypeAdapter$1.class
  3669 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/DateTypeAdapter.class
  4066 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/JsonAdapterAnnotationTypeAdapterFactory.class
   749 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/JsonTreeReader$1.class
  7701 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/JsonTreeReader.class
   824 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/JsonTreeWriter$1.class
  5371 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/JsonTreeWriter.class
  7495 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/MapTypeAdapterFactory$Adapter.class
  3509 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/MapTypeAdapterFactory.class
  1151 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/ObjectTypeAdapter$1.class
   956 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/ObjectTypeAdapter$2.class
  3181 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/ObjectTypeAdapter.class
  2987 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/ReflectiveTypeAdapterFactory$1.class
  4025 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/ReflectiveTypeAdapterFactory$Adapter.class
  1006 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/ReflectiveTypeAdapterFactory$BoundField.class
  8847 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/ReflectiveTypeAdapterFactory.class
  1184 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/SqlDateTypeAdapter$1.class
  2458 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/SqlDateTypeAdapter.class
  1164 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TimeTypeAdapter$1.class
  2456 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TimeTypeAdapter.class
   253 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TreeTypeAdapter$1.class
  2087 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TreeTypeAdapter$GsonContextImpl.class
  2653 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TreeTypeAdapter$SingleTypeFactory.class
  5315 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TreeTypeAdapter.class
  2717 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapterRuntimeTypeWrapper.class
  1730 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$1.class
  2686 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$10.class
  1943 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$11.class
  1753 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$12.class
  1754 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$13.class
  2274 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$14.class
  2261 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$15.class
  1865 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$16.class
  1958 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$17.class
  1958 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$18.class
  1866 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$19.class
  3133 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$2.class
  1861 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$20.class
  1930 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$21.class
  2124 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$22.class
  1886 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$23.class
  1845 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$24.class
  1591 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$25.class
  1856 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$26$1.class
  1529 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$26.class
  2930 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$27.class
  2400 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$28.class
  4837 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$29.class
  1900 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$3.class
  1485 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$30.class
  1427 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$31.class
  1797 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$32.class
  1975 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$33.class
  1986 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$34.class
  2113 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$35$1.class
  2068 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$35.class
  1145 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$36.class
  1869 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$4.class
  1972 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$5.class
  1943 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$6.class
  1946 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$7.class
  1829 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$8.class
  1613 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$9.class
  3661 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters$EnumTypeAdapter.class
  9936 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/TypeAdapters.class
     0 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/util/
  7273 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/bind/util/ISO8601Utils.class
     0 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/reflect/
   656 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/reflect/PreJava9ReflectionAccessor.class
   880 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/reflect/ReflectionAccessor.class
  3142 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/internal/reflect/UnsafeReflectionAccessor.class
     0 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/reflect/
  8596 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/reflect/TypeToken.class
     0 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/stream/
  1369 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/stream/JsonReader$1.class
 19759 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/stream/JsonReader.class
   612 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/stream/JsonScope.class
  1465 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/stream/JsonToken.class
  8399 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/stream/JsonWriter.class
   838 Fri Oct 04 11:54:54 UTC 2019 com/google/gson/stream/MalformedJsonException.class
```



どうやらプロジェクトの作成の違いで外部ライブラリをレポから引いてこれるか違いがでてきたらしい。

LinuxNativeのプロジェクトでは外部ライブラリぷるできなかった -->というよりできるようにしたい。マルチプラットフォーム対応がハンディになるのでかなり強みがある。


Gradleプロジェクトとしてローンチする分にはぷるできた。
