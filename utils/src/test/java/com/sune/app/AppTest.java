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
        Map env = System.getenv();

        Set setEnv = env.entrySet();

        Iterator i = setEnv.iterator();

        while(i.hasNext()){
            Object m = i.next();
            System.out.println(m.toString());
        }

        Properties prop = System.getProperties();

        for (int x= 0; x < env.size(); x++) {


        }


        new XorImages("./foobar06.jpeg", "./foobar07.jpeg", "diff.jpeg", null);
        assertTrue( true );
    }
}
