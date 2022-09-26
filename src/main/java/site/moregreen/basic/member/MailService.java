package site.moregreen.basic.member;

import org.springframework.stereotype.Service;
import site.moregreen.basic.command.MailDto;
import site.moregreen.basic.command.MemberDto;
@Service
public interface MailService {

	/** 이메일 전송 **/
	public void sendMail(MailDto mail);

	/** 이메일 생성 **/
	MailDto createMail(String tmpPassword, MemberDto memberDto);

}
