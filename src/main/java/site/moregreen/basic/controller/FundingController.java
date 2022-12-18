package site.moregreen.basic.controller;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import site.moregreen.basic.command.DeliveryDto;
import site.moregreen.basic.command.FundingDto;
import site.moregreen.basic.command.PurchaseDto;
import site.moregreen.basic.command.ReplyDto;
import site.moregreen.basic.funding.FundingService;
import site.moregreen.basic.kakaoPay.KakaoPayService;
import site.moregreen.basic.like.LikeService;
import site.moregreen.basic.purchase.PurchaseService;
import site.moregreen.basic.reply.ReplyService;
import site.moregreen.basic.util.Criteria;
import site.moregreen.basic.util.PageVo;

@Slf4j
@Controller
@RequestMapping("/funding")
public class FundingController {

	@Setter(onMethod_ = @Autowired)
    private KakaoPayService kakaopayService;
	
	@Autowired
	@Qualifier("fundingService")
	FundingService fundingService;
	
	@Autowired
	@Qualifier("purchaseService")
	PurchaseService purchaseService;

	@Autowired
	@Qualifier("likeService")
	LikeService likeService;
	
	@Autowired
	@Qualifier("replyService")
	ReplyService replyService;
	
	
	@GetMapping("/fundingList")
	public String fundingList(Model model, 
							  Criteria cri, 
							  HttpSession session ){
		cri.setAmount(9);
		List<FundingDto> fundingList = fundingService.retriveFundingList(cri);
		
		int total = fundingService.retrieveTotal(cri);
		PageVo pageVo = new PageVo(cri, total);

		model.addAttribute("fundingList", fundingList);
		model.addAttribute("pageVO", pageVo);
		
		return "funding/fundingList";
	}
	
	@GetMapping("/fundingDetail")
	public String fundingDetail(@RequestParam("f_num") int f_num, Model model) {
		List<FundingDto> fundingList = fundingService.retrieveFundingDetail(f_num);
		model.addAttribute("fundingList", fundingList);
		FundingDto fundingDto = fundingList.get(0);
		int heart = 0;
		
		if(fundingDto.getL_count() != null) {
			heart = fundingDto.getL_count();
		}
		
		List<ReplyDto> replyList = replyService.retrieveReplyList(f_num);
		
		model.addAttribute("replyList", replyList);
		model.addAttribute("heart", heart);
		
		return "/funding/fundingDetail"; 
	}
	
	@PostMapping("/purchaseForm")
	public String purchaseForm(@RequestParam("f_num") int f_num,
								@Valid PurchaseDto purchaseDto, 
								Model model, Error error) {
		
		DeliveryDto deliveryDto = fundingService.retrieveDelivery(purchaseDto.getM_num());
		model.addAttribute("deliveryDto", deliveryDto);
		
		List<FundingDto> fundingList = fundingService.retrieveFundingDetail(f_num);
		model.addAttribute("fundingList", fundingList);
		
		return "funding/fundingPurchase";
	}
	
	@GetMapping("fundingReg")
	public String fundingReg() {
		return "funding/fundingReg";
	}

	@PostMapping("/fundingForm")
	public String fundingForm(@Valid FundingDto dto, Errors errors, Model model,
						  	  @RequestParam("file") List<MultipartFile> files,
						  	@RequestParam("mainFile") List<MultipartFile> mainFiles,
						  	@RequestParam("contentFile") List<MultipartFile> contentFiles,
						  	HttpServletRequest request) {
		
		
		if(errors.hasErrors()) {
			List<FieldError> list = errors.getFieldErrors();
			for(FieldError err : list) {
				if(err.isBindingFailure() ) {
					model.addAttribute("valid_" + err.getField(), "형식을 일치 시켜주세요");
				}else {
					model.addAttribute("valid_" + err.getField(), err.getDefaultMessage());
				}
			}
		model.addAttribute("dto", dto);	
		return "funding/fundingReg";
		}
		
		files = files.stream().filter( (f) -> !f.isEmpty()).collect(Collectors.toList());
		//이미지파일검증
		for(MultipartFile f : files ) {
			if( f.getContentType().contains("image") == false ) { //이미지가 아닌경우 다시 등록화면으로
				model.addAttribute("dto", dto);
				model.addAttribute("valid_files", "이미지 형식만 등록 가능합니다");
				return "funding/fundingReg";
			}
		}
		
		mainFiles = mainFiles.stream().filter( (f) -> !f.isEmpty()).collect(Collectors.toList());
		//이미지파일검증
		for(MultipartFile f : mainFiles ) {
			if( f.getContentType().contains("image") == false ) { //이미지가 아닌경우 다시 등록화면으로
				model.addAttribute("dto", dto);
				model.addAttribute("valid_files", "이미지 형식만 등록 가능합니다");
				return "funding/fundingReg";
			}
		}
		
		contentFiles = contentFiles.stream().filter( (f) -> !f.isEmpty()).collect(Collectors.toList());
		//이미지파일검증
		for(MultipartFile f : contentFiles ) {
			if( f.getContentType().contains("image") == false ) { //이미지가 아닌경우 다시 등록화면으로
				model.addAttribute("dto", dto);
				model.addAttribute("valid_files", "이미지 형식만 등록 가능합니다");
				return "funding/fundingReg";
			}
		}
		
		int result = fundingService.addFunding(dto, files, mainFiles, contentFiles);
		
		if(result != 0) {
	        request.setAttribute("f_num", result);
	        log.debug("====================" + request.getAttribute("f_num"));
			return "forward:/funding/fundingRegSuccess";
		}else {
			return "forward:/funding/fundingRegFail";
		}
	}

	@GetMapping("fundingPurchase")
	public String fundingPurchase() {
		return "funding/fundingPurchase";
	}

	@GetMapping("fundingPurchaseResult")
	public String fundingPurchaseResult(@RequestParam("pg_token") String pg_token, 
										Model model) {
		
		Map<String, Object> hashMap = kakaopayService.kakaoPayInfo(pg_token);
		int result = purchaseService.addPurchase(hashMap);
		System.out.println("============result=================" + result);
		
		model.addAttribute("info", hashMap.get("kakaoPayApprovalVO"));
		
		return "funding/fundingPurchaseResult";
	}
	
	@GetMapping("fundingPurchaseCancel")
	public String fundingPurchaseCancel() {
		return "/funding/fundingPurchaseCancel";
	}
	
	@GetMapping("fundingPurchaseFail")
	public String fundingPurchaseFail() {
		return "funding/fundingPurchaseFail";
	}
	
	@GetMapping("fundingRefund")
	public String fundingRefund() {
		return "funding/fundingRefund";
	}
	
	@PostMapping("fundingRegSuccess")
	public String fundingRegSuccess(HttpServletRequest request,
									Model model) {
		int f_num = (int) request.getAttribute("f_num");
		System.out.println("============f_num=================" + f_num);
		model.addAttribute("f_num", f_num);
		return "/funding/fundingRegSuccess";
	}
	
	@GetMapping("fundingRegFail")
	public String fundingRegFail() {
		return "/funding/fundingRegFail";
	}
	
	
//	@GetMapping("fundingOrderList")
//	public String fundingOrderList(Model model, 
//							Criteria cri, 
//							HttpSession session ) {
//		return "funding/fundingOrderList";
//	}
}
