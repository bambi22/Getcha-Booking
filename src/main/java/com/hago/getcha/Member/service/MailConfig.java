package com.hago.getcha.Member.service;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig {
	@Bean
	public static JavaMailSender mailSender() {
		JavaMailSenderImpl jms = new JavaMailSenderImpl();
		Properties prop = new Properties();
		prop.put("mail.smtp.tls.starttls.enable", "true");
		prop.put("mail.transport.protocol", "smtp");
		prop.put("mail.smtp.auth", "true");
		//prop.setProperty("mail.smtp.tls.starttls.enable", "true");
		//prop.setProperty("mail.smtp.auth", "true");
		//prop.setProperty("mail.transport.protocol", "smtp");
		prop.put("maill.smtp.debug", "true");
		
		jms.setJavaMailProperties(prop);
		
		jms.setHost("smtp.gmail.com");
		jms.setPort(587);
		jms.setUsername("alba576801@gamin.com");
		jms.setPassword("Alba-!5768");
		jms.setDefaultEncoding("utf-8");

		return jms;
	}
}
