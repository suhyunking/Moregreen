package site.moregreen.basic.purchase;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import site.moregreen.basic.command.DeliveryDto;
import site.moregreen.basic.command.FundingDto;
import site.moregreen.basic.command.PurchaseDto;
import site.moregreen.basic.util.Criteria;

@Mapper
public interface PurchaseMapper {
	
	// 배송지 정보 등록
	public int createDelivery(DeliveryDto deliveryDto);
	
	// 구매 정보 등록
	public int createPurchase(PurchaseDto purchaseDto);
	
	//해당 펀딩에 대한 값 update
	public void updateFunding(FundingDto fundingDto);
	
	public void updatePurchase(int p_num);
	
	public List<PurchaseDto> selectPurchaseList(Criteria cri);
	public List<PurchaseDto> selectPurchaseListForCancel(HashMap<String, Object> map);
	
	public int selectPurchaseTotal(Criteria cri); 
	
	public void updatePurchasePayment(PurchaseDto purchaseDto);
	
}
