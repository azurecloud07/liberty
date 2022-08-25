package com.viteos.itg;

import java.nio.file.Paths;

import org.jboss.logging.Logger;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;


@Configuration
@ComponentScan
@SpringBootApplication
public class ITGCoreApplication extends SpringBootServletInitializer {
	
	static Logger logger = Logger.getLogger(ITGCoreApplication.class.getName());
	
    public static void main( String[] args ) {
        
        SpringApplication.run(ITGCoreApplication.class, args);
    }
    
   
}