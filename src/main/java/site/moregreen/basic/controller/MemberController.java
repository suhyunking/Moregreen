package site.moregreen.basic.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.java.Log;
import site.moregreen.basic.command.MailDto;
import site.moregreen.basic.command.MemberDto;
import site.moregreen.basic.member.MailService;
import site.moregreen.basic.member.MemberService;

@Controller
@RequestMapping("/member")
@Log
public class MemberController {
	
	public final Logger logger= LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	@Qualifier("memberService")
	MemberService memberService;
	
	@Autowired
	@Qualifier("mailService")
	MailService mailService;
	
	@GetMapping("/memberReg")
	public String join() {
		return "member/memberReg";
	}
	
	@ResponseBody
	@GetMapping("/idCheck")
	public int overlappedID(MemberDto memberDto) throws Exception{
		
		return memberService.overlappedID(memberDto);
	}
	
	@PostMapping("/MemberReg")
	public String joinForm(@Valid MemberDto memberDto, Errors errors, Model model) {
		if(errors.hasErrors()) {
			
			Map<String, String> validatorResult=memberService.validateHandling(errors);
			for(String key: validatorResult.keySet()) {
				model.addAttribute(key, validatorResult.get(key));
			}
			return"member/memberReg";
		}
		memberService.registerMember(memberDto);
		return "redirect:/index";
	}
	
	
	
	@GetMapping("/memberLogin")
	public String login() {
		return "member/memberLogin";
	}
	
	@PostMapping("/loginForm")
	 public String loginForm(MemberDto memberDto, HttpServletRequest req, RedirectAttributes rttr, Model model ) throws Exception {
		 
		 HttpSession session =req.getSession();
		 MemberDto member=  memberService.loginMember(memberDto);
		if(member== null) {
			session.setAttribute("member", null);
			rttr.addAttribute("msg", false);
			model.addAttribute("fail", 1);
			
			 return"member/memberLogin";
		} else {
			session.setAttribute("member", member);
			session.setMaxInactiveInterval(1800);
			
			
			
		}
		 return"redirect:/index";
	 }
	
	@GetMapping("/memberFindId")
	public String findID() {
		return "/member/memberFindId";
	}
	
	@PostMapping("/findId")
	public String findId(MemberDto memberDto, Model model) throws Exception {
		if(memberService.findIdCheck(memberDto)==0) {
			model.addAttribute("msg",true);
			return "/member/memberFindId";
		}else {
			model.addAttribute("member", memberService.findId(memberDto));
			return "/member/memberFindIdResult";
		}
		
	}
	
	@GetMapping("/memberFindIdResult")
	public String findidResult() {
		return "member/memberFindIdResult";
	}
	
	@GetMapping("/memberFindPw")
	public String memberFindPw() {
		return "member/memberFindPw";
	}
	
	@PostMapping("/findPw")
	@ResponseBody
	public int findPw(@RequestBody MemberDto memberDto) {
		    String m_id = memberDto.getM_id();
		    String m_email = memberDto.getM_email();		    		
		    System.out.println("m_id : " + m_id);
		    System.out.println("m_email : " + m_email);
		 	int result = memberService.checkEmail(memberDto);
		 	System.out.println("result : " + result);
			return result;
	}
	
	@PostMapping("/sendPwd")
	@ResponseBody
    public String sendPwdEmail(@RequestBody MemberDto memberDto) {


        /** 임시 비밀번호 생성 **/
        String tmpPassword = memberService.getTmpPassword();
        
        /** 임시 비밀번호 저장 **/
        memberDto.setM_pw(tmpPassword);
        memberService.updatePassword(memberDto);

        /** 메일 생성 & 전송 **/
        MailDto mail = mailService.createMail(tmpPassword, memberDto);
        mailService.sendMail(mail);

        log.info("임시 비밀번호 전송 완료");

        return "member/memberLogin";
    }
    
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		//logger.info("Logout success");
		return "redirect:/";
	}
	
}
