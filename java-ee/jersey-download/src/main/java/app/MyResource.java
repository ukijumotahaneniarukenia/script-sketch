package main.java.app;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Path("/")
public class MyResource {

    private final static String RESOURCE_DIR="/home/kuraine/script_scratch/java-ee/jersey-download/src/main/java/resource";

    @Path("/show-download-view")
    @GET
    @Produces(value = MediaType.TEXT_HTML)
    //jerseyはthymeleafとうまく親和できなかったので、動的言語みたいに雑に実装しなくてはならぬため、適材適所見極めが大切
    public String show_download_view() {
        String rt=null;
        String startTblTag="<table>";
        String endTblTag="</table>";
        String startTrTag="<tr><th>";
        String endTrTag="</th></tr>";
        String startTdTag="<tr><td>";
        String endTdTag="</td></tr>";
        rt=startTblTag +startTrTag+"BELOW CHOOSE FILE"+endTrTag;
        for(String file:listup_file(RESOURCE_DIR)){
            rt=rt+startTdTag+file+endTdTag;
        }
        rt=rt+endTblTag;
        return rt;
    }

    private static List<String> listup_file(String saveLoc) {
        List<String> rt = new ArrayList<>();
        File dir = new File(saveLoc);
        File[] files = dir.listFiles();
        for(File file:files){
            rt.add(file.getName());
        }
        return rt;
    }
}