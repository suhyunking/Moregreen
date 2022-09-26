package site.moregreen.basic.myPage;
  
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import site.moregreen.basic.command.FundingDto;
import site.moregreen.basic.command.PurchaseDto;
import site.moregreen.basic.util.Criteria;
  
  @Mapper 
  public interface MyPageMapper {
  
  public List<FundingDto> selectFuningLikeList(Criteria cri);
  
  public int selectTotal(Criteria cri);
  
  //구매 목록 출력 
  public List<PurchaseDto> selectMyPurchaseList(Criteria cri);
  
  //구매 상세페이지 출력 
	/* public List<PurchaseDto> selectPurchaseDetail(int f_num); */
  
  public List<FundingDto> selectMyProjectList(Criteria cri);
  
  
  
  }
 
