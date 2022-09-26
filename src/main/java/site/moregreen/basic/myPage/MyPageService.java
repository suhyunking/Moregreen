package site.moregreen.basic.myPage;

import java.util.List;
import site.moregreen.basic.command.PurchaseDto;
import site.moregreen.basic.util.Criteria;
import site.moregreen.basic.command.FundingDto;
  
  public interface MyPageService {
  
  //찜목록 리스트 조회
	public List<FundingDto> retrieveFuningLikeList(Criteria cri);
	
	//전체 게시글 수 조회
	public int retrieveTotal(Criteria cri);
  
	public List<PurchaseDto> retrieveMyPurchaseList(Criteria cri);
  
	/*
	 * public List<PurchaseDto> retrievePurchaseDetail(int f_num);
	 */
  
	//내 프로젝트 목록 조회
	public List<FundingDto> retrieveMyProjectList(Criteria cri);
  }
 



