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
public class ScaleImage {

    static boolean debug = true;

    public ScaleImage(String in1, String xSize, String ySize) throws IOException {

        BufferedImage image1;
        File imageFile1 = new File(in1);
        image1 = ImageIO.read(imageFile1);
        int height = Integer.parseInt(xSize);
        int width = Integer.parseInt(ySize);
        int type = image1.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : image1.getType();
        BufferedImage resizeImage = new BufferedImage(width, height, type);
        Graphics2D g = resizeImage.createGraphics();
        g.drawImage(image1, 0, 0, width, height, null);
        g.dispose();
        ImageIO.write(resizeImage, "jpg",new File(in1 + "_sc"  ));
    }

    public static void main( String[] args )
    {
        if(args.length < 3){
            System.out.println("usage: ScaleImage inputFile1 xValue yValue");
            System.exit(1);
        }
        try {
            new ScaleImage(args[0], args[1], args[2]);
            System.exit(0);
        } catch (IOException e) {
            if(debug)e.printStackTrace();
            System.exit(1);
        }
    }

}



