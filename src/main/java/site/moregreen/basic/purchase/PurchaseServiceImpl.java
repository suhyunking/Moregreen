package site.moregreen.basic.purchase;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
import site.moregreen.basic.util.Criteria;
 
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
		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(p_date);
		cal1.add(Calendar.HOUR, -9);
		
		
		purchaseDto.setP_tid(p_tid);
		purchaseDto.setP_date(cal1.getTime());
		purchaseDto.setD_num(d_num);
		purchaseDto.setF_num(f_num);
		purchaseDto.setM_num(m_num);
		
		purchaseMapper.createPurchase(purchaseDto);
		
		//해당되는 펀딩 값 update
		int fTotalMoney = fundingDto.getF_totalmoney() + purchaseDto.getP_total();
		int fTargetMoney = fundingDto.getF_target();
		fundingDto.setF_totalmoney(fTotalMoney);
		
		double fRate = (double)fTotalMoney / fTargetMoney * 100.0;
		int fundingRate = (int)Math.floor(fRate);
		fundingDto.setF_rate(fundingRate);
		
		purchaseMapper.updateFunding(fundingDto);
		
		
		return 1;
	}

	@Override
	@Transactional(rollbackFor = RuntimeException.class)
	public void modifyPurchase(int p_num) {
		purchaseMapper.updatePurchase(p_num);
	}

	@Override
	public List<PurchaseDto> retrievePurchaseList(Criteria cri) {
		return purchaseMapper.selectPurchaseList(cri);
	}

	@Override
	public int retrievePurchaseTotal(Criteria cri) {
		return purchaseMapper.selectPurchaseTotal(cri);
	}

	@Override
	@Transactional(rollbackFor = RuntimeException.class)
	public int modifyPurchasePayment(PurchaseDto purchaseDto) {
		purchaseMapper.updatePurchasePayment(purchaseDto);
		return 1;
	}

	@Override
	public List<PurchaseDto> retrievePurchaseListForCancel(List<FundingDto> fundingList) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fundingList", fundingList);
		
		return purchaseMapper.selectPurchaseListForCancel(map);
	}
	
}
