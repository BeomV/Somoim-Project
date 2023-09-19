package test.com.moim.userinfo.controller;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class EmailSender {

	@Autowired
	protected JavaMailSender mailSender;

	public void SendEmail(Email email) throws Exception {
		MimeMessage msg = mailSender.createMimeMessage();
//		msg.setHeader("Content-Type", "text/plain; charset=UTF-8");
//		msg.setContent(email.getContent(), "UTF-8");
		msg.setSubject(email.getSubject());
		msg.setText(email.getContent());
		msg.setRecipient(RecipientType.TO, new InternetAddress(email.getReceiver()));

		mailSender.send(msg);
	}
}

