package site.moregreen.basic.controller;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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

import lombok.extern.slf4j.Slf4j;
import site.moregreen.basic.alarm.AlarmService;
import site.moregreen.basic.command.AlarmDto;
import site.moregreen.basic.command.FundingDto;
import site.moregreen.basic.command.MemberDto;
import site.moregreen.basic.command.PurchaseDto;
import site.moregreen.basic.funding.FundingService;
import site.moregreen.basic.member.MemberService;
import site.moregreen.basic.purchase.PurchaseService;
import site.moregreen.basic.util.Criteria;
import site.moregreen.basic.util.PageVo;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
		
	@Value("${project.upload.path}")
	private String uploadPath;
	 
	@Autowired
	@Qualifier("fundingService")
	FundingService fundingService;	
	
	@Autowired
	@Qualifier("purchaseService")
	PurchaseService purchaseService;	
	
	@Autowired
	@Qualifier("alarmService")
	AlarmService alarmService;

	@Autowired()
	@Qualifier("memberService")
	MemberService memberService;
	
	@GetMapping("/adminportal")
	public String adminportal() {
		return "admin/adminportal";
	}

	@GetMapping("/adminSignin")
	public String admin() {
      
		return "admin/adminSignin";
	}
	
	@PostMapping("/adminForm")
	public String loginForm(MemberDto memberDto, HttpServletRequest req, RedirectAttributes rttr, Model model ) throws Exception {
		HttpSession session =req.getSession();
		 MemberDto member = memberService.loginMember(memberDto);
		System.out.println("========getContextPath========" + req.getContextPath());
		System.out.println("========session========" + member.getM_id());
		 if(member.getM_id().equals("admin") && member.getM_pw().equals("admin")) {
			 session.setAttribute("member", member);
				session.setMaxInactiveInterval(1800);
				log.debug(""+ session.getAttribute("member"));
				return"redirect:/admin/userList";
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			model.addAttribute("fail", 1);
		}
		
		return"redirect:/admin/adminSignin";
	}

	@GetMapping("/fundingList")
	public String fundingList(Model model, Criteria cri, HttpSession session) {

		List<FundingDto> list = fundingService.retriveAdminFundingList(cri);
		int total = fundingService.retrieveTotal(cri);
		PageVo pageVO = new PageVo(cri, total);
		
		List<AlarmDto> alarmList = alarmService.retrieveAlarmList();
		
		model.addAttribute("alarmList", alarmList);
		
		model.addAttribute("list", list);
		model.addAttribute("pageVO", pageVO);

		return "admin/fundingList";
	}
	
	@GetMapping("/fundingApplyList")
	public String fundingApplyList(Model model, Criteria cri, HttpSession session) {

		List<FundingDto> list = fundingService.retrieveFundingApplyList(cri);
		int total = fundingService.retrieveApplyListTotal(cri);
		PageVo pageVO = new PageVo(cri, total);

		List<AlarmDto> alarmList = alarmService.retrieveAlarmList();
		
		model.addAttribute("alarmList", alarmList);
		model.addAttribute("list", list);
		model.addAttribute("pageVO", pageVO);

		return "admin/fundingApplyList";
	}
	

	@GetMapping("/fundingConfirm")
	public String fundingConfirm(@RequestParam("f_num") int f_num,
								 Model model) {

		List<FundingDto> fundingList = fundingService.retrieveFundingDetail(f_num);
		model.addAttribute("fundingList", fundingList);

		List<AlarmDto> alarmList = alarmService.retrieveAlarmList();
		model.addAttribute("alarmList", alarmList);	
		
		return "admin/fundingConfirm";
	}
	
	// 펀딩 수정 페이지로 이동
	@GetMapping("/fundingModify")
	public String fundingModify(@RequestParam("f_num") int f_num,
								Model model) {
		
		List<FundingDto> fundingList = fundingService.retrieveFundingDetail(f_num);
		model.addAttribute("fundingList", fundingList);
		
		List<AlarmDto> alarmList = alarmService.retrieveAlarmList();
		model.addAttribute("alarmList", alarmList);	
		
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

	@GetMapping("/fundingOrderList")
	public String fundingOrderList(Criteria cri, Model model) {
		
		List<PurchaseDto> list = purchaseService.retrievePurchaseList(cri);
		int total = purchaseService.retrievePurchaseTotal(cri); 
		PageVo pageVO= new PageVo(cri, total); 
		
		List<AlarmDto> alarmList = alarmService.retrieveAlarmList();
		
		model.addAttribute("alarmList", alarmList);
		model.addAttribute("list", list);
		model.addAttribute("pageVO", pageVO);
		
		return "admin/fundingOrderList";
	}
	
	@GetMapping("/userList")
	public String userList(Model model, Criteria cri, HttpSession session) {
		
		  List<MemberDto> list= memberService.retrieveMemberList(cri); 
		  int total = memberService.retrieveTotal(cri);
		  PageVo pageVO= new PageVo(cri,total); 
		  List<AlarmDto> alarmList = alarmService.retrieveAlarmList();
			
		  model.addAttribute("alarmList", alarmList);
		  model.addAttribute("list", list); 
		  model.addAttribute("pageVO", pageVO);
		 
		return "admin/userList";
	}
	

	@PostMapping("/fundingAccept")
	public String fundingAccept(@RequestParam(value="f_num", required=false) int f_num, 
								@RequestParam(value="f_acceptor", required=false) String f_acceptor, 
								RedirectAttributes RA) {
		
		Date now = Calendar.getInstance().getTime();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String f_confirmdate = formatter.format(now);
		
		FundingDto dto = FundingDto.builder().f_num(f_num).f_acceptor(f_acceptor).f_confirmdate(f_confirmdate).build();
		int result = fundingService.fundingAccept(dto);
		//메시지처리(리다이렉트 시 1회성 메시지를 보내는 방법)
		if(result == 1) {
			RA.addFlashAttribute("msg", "정상 수정 되었습니다");
		} else {
			RA.addFlashAttribute("msg", "정보 수정에 실패했습니다");
		}

		return "redirect:/admin/fundingApplyList";
	}
	
	@PostMapping("/fundingReject")
	public String fundingReject(@RequestParam(value="f_num", required=false) int f_num, 
								@RequestParam(value="f_acceptor", required=false) String f_acceptor, 
								RedirectAttributes RA) {
		
		Date now = Calendar.getInstance().getTime();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String f_confirmdate = formatter.format(now);
		
		FundingDto dto = FundingDto.builder().f_num(f_num).f_acceptor(f_acceptor).f_confirmdate(f_confirmdate).build();
		int result = fundingService.fundingReject(dto);
		//메시지처리(리다이렉트 시 1회성 메시지를 보내는 방법)
		if(result == 1) {
			RA.addFlashAttribute("msg", "정상 수정 되었습니다");
		} else {
			RA.addFlashAttribute("msg", "정보 수정에 실패했습니다");
		}

		return "redirect:/admin/fundingApplyList";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		//logger.info("Logout success");
		return "redirect:/admin/adminSignin";
	}
	

}
