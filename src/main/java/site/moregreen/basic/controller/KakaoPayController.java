package site.moregreen.basic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.Setter;
import site.moregreen.basic.command.DeliveryDto;
import site.moregreen.basic.command.FundingDto;
import site.moregreen.basic.command.MemberDto;
import site.moregreen.basic.command.PurchaseDto;
import site.moregreen.basic.kakaoPay.KakaoPayService;
import site.moregreen.basic.purchase.PurchaseService;

@Controller
public class KakaoPayController {

	@Setter(onMethod_ = @Autowired)
    private KakaoPayService kakaopayService;
    
	@Autowired
	@Qualifier("purchaseService")
	PurchaseService purchaseService;
	
    
    @GetMapping("/kakaoPay")
    public void kakaoPayGet() {
        
    }
    
    @PostMapping("/kakaoPay")
    public String kakaoPay(FundingDto fundingDto,
    					   PurchaseDto purchaseDto,
    					   DeliveryDto deliveryDto,
    					   MemberDto memberDto,
    					   Model model) {
    	
    	System.out.println(deliveryDto.getD_phone());   
    	
    	
    	model.addAttribute("fundingDto", fundingDto);
    	model.addAttribute("purchaseDto", purchaseDto);
    	model.addAttribute("deliveryDto", deliveryDto);
    	model.addAttribute("memberDto", memberDto);
    	
        return "redirect:" + kakaopayService.kakaoPayReady(fundingDto, purchaseDto, deliveryDto, memberDto);
 
    }
    
    @PostMapping("/kakaoPayCancel")
    public String kakaoPayCancel(PurchaseDto purchaseDto, Model model) {

    	boolean result = kakaopayService.kakaoPayCancel(purchaseDto);
    	if(result) {
    		purchaseService.modifyPurchase(purchaseDto.getP_num());
    	}
        return "redirect:/funding/fundingRefund";
 
    }
}
