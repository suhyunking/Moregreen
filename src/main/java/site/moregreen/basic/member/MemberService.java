package site.moregreen.basic.member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.validation.Errors;

import site.moregreen.basic.command.MemberDto;
import site.moregreen.basic.util.Criteria;

public interface MemberService {
	// 회원가입
	public int registerMember(MemberDto memberDto);

	// 회원 아이디 중복체크
	public int overlappedID(MemberDto memberDto) throws Exception;

	// 회원가입 유효성
	public Map<String, String> validateHandling(Errors errors);

	// 회원 로그인
	public MemberDto loginMember(MemberDto memberDto);

	// 회원 로그아웃
	public void logout(HttpSession session);

	// 아이디 찾기
	public MemberDto findId(MemberDto memberDto) throws Exception;

	public int findIdCheck(MemberDto memberDto) throws Exception;

	// 비밀번호변경
	public int updatePw(MemberDto memberDto);

	public int pwCheck(MemberDto memberDto) throws Exception;

	// 회원탈퇴
	public int exitMember(MemberDto memberDto, HttpSession session);

	// 비밀번호 찾기
	public int checkEmail(MemberDto memberDto);

	public String getTmpPassword();

	public int updatePassword(MemberDto memberDto);

	// 관리자 회원목록
	public List<MemberDto> retrieveMemberList(Criteria cri);

	public int retrieveTotal(Criteria cri);

	public int retrievePw(String m_id, String m_email);

}
