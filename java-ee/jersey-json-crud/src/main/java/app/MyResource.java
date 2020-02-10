package main.java.app;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.json.bind.Jsonb;
import javax.json.bind.JsonbBuilder;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

@Path("/")
public class MyResource {

    private final static String RESOURCE_DIR = "/home/kuraine/script_scratch/java-ee/jersey-json-crud/src/main/resource";

    @Path("/select-XXX/{n}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    //mkdir -p /home/kuraine/script_scratch/java-ee/jersey-json-crud/src/main/java/resource
    //echo '{"grp":1,"id":[1,2,3]}' >/home/kuraine/script_scratch/java-ee/jersey-json-crud/src/main/java/resource/test1.json
    //curl -v http://localhost:8080/jersey-json-crud/api/select-XXX/1
    public String select_XXX_n(@PathParam("n") Integer n) {
        String prefix = "test";
        String suffix = ".json";
        String fileName = prefix + n + suffix;
        return getResource(fileName);
    }

    @Path("/create-XXX/{n}")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    //$curl -v -X POST -H "Content-type: application/json" -d '{"grp":1,"id":[1,2,3]}' http://localhost:8080/jersey-json-crud/api/create-XXX/2
    public void create_XXX_n(main.java.app.TelegramPattern2 telegramPattern2, @PathParam("n") Integer n) {
        String prefix = "test";
        String suffix = ".json";
        String fileName = prefix + n + suffix;
        Jsonb jsonb = JsonbBuilder.create();
        String json = jsonb.toJson(telegramPattern2);
        putResource(fileName,json);
    }

    @Path("/delete-XXX/{n}")
    @DELETE
    //$curl -v -X DELETE http://localhost:8080/jersey-json-crud/api/delete-XXX/2
    public void delete_XXX_n(@PathParam("n") Integer n) {
        String prefix = "test";
        String suffix = ".json";
        String fileName = prefix + n + suffix;
        delResource(fileName);
    }

    @Path("/merge-XXX/{n}")
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    //$curl -v -X PUT -H "Content-type: application/json" -d '{"grp":1,"id":[1,2,3]}' http://localhost:8080/jersey-json-crud/api/merge-XXX/2

    //$curl -v -X PUT -H "Content-type: application/json" -d '{"grp":1,"id":[4,5,6]}' http://localhost:8080/jersey-json-crud/api/merge-XXX/2
    public void merge_XXX_n(main.java.app.TelegramPattern2 telegramPattern2, @PathParam("n") Integer n) {
        String prefix = "test";
        String suffix = ".json";
        String fileName = prefix + n + suffix;
        Jsonb jsonb = JsonbBuilder.create();
        String json = jsonb.toJson(telegramPattern2);
        putResource(fileName,json);
    }

    private static void putResource(String fileName,String json) {
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(RESOURCE_DIR + "/" +fileName);
            byte[] bytes = json.getBytes();
            fileOutputStream.write(bytes);
            fileOutputStream.flush();
            fileOutputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static void delResource(String fileName) {
        File file = new File(RESOURCE_DIR + "/" + fileName);
        file.delete();
    }

    private static String getResource(String fileName) {
        java.nio.file.Path file = Paths.get(RESOURCE_DIR + "/" + fileName);
        String rt = null;
        try {
            rt = Files.readString(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return rt;
    }
}