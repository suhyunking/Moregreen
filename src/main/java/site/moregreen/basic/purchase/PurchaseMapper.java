package site.moregreen.basic.purchase;

import org.apache.ibatis.annotations.Mapper;

import site.moregreen.basic.command.DeliveryDto;
import site.moregreen.basic.command.FundingDto;
import site.moregreen.basic.command.PurchaseDto;

@Mapper
public interface PurchaseMapper {
	
	// 배송지 정보 등록
	public int createDelivery(DeliveryDto deliveryDto);
	
	// 구매 정보 등록
	public int createPurchase(PurchaseDto purchaseDto);
	
	//해당 펀딩에 대한 값 update
	public void updateFunding(FundingDto fundingDto);
	
}
