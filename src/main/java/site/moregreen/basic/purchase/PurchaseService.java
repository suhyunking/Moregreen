package site.moregreen.basic.purchase;

import java.util.List;
import java.util.Map;

import site.moregreen.basic.command.FundingDto;
import site.moregreen.basic.command.PurchaseDto;
import site.moregreen.basic.util.Criteria;

public interface PurchaseService {
	
	// 배송지, 구매 정보 등록
	public int addPurchase(Map<String, Object> hashMap);

	public void modifyPurchase(int p_num);
	
	public List<PurchaseDto> retrievePurchaseList(Criteria cri);
	
	public int retrievePurchaseTotal(Criteria cri); 
	
	public int modifyPurchasePayment(PurchaseDto purchaseDto);
	
	public List<PurchaseDto> retrievePurchaseListForCancel(List<FundingDto> fundingList);
}
