<%@ page contentType="image/jpeg"
    import="java.util.HashMap,java.text.SimpleDateFormat,java.util.Date,java.awt.Color,java.awt.Font,java.awt.Graphics2D,java.awt.image.BufferedImage,java.io.IOException,java.io.*,java.util.Random,javax.imageio.ImageIO"%>
<%!public class RandomGraphic {


                public String drawAlpha(String path, String graphicFormat, OutputStream out)
                                throws IOException {
                        return draw(path,graphicFormat, out);
                }
                private String draw(String path,String graphicFormat,   OutputStream out) throws IOException {
                        File file = new File(path);
                        BufferedImage bi = ImageIO.read(file);
                        ImageIO.write(bi, graphicFormat, out);
                        return path;
                }
        }%>
<%
Object refOB = request.getParameter("ref");
String ref = refOB.toString();
Object tagOB = request.getParameter("tag");
String tag = tagOB.toString();
        out.clear();
        out = pageContext.pushBody();
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpg");
        RandomGraphic rg = new RandomGraphic();
        String v = rg.drawAlpha(ref,tag, response.getOutputStream());
%>