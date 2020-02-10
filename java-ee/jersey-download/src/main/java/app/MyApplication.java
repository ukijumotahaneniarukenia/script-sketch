package main.java.app;

import org.glassfish.jersey.media.multipart.MultiPartFeature;
import org.glassfish.jersey.server.ResourceConfig;
import org.glassfish.jersey.server.mvc.jsp.JspMvcFeature;

import javax.ws.rs.ApplicationPath;

@ApplicationPath("/api")
public class MyApplication extends ResourceConfig{
    public MyApplication() {
        packages("main.java.app");
        //https://eclipse-ee4j.github.io/jersey.github.io/documentation/latest/user-guide.html#multipart
        packages("main.java.app").register(MultiPartFeature.class);
        //https://eclipse-ee4j.github.io/jersey.github.io/documentation/latest/mvc.html#mvc.registration
        packages("main.java.app").register(org.glassfish.jersey.server.mvc.MvcFeature.class);
        //https://riptutorial.com/jersey/example/30679/jersey-mvc-hello-world
        packages("main.java.app").property(JspMvcFeature.TEMPLATE_BASE_PATH, "/WEB-INF/view").register(JspMvcFeature.class);
    }
}