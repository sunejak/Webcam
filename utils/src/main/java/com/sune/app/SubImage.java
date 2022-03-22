package com.sune.app;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

/**
 * @author ttjsun
 * @version  12/04/14 17:29
 * <p/>
 * Scale an Image to the desired size
 */
public class SubImage {

    static boolean debug = true;

    public SubImage(String in1, String startX, String startY, String endX, String endY) throws IOException {

        BufferedImage image1;
        File imageFile1 = new File(in1);
        image1 = ImageIO.read(imageFile1);
        // int height = image1.getHeight();
        // int width = image1.getWidth();
        // System.out.println("Image is: " + height + " " + width);
        int x = Integer.parseInt(startX);
        int y = Integer.parseInt(startY);
        int enX = Integer.parseInt(endX);
        int enY = Integer.parseInt(endY);
        // int type = image1.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : image1.getType();
        BufferedImage img = image1.getSubimage(x, y, enX, enY);
        BufferedImage copyOfImage = new BufferedImage(img.getWidth(), img.getHeight(), BufferedImage.TYPE_INT_RGB);
        Graphics g = copyOfImage.createGraphics();
        g.drawImage(img, 0, 0, null);
        g.dispose();
        ImageIO.write(copyOfImage, "jpg",new File(in1 + "_sub"  ));
    }

    public static void main( String[] args )
    {
        if(args.length < 5){
            System.out.println("usage: SubImage inputFile1 x y w h");
            System.exit(1);
        }
        try {
            new SubImage(args[0], args[1], args[2], args[3], args[4]);
            System.exit(0);
        } catch (IOException e) {
            if(debug)e.printStackTrace();
            System.exit(1);
        }
    }

}



