package site.moregreen.basic.myPage;

import java.util.List;

import site.moregreen.basic.command.FundingDto;
import site.moregreen.basic.command.PurchaseDto;
import site.moregreen.basic.util.Criteria;
  
  public interface MyPageService {
  
  //찜목록 리스트 조회
	public List<FundingDto> retrieveFuningLikeList(Criteria cri);
	
	//찜하기 개수 조회
	public int retrieveTotal(Criteria cri);
	//개설한 프로젝트 개수 조회
	public int retrieveMyProjectTotal(Criteria cri);
	//구매한 펀딩 개수 조회
	public int retrievePurchaseTotal(Criteria cri);
  
	public List<PurchaseDto> retrieveMyPurchaseList(Criteria cri);
  
	
	public PurchaseDto retrieveMyPurchaseDetail(PurchaseDto dto);
	
  
	//내 프로젝트 목록 조회
	public List<FundingDto> retrieveMyProjectList(Criteria cri);
  }
 



