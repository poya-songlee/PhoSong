package kr.ac.kopo.phosong.component;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.kopo.phosong.dto.UserDTO;

@Component
public class MailComponent {

	@Autowired
	private JavaMailSender mailSender;

	public void sendMailTest(UserDTO user) {

		String subject = "PhoSong - 임시 비밀번호 안내";
		String content = user.getId()+"님, 계정의 비밀번호가 임시 비밀번호로 변경되었습니다."
				+"\n변경된 임시 비밀번호 : "+user.getPassword()
				+"\n보안을 위해 정상적인 비밀번호로 변경하시는 것을 추천드립니다.";
		String from = "mail address";
		String to = user.getEmail();

		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");

			mailHelper.setFrom(from);
			// 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
			// 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
			// mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
			mailHelper.setTo(to);
			mailHelper.setSubject(subject);
			mailHelper.setText(content);

			mailSender.send(mail);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
