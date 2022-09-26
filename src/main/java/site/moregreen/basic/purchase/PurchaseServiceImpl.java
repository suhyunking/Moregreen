package site.moregreen.basic.purchase;

import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.java.Log;
import site.moregreen.basic.command.DeliveryDto;
import site.moregreen.basic.command.FundingDto;
import site.moregreen.basic.command.MemberDto;
import site.moregreen.basic.command.PurchaseDto;
import site.moregreen.basic.kakaoPay.KakaoPayApprovalVO;
 
@Log
@Service("purchaseService") 
@Transactional(readOnly = true)
public class PurchaseServiceImpl implements PurchaseService{

	@Autowired
	PurchaseMapper purchaseMapper;
	
	@Override
	@Transactional(rollbackFor = RuntimeException.class)
	public int addPurchase(Map<String, Object> hashMap) {

		// 주문 정보 등록
		DeliveryDto deliveryDto = (DeliveryDto)hashMap.get("deliveryDto");
		purchaseMapper.createDelivery(deliveryDto);
		int d_num = deliveryDto.getD_num();
		
		// 구매 정보 등록
		PurchaseDto purchaseDto = (PurchaseDto)hashMap.get("purchaseDto");
		FundingDto fundingDto = (FundingDto)hashMap.get("fundingDto");
		MemberDto mDto = (MemberDto)hashMap.get("memberDto");
		KakaoPayApprovalVO kVo = (KakaoPayApprovalVO)hashMap.get("kakaoPayApprovalVO");
		
		int f_num = fundingDto.getF_num();
		int m_num = mDto.getM_num();
		String p_tid = kVo.getTid();
		Date p_date = kVo.getApproved_at();
		
		purchaseDto.setP_tid(p_tid);
		purchaseDto.setP_date(p_date);
		purchaseDto.setD_num(d_num);
		purchaseDto.setF_num(f_num);
		purchaseDto.setM_num(m_num);
		
		purchaseMapper.createPurchase(purchaseDto);
		
		//해당되는 펀딩 값 update
		int fTotalMoney = fundingDto.getF_totalmoney() + purchaseDto.getP_total();
		fundingDto.setF_totalmoney(fTotalMoney);
		
		double fRate = (double)fTotalMoney / 500000.0 * 100.0;
		int fundingRate = (int)Math.floor(fRate);
		fundingDto.setF_rate(fundingRate);
		
		purchaseMapper.updateFunding(fundingDto);
		
		
		return 1;
	}
	
}
