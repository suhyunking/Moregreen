package site.moregreen.basic.member;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import lombok.extern.java.Log;
import site.moregreen.basic.command.MemberDto;
import site.moregreen.basic.util.Criteria;

@Service("memberService")
@Log
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;
	@Override
	public int registerMember(MemberDto memberDto) {
		return memberMapper.insertMember(memberDto);
	}
	
	@Override
	public int overlappedID(MemberDto memberDto) throws Exception {
		int result= memberMapper.overlappedID(memberDto);
		return result;
	}
	
	//회원가입 시 유효성 체크
		@Override
		public Map<String, String> validateHandling(Errors errors) {
			Map<String, String> validatorResult= new HashMap<>();
			for(FieldError error: errors.getFieldErrors()) {
				String validKeyName= String.format("valid_%s", error.getField());
				validatorResult.put(validKeyName, error.getDefaultMessage());
			}
			return validatorResult;
		}

		@Override
		public MemberDto loginMember(MemberDto memberDto) {

			return memberMapper.login(memberDto);
		}

		@Override
		public void logout(HttpSession session) {
			
		}
		
		@Override
		public int findIdCheck(MemberDto memberDto) throws Exception {

			return memberMapper.findIdCheck(memberDto);
		}

		@Override
		public MemberDto findId(MemberDto memberDto) throws Exception {

			return memberMapper.findId(memberDto);
		}

		@Override
		public int updatePw(MemberDto memberDto) {
			
			 memberMapper.updatePw(memberDto);
			 return 0;
		}

		@Override
		public int exitMember(MemberDto memberDto, HttpSession session) {
			
			memberMapper.exitMember(memberDto);
			return 0;
		}

		@Override
		public int pwCheck(MemberDto memberDto) throws Exception {
			
			return memberMapper.pwCheck(memberDto);
		}

		@Override
		public int checkEmail(MemberDto memberDto) {
			
			return memberMapper.existsByEmail(memberDto);
		}

		/** 임시 비밀번호 생성 **/
	    @Override
	    public String getTmpPassword() {
	        char[] charSet = new char[]{ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
	                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
	                'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};

	        String str = "";

	        /* 문자 배열 길이의 값을 랜덤으로 10개를 뽑아 조합 */
	        int idx = 0;
	        for(int i = 0; i < 10; i++){
	            idx = (int) (charSet.length * Math.random());
	            str += charSet[idx];
	        }

	        log.info("임시 비밀번호 생성");

	        return str;
	    }
	    
	    @Override
	    public int updatePassword(MemberDto memberDto) {

	        memberMapper.findPassword(memberDto);
	        
	        return 0 ;
	  
	    }		
		//관리자 회원 목록
		@Override
		public List<MemberDto> retrieveMemberList(Criteria cri) {
			
			return memberMapper.selectMemberList(cri);
		}

		@Override
		public int retrieveTotal(Criteria cri) {
			return memberMapper.selectTotal(cri);
		}

		@Override
		public int retrievePw(String m_id, String m_email) {
			return memberMapper.findPw(m_id, m_email);
		}

		@Override
		public int overlappedEmail(MemberDto memberDto) {
			
			return memberMapper.overlappedEmail(memberDto);
		}

	
	

}
