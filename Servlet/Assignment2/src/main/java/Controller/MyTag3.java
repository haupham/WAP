package Controller;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.io.StringWriter;

/**
 * Created by haupham on 7/12/19.
 */
public class MyTag3 extends SimpleTagSupport {
    private String message;

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public void doTag() throws JspException, IOException {
       if(message != null){
           JspWriter out = getJspContext().getOut();
           out.println( message );
       }
    }

}
