package app;

import java.util.HashMap;
import java.util.Map;

public class AppConfig {

    private static final String BASE_URL_MAP = "BASE_URL_MAP";
    private static final String IGNORE_SUFFIX_MAP = "IGNORE_SUFFIX_MAP";
    private static final String CACHE_DIR_MAP = "CACHE_DIR_MAP";

    private Map<String,String> baseUrlMap = new HashMap<>();
    private Map<String,String> ignoreSuffixMap = new HashMap<>();
    private Map<String,String> cacheDirMap = new HashMap<>();

    public AppConfig(String baseUrl,String ignoreSuffix,String cacheDir){
        baseUrlMap.put(BASE_URL_MAP,baseUrl);
        ignoreSuffixMap.put(IGNORE_SUFFIX_MAP,ignoreSuffix);
        cacheDirMap.put(CACHE_DIR_MAP,cacheDir);
    }
    public String getBaseUrl() {
        return baseUrlMap.get(BASE_URL_MAP);
    }
    public String getIgnoreSuffixMap() {
        return ignoreSuffixMap.get(IGNORE_SUFFIX_MAP);
    }
    public String getCacheDirMap() {
        return cacheDirMap.get(CACHE_DIR_MAP);
    }
}