package site.moregreen.basic.member;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import site.moregreen.basic.command.MailDto;
import site.moregreen.basic.command.MemberDto;


@Service("mailService")
@Transactional
@RequiredArgsConstructor
@Slf4j
public class MailServiceImpl implements MailService {

    private final JavaMailSender mailSender;
    
    private static final String title = "Moregreen 임시 비밀번호 안내 이메일입니다.";
    private static final String message = "안녕하세요. Moregreen 임시 비밀번호 안내 메일입니다. "
            +"\n" + "회원님의 임시 비밀번호는 아래와 같습니다. 로그인 후 반드시 비밀번호를 변경해주세요."+"\n";
    private static final String fromAddress = "moregreen0921@gmail.com";

    /** 이메일 생성 **/
    @Override
    public MailDto createMail(String tmpPassword, MemberDto memberDto) {

        MailDto mail = MailDto.builder()
                .toAddress(memberDto.getM_email())
                .title(title)
                .message(message + tmpPassword)
                .fromAddress(fromAddress)
                .build();

        log.info("메일 생성 완료");
        return mail;
    }

    /** 이메일 전송 **/
    @Override
    public void sendMail(MailDto mail) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(mail.getToAddress());
        mailMessage.setSubject(mail.getTitle());
        mailMessage.setText(mail.getMessage());
        mailMessage.setFrom(mail.getFromAddress());
        mailMessage.setReplyTo(mail.getFromAddress());

        mailSender.send(mailMessage);

        log.info("메일 전송 완료");
    }
}