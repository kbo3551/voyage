package com.gdu.voyage;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@ServletComponentScan
@SpringBootApplication
public class VoyageApplication {

	public static void main(String[] args) {
		SpringApplication.run(VoyageApplication.class, args);
	}

}
