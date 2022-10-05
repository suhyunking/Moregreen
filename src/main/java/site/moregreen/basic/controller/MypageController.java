package site.moregreen.basic.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.java.Log;
import site.moregreen.basic.command.FundingDto;
import site.moregreen.basic.command.LikeDto;
import site.moregreen.basic.command.MemberDto;
import site.moregreen.basic.command.PurchaseDto;
import site.moregreen.basic.like.LikeService;
import site.moregreen.basic.member.MemberService;
import site.moregreen.basic.myPage.MyPageService;
import site.moregreen.basic.util.Criteria;
import site.moregreen.basic.util.PageVo;


@Log
@Controller
@RequestMapping("/mypage")
public class MypageController {

	
	@Autowired
	@Qualifier("myPageService")
	MyPageService myPageService;

	
	@Autowired
	@Qualifier("likeService")
	LikeService likeService;

	@Autowired
	@Qualifier("memberService")
	MemberService memberService;
	
	@GetMapping("/fundingLikeList")
	public String fundingLikeList(HttpServletRequest request, Criteria cri, Error error, Model model, HttpSession session) {	
		session = request.getSession();
		
		MemberDto mDto = (MemberDto)session.getAttribute("member");
		int m_num = mDto.getM_num();
		cri.setM_num(m_num);
		
		int total = myPageService.retrieveTotal(cri);
		PageVo pageVo = new PageVo(cri, total);
		
		List<FundingDto> list = myPageService.retrieveFuningLikeList(cri);
		model.addAttribute("list", list);
		model.addAttribute("pageVO", pageVo);
		
		return "mypage/fundingLikeList";
	}
	
	@GetMapping("/myProjectList")
	public String myProjectList(HttpServletRequest request, Criteria cri, Error error, Model model, HttpSession session) {
		session = request.getSession();
		
		MemberDto mmDto = (MemberDto)session.getAttribute("member");
		int m_num = mmDto.getM_num();
		cri.setM_num(m_num);
		
		int total = myPageService.retrieveTotal(cri);
		PageVo pageVo = new PageVo(cri, total);
		
		List<FundingDto> list = myPageService.retrieveMyProjectList(cri);
		model.addAttribute("list", list);
		model.addAttribute("pageVO", pageVo);
		return "mypage/myProjectList";
	}
	

	
	@GetMapping("/purchaseList")
	public String purchaseList(HttpServletRequest request, HttpSession session, Criteria cri, Error error, Model model) {
		session = request.getSession();
		MemberDto mDto = (MemberDto)session.getAttribute("member");
		int m_num = mDto.getM_num();
		cri.setM_num(m_num);
		int total = myPageService.retrieveTotal(cri);
		
		List<PurchaseDto> list = myPageService.retrieveMyPurchaseList(cri);
		
		PageVo pageVo = new PageVo(cri, total);
		model.addAttribute("list", list);
		model.addAttribute("pageVO", pageVo);
		
		return "mypage/purchaseList";
		
		
	}
	
	 @GetMapping("/purchaseDetail") 
	 public String purchaseDetail(@RequestParam("m_num") int m_num, @RequestParam("p_num") int p_num, Model model) {

	PurchaseDto purchaseDto = PurchaseDto
    		 				   .builder()
    		 				   .m_num(m_num)
    		 				   .p_num(p_num)
    		 				   .build();
     
	 PurchaseDto dto = myPageService.retrieveMyPurchaseDetail(purchaseDto);
	 
	 model.addAttribute("dto", dto);
	 
	 return "mypage/purchaseDetail"; 
	 }
	 
	
	@GetMapping("/test")
	public String test() {
		return "mypage/test";
	}

	
	@PostMapping("/deleteFundingLikeButton")
	public String deleteFundingLikeButton(@RequestParam("m_num") int m_num, @RequestParam("f_num") int f_num, LikeDto likeDto) {
		
		likeDto.setF_num(f_num);
		likeDto.setM_num(m_num);
		
		likeService.removeFundingLike(likeDto); 
		
		return "myPage/fundingLikeList";
		
	}


	@GetMapping("/changePw")
	public String changePw()throws Exception {
		return "mypage/changePw";
	}

	@PostMapping("/changePwForm")
	public String changePwForm(@Valid MemberDto memberDto, Errors errors, Model model, HttpSession session) {
		if (errors.hasErrors()) {
			Map<String, String> validatorResult = memberService.validateHandling(errors);
			for (String key : validatorResult.keySet()) {
				model.addAttribute(key, validatorResult.get(key));
			}
			session.invalidate();
			memberService.updatePw(memberDto);
			return "redirect:http://localhost:8383/member/memberLogin";
		}
		return "mypage/changePw";
	}

	@GetMapping("/deleteMember")
	public void deleteMember() throws Exception {

	}

	@PostMapping("/deleteForm")
	public String deleteForm(MemberDto memberDto, HttpSession session) {
		session.invalidate();
		memberService.exitMember(memberDto, session);

		return "redirect:http://localhost:8383/";
	}
}
