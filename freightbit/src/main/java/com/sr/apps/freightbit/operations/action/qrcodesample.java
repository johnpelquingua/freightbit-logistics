package com.sr.apps.freightbit.operations.action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.glxn.qrgen.core.image.ImageType;
import net.glxn.qrgen.javase.QRCode;

import java.io.*;

public class qrcodesample {

    /*public void generate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String qrtext = request.getParameter("containerType");
        ByteArrayOutputStream out = QRCode.from(qrtext).to(ImageType.PNG).stream();

        response.setContentType("image/png");
        response.setContentLength(out.size());

        OutputStream outStream = response.getOutputStream();
        outStream.write(out.toByteArray());

        outStream.flush();
        outStream.close();

    }*/
    public static void main(String[] args) {
        ByteArrayOutputStream out = QRCode.from("Happy New Yeah!! xD").to(ImageType.PNG).stream();

        try {
            FileOutputStream fout = new FileOutputStream(new File(
                    "C:\\QR_Code.PNG"));

            fout.write(out.toByteArray());

            fout.flush();
            fout.close();

        } catch (FileNotFoundException e) {
            // Do Logging
        } catch (IOException e) {
            // Do Logging
        }
    }
}