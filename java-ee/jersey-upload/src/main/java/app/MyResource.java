package main.java.app;

import org.glassfish.jersey.media.multipart.FormDataContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataParam;
import org.glassfish.jersey.server.mvc.Viewable;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.MediaType;
import java.io.*;
import java.util.HashMap;
import java.util.Map;

@Path("/")
public class MyResource {

    private final static String RESOURCE_DIR="/home/kuraine/script_scratch/java-ee/jersey-upload/src/main/java/resource";

    @Path("/show-upload-view")
    @GET
    public Viewable show_upload_view() {
        return new Viewable("/upload-view.jsp");
    }

    @Path("/post-multipart-file")
    @POST
    @Consumes(MediaType.MULTIPART_FORM_DATA)
    public Viewable post_multipart_file(
            @FormDataParam("file") InputStream fileInputStream
            ,@FormDataParam("file") FormDataContentDisposition contentDispositionHeader) throws IOException {
        String saveLoc= RESOURCE_DIR + "/" + new String (contentDispositionHeader.getFileName().getBytes("ISO-8859-9"), "UTF-8");
        save_file(fileInputStream,saveLoc);
        Map<String, String> model = new HashMap<String,String>();
        model.put("done", "UPLOAD-DONE!");
        return new Viewable("/upload-done.jsp",model);
    }

    private void save_file(InputStream inputStream,String saveLoc) {
        try {
            OutputStream outputStream = new FileOutputStream(new File(saveLoc));
            int read = 0;
            byte[] bytes = new byte[1024];
            outputStream = new FileOutputStream(new File(saveLoc));
            while ((read = inputStream.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
            }
            outputStream.flush();
            outputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}