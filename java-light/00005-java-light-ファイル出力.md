```
private static void fileWriteOut (Map<String,List<String>> m){
    final String SUFFIX = ".tsv";
    String preFileName = m.entrySet().stream().limit(1).map(e->e.getKey().split(F)[0]).collect(Collectors.joining()) + SUFFIX;
    try{
        File destFile = new File(preFileName);
        if(destFile.exists()){
            destFile.delete();
        }
        FileWriter fw = new FileWriter(preFileName, true);
        //前回成果物ファイルを削除
        for(Map.Entry<String,List<String>> entry : m.entrySet()) {
            if (!preFileName.equals(entry.getKey().split(F)[0])) {
                fw.close();
                destFile = new File(entry.getKey().split(F)[0] + SUFFIX);
                destFile.delete();
                fw = new FileWriter(entry.getKey().split(F)[0] + SUFFIX, true);
            }
            fw.write(Arrays.asList(entry.getKey().split(F)).stream().collect(Collectors.joining(OFS))+OFS+entry.getValue().stream().collect(Collectors.joining(OFS)));
            fw.write(RS);
            preFileName = entry.getKey().split(F)[0];
        }
        fw.close();
    }catch(IOException e){
        e.printStackTrace();
    }
}
```
