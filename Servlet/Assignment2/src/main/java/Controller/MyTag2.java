package Controller;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.io.StringWriter;

/**
 * Created by haupham on 7/12/19.
 */
public class MyTag2 extends SimpleTagSupport {
    StringWriter sw = new StringWriter();
    @Override
    public void doTag() throws JspException, IOException {
        getJspBody().invoke(sw); // capture body content into StringWriter
        getJspContext().getOut().println(sw.toString());
    }

}
