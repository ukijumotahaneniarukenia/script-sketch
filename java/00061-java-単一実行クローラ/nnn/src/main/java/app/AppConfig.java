package app;

import java.util.HashMap;
import java.util.Map;

public class AppConfig {

    private static final String BASE_URL_MAP = "BASE_URL_MAP";
    private static final String IGNORE_SUFFIX_MAP = "IGNORE_SUFFIX_MAP";
    private static final String CACHE_DIR_MAP = "CACHE_DIR_MAP";

    private Map<String,String> configEntry = new HashMap<>();

    public AppConfig(String baseUrl,String ignoreSuffix,String cacheDir){
        configEntry.put(BASE_URL_MAP,baseUrl);
        configEntry.put(IGNORE_SUFFIX_MAP,ignoreSuffix);
        configEntry.put(CACHE_DIR_MAP,cacheDir);
    }
    public String getBaseUrl() {
        return configEntry.get(BASE_URL_MAP);
    }
    public String getIgnoreSuffixMap() {
        return configEntry.get(IGNORE_SUFFIX_MAP);
    }
    public String getCacheDirMap() {
        return configEntry.get(CACHE_DIR_MAP);
    }
}