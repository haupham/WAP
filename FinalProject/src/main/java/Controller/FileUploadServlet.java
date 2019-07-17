package Controller;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

/**
 * Created by haupham on 7/16/19.
 */
@WebServlet(name = "FileUploadServlet",
            urlPatterns = {"/upload"},
            initParams = { @WebInitParam(name = "path", value = "/web/images/") })
@MultipartConfig
public class FileUploadServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        response.setContentType("multipart/form-data");

        ServletOutputStream os = response.getOutputStream();

        ServletConfig sc = getServletConfig();
        String path = sc.getInitParameter("uploadpath");

        Part filePart = request.getPart("myfile");

        String fileName = filePart.getSubmittedFileName();
        InputStream is = filePart.getInputStream();

        Files.copy(is, Paths.get(path + fileName), StandardCopyOption.REPLACE_EXISTING);

        os.print("File successfully uploaded");
    }
}