package com.sune.app;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.awt.image.DataBuffer;
import java.awt.image.Raster;
import java.io.File;
import java.io.IOException;

/**
 * Take the XOR between two images, and save the result as jpeg.
 *
 */
public class XorImages

{
    static boolean debug = true;

    XorImages(String in1, String in2, String diff, String ignore) throws IOException {

        BufferedImage image1;
        BufferedImage image2;

        int delta;

        if(ignore == null)delta = 10; else delta = Integer.parseInt(ignore);


        File imageFile1 = new File(in1);
        image1 = ImageIO.read(imageFile1);
        Raster raster1 = image1.getRaster();
        DataBuffer dataBuffer1 = raster1.getDataBuffer();

        if(debug)System.out.println("Height: " + image1.getHeight());
        if(debug)System.out.println("Width: " + image1.getWidth());
        if(debug)System.out.println("Type: " + image1.getType() + " == " + BufferedImage.TYPE_3BYTE_BGR);
        if(debug)System.out.println("NumOfEle: " + raster1.getNumDataElements());
        if(debug)System.out.println("Size: " + dataBuffer1.getSize());
        if(debug)System.out.println("Banks: " + dataBuffer1.getNumBanks());

        File imageFile2 = new File(in2);
        image2 = ImageIO.read(imageFile2);
        Raster raster2 = image2.getRaster();
        DataBuffer dataBuffer2 = raster2.getDataBuffer();

        if(debug)System.out.println("Height: " + image2.getHeight());
        if(debug)System.out.println("Width: " + image2.getWidth());
        if(debug)System.out.println("Type: " + image2.getType() + " == " + BufferedImage.TYPE_3BYTE_BGR);
        if(debug)System.out.println("NumOfEle: " + raster2.getNumDataElements());
        if(debug)System.out.println("Size: " + dataBuffer2.getSize());
        if(debug)System.out.println("Banks: " + dataBuffer2.getNumBanks());

        if((image1.getHeight() == image2.getHeight())
                &&  (image1.getWidth() == image2.getWidth())
                &&  (image1.getType() == image2.getType())
                )
        {
            for(int bank = 0; bank < dataBuffer1.getNumBanks(); bank++){
                for(int x = 0; x < dataBuffer1.getSize(); x++){

                    int n = dataBuffer1.getElem(x);
                    int m = dataBuffer2.getElem(x);

                    if(m > 0xff){
//                        System.out.println("Got: " + m);
                    }
                    if(n > 0xff){
//                        System.out.println("Got: " + m);
                    }

                    m = m & 0x7c;
                    n = n & 0x7c;

                    int d = n - m ;

                    if(d < 0){
//                        System.out.println("Got: " + d);
                        d = -d;
                    }

                    if (d < delta){
                        d = 0;
                    }

                    if (d == 0){
                        d = -1;
                    }

                    dataBuffer2.setElem(bank, x, d);
                }
            }
            ImageIO.write(image2, "jpg",new File(diff));
        }
        else
        {

            throw new IllegalArgumentException("Images do not match");
        }

    }

    public static void main( String[] args )
    {
        if(args.length < 4){
            System.out.println("usage: XorImages inputFile1 inputFile2 outputFile value");
            System.exit(1);
        }

        try {
            new XorImages (args[0], args[1], args[2], args[3]);
            System.exit(0);
        } catch (IOException e) {
            if(debug)e.printStackTrace();
            System.exit(1);
        }
    }
}
