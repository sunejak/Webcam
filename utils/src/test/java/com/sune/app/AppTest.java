package com.sune.app;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

/**
 * Unit test for simple App.
 */
public class AppTest 
    extends TestCase
{
    /**
     * Create the test case
     *
     * @param testName name of the test case
     */
    public AppTest( String testName )
    {
        super( testName );
    }

    /**
     * @return the suite of tests being tested
     */
    public static Test suite()
    {
        return new TestSuite( AppTest.class );
    }

    /**
     * Rigorous Test :-)
     */
    public void testApp() throws IOException
    {
        /*
        Map<String, String> env = System.getenv();
        Set<Map.Entry<String, String>> setEnv = env.entrySet();
        Iterator i = setEnv.iterator();

        while(i.hasNext()){
            Object m = i.next();
            System.out.println(m.toString());
        }

        Properties prop = System.getProperties();
            Set<String> setPro= prop.stringPropertyNames();
            i = setPro.iterator();

        while(i.hasNext()){
            Object m = i.next();
            System.out.println(m.toString() + "=" + prop.getProperty(m.toString()));
        }

         */

        XorImages n = new XorImages("/home/ttjsun/2022/Webcam/utils/cam0_2022_Mar_20_0744_0.jpeg",
                "/home/ttjsun/2022/Webcam/utils/cam0_2022_Mar_20_0844_0.jpeg",
                "/home/ttjsun/2022/Webcam/utils/diff.jpeg", null);
        System.out.println("Created diff");

        ScaleImage m = new ScaleImage("/home/ttjsun/2022/Webcam/utils/diff.jpeg", "300", "300");
        System.out.println("Scaled diff");

        SubImage o = new SubImage("/home/ttjsun/2022/Webcam/utils/cam0_2022_Mar_20_0744_0.jpeg", "400", "750", "1700", "750");
        System.out.println("Sub image");
    }
}
