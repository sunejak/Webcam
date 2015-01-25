package com.sune.app;

import java.io.IOException;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

/**
 * Experiment with rotating logging
 *
 * @author ttjsun
 * @version  21/09/14 20:10
 *
 *
 */
public class SomeLogging {

    Logger logger = Logger.getLogger(this.getClass().getPackage().getName());

    SomeLogging() throws IOException, InterruptedException {

        boolean append = true;
        FileHandler fh = new FileHandler("mylogfile%g.log", 50000000, 100, append);
        fh.setFormatter(new SimpleFormatter());
        logger.addHandler(fh);

        Thread.sleep(1000);

        logger.setLevel(Level.ALL);

        logger.entering("enter", "call");
        // logger.severe("Serious?");
        logger.exiting("exit", "call");

    }

    public static void main( String[] args ){

        try {
            new SomeLogging();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

}
