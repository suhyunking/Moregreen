package site.moregreen.basic.myPage;
  
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import site.moregreen.basic.command.FundingDto;
import site.moregreen.basic.command.PurchaseDto;
import site.moregreen.basic.util.Criteria;
  
  @Mapper 
  public interface MyPageMapper {
  
  public List<FundingDto> selectFuningLikeList(Criteria cri);
  
  public int selectTotal(Criteria cri);							//찜하기 총 개수
  public int selectPurchaseTotal(Criteria cri);					//구매한 펀딩 개수
  public int selectMyProjectTotal(Criteria cri);				//개설한 프로젝트 개수
  
  //구매 목록 출력 
  public List<PurchaseDto> selectMyPurchaseList(Criteria cri);
  
  //구매 상세페이지 출력 
  public PurchaseDto selectMyPurchaseDetail(PurchaseDto dto); 
  
  public List<FundingDto> selectMyProjectList(Criteria cri);
  
  
  
  }
 
