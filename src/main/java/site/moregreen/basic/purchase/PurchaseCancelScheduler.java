package site.moregreen.basic.purchase;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import site.moregreen.basic.command.FundingDto;
import site.moregreen.basic.command.PurchaseDto;
import site.moregreen.basic.funding.FundingService;
import site.moregreen.basic.kakaoPay.KakaoPayService;

@Slf4j
@Component
@SpringBootApplication
@EnableScheduling
public class PurchaseCancelScheduler {
	
	@Setter(onMethod_ = @Autowired)
    private KakaoPayService kakaopayService;
	
	@Autowired
	@Qualifier("purchaseService")
	PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("fundingService")
	FundingService fundingService;
	
//	@Scheduled(cron = "0 0 0 * * *") //매일 정각에 실행
	@Scheduled(cron = "5 * * * * *") //5초마다 실행
	public void run() {
		List<FundingDto> fundingList = fundingService.retrieveRetiredFundingListForCancel();
		List<PurchaseDto> purchaseList = purchaseService.retrievePurchaseListForCancel(fundingList); 
		boolean result;
		
		for(PurchaseDto purchaseDto : purchaseList) {
			result = kakaopayService.kakaoPayCancel(purchaseDto);
			log.info(purchaseDto.getF_title() + "환불 처리 완료" );
			
			if(result) {
				purchaseService.modifyPurchasePayment();
				
				LocalDateTime now = LocalDateTime.now();               
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");       
				String formatedNow = now.format(formatter);
				
				log.info("결제 취소 스케줄러" + formatedNow);
				
			}
		}
//		
//		
	}
}
