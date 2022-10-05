package site.moregreen.basic.member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.validation.Errors;

import site.moregreen.basic.command.MemberDto;
import site.moregreen.basic.util.Criteria;

@Mapper
public interface MemberMapper {
	// 회원가입
	public int insertMember(MemberDto memberDto);

	// 회원 아이디 중복체크
	public int overlappedID(MemberDto memberDto) throws Exception;

	// 회원가입 유효성
	public Map<String, String> validateHandling(Errors errors);

	// 회원 로그인
	public MemberDto login(MemberDto memberDto);

	// 회원 로그아웃
	public void logout(HttpSession session);

	// 아이디 찾기
	public MemberDto findId(MemberDto memberDto) throws Exception;

	public int findIdCheck(MemberDto memberDto) throws Exception;

	// 비밀번호변경
	public void updatePw(MemberDto memberDto);

	public int pwCheck(MemberDto memberDto) throws Exception;

	// 회원탈퇴
	public void exitMember(MemberDto memberDto);

	// 비밀번호 찾기
	public int existsByEmail(MemberDto memberDto);

	public int findPassword(MemberDto memberDto);

	// 관리자
	public List<MemberDto> selectMemberList(Criteria cri);

	public int selectTotal(Criteria cri);

	public int findPw(String m_id, String m_email);
	
	//이메일 중복확인
	public int overlappedEmail(MemberDto memberDto);

}
