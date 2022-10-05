package site.moregreen.basic.command;

import java.sql.Date;

import javax.persistence.Column;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberDto {
private Integer m_num;
	//주석
	@NotBlank(message = "아이디를 입력해 주세요")
	@Pattern(regexp="[a-z0-9]{8,20}", message="아이디는 영문 소문자, 숫자 8~20자리까지 가능합니다.")
	@Column(unique=true)
	private String m_id;
	
	@NotBlank(message = "비밀번호를 입력해 주세요")
	@Pattern(regexp="(?=.*[0-9])(?=.*[a-zA-Z!@#$%^&*]).{8,20}", 
				message="비밀번호는 영문 대 소문자, 숫자, 특수문자(!@#$%^&*) 8-20자리까지 가능합니다.")
	//@Pattern(regexp="(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,}", message="비밀번호는 영문 대소문자, 특수문자, 숫자를 8-20자리까지 가능합니다.")
	private String m_pw;
	
	@NotBlank(message="이메일을 입력해 주세요") //공백 null을 허용하지 않음
	//@Email(message = "이메일 형식에 맞지 않습니다.")
	@Pattern(regexp = "^(?:\\w+\\.?)*\\w+@(?:\\w+\\.)+\\w+$", message = "이메일 형식이 올바르지 않습니다.")
	@Column(unique=true) //유니크값
	private String m_email;
	
	private char m_exit;
	private Date m_exitdate;
}
