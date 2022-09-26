package site.moregreen.basic.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import site.moregreen.basic.command.FundingDto;
import site.moregreen.basic.command.MemberDto;
import site.moregreen.basic.funding.FundingService;
import site.moregreen.basic.member.MemberService;
import site.moregreen.basic.util.Criteria;
import site.moregreen.basic.util.PageVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
		
	@Value("${project.upload.path}")
	private String uploadPath;
	 
	@Autowired
	@Qualifier("fundingService")
	FundingService fundingService;	

	@Autowired()
	@Qualifier("memberService")
	MemberService memberService;
	
	@GetMapping("/adminportal")
	public String adminportal() {
		return "admin/adminportal";
	}

	@GetMapping
	public String signIn() {
		
		return "admin/adminSignin";
	}
	
	@PostMapping("/loginForm")
	public String loginForm(MemberDto memberDto, HttpServletRequest req, RedirectAttributes rttr, Model model ) throws Exception {
		HttpSession session =req.getSession();
		 MemberDto member=  memberService.loginMember(memberDto);
		
		 
		 if(member.getM_id().equals("admin")) {
			 session.setAttribute("member", member);
				session.setMaxInactiveInterval(1800);
				//System.out.println("admin 로그인 됨");
				//System.out.println(member);
				return"redirect:/admin/adminportal";
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			//System.out.println("로그인 안됨");
			model.addAttribute("fail", 1);
		}
		
		return"redirect:/admin";
	}

	@GetMapping("/fundingList")
	public String fundingList(Model model, Criteria cri, HttpSession session) {

		List<FundingDto> list = fundingService.retriveFundingList(cri);
		int total = fundingService.retrieveTotal(cri);
		PageVo pageVO = new PageVo(cri, total);

		model.addAttribute("list", list);
		model.addAttribute("pageVO", pageVO);

		return "admin/fundingList";
	}
	
	@GetMapping("/fundingApplyList")
	public String fundingApplyList(Model model, Criteria cri, HttpSession session) {

		List<FundingDto> list = fundingService.retrieveFundingApplyList(cri);
		int total = fundingService.retrieveApplyListTotal(cri);
		PageVo pageVO = new PageVo(cri, total);

		model.addAttribute("list", list);
		model.addAttribute("pageVO", pageVO);

		return "admin/fundingApplyList";
	}
	

	@GetMapping("/fundingConfirm")
	public String fundingConfirm(@RequestParam("f_num") int f_num,
								 Model model) {

		List<FundingDto> fundingList = fundingService.retrieveFundingDetail(f_num);
		model.addAttribute("fundingList", fundingList);

		return "admin/fundingConfirm";
	}
	
	// 펀딩 수정 페이지로 이동
	@GetMapping("/fundingModify")
	public String fundingModify(@RequestParam("f_num") int f_num,
								Model model) {
		
		List<FundingDto> fundingList = fundingService.retrieveFundingDetail(f_num);
		model.addAttribute("fundingList", fundingList);
		
		return "admin/fundingModify";
	}
	
	@PostMapping("/modifyFunding")
	public String modifyFunding(FundingDto dto, RedirectAttributes RA) {
		
		int result = fundingService.modifyFunding(dto);
		//메시지처리(리다이렉트 시 1회성 메시지를 보내는 방법)
		if(result == 1) {
			RA.addFlashAttribute("msg", "수정 되었습니다");
		} else {
			RA.addFlashAttribute("msg", "수정에 실패했습니다");
		}
		
		return "redirect:/admin/fundingList";
	}

	@GetMapping("/orderList")
	public String orderList() {
		return "admin/orderList";
	}
	
	@GetMapping("/userList")
	public String userList(Model model, Criteria cri, HttpSession session) {
		
		  System.out.println("================" + cri.getM_id());
		  List<MemberDto> list= memberService.retrieveMemberList(cri); 
		  int total=memberService.retrieveTotal(cri); 
		  PageVo pageVO= new PageVo(cri,total); 
		  model.addAttribute("list", list); 
		  model.addAttribute("pageVO", pageVO);
		 
		return "admin/userList";
	}
	

	@PostMapping("/fundingAccept")
	public String fundingAccept(@RequestParam(value="f_num", required=false) int f_num, RedirectAttributes RA) {
		
		int result = fundingService.fundingAccept(f_num);
		//메시지처리(리다이렉트 시 1회성 메시지를 보내는 방법)
		if(result == 1) {
			RA.addFlashAttribute("msg", "정상 수정 되었습니다");
		} else {
			RA.addFlashAttribute("msg", "정보 수정에 실패했습니다");
		}

		return "redirect:/admin/fundingApplyList";
	}
	
	@PostMapping("/fundingReject")
	public String fundingReject(@RequestParam(value="f_num", required=false) int f_num, RedirectAttributes RA) {
		
		int result = fundingService.fundingReject(f_num);
		//메시지처리(리다이렉트 시 1회성 메시지를 보내는 방법)
		if(result == 1) {
			RA.addFlashAttribute("msg", "정상 수정 되었습니다");
		} else {
			RA.addFlashAttribute("msg", "정보 수정에 실패했습니다");
		}

		return "redirect:/admin/fundingApplyList";
	}
	

}
