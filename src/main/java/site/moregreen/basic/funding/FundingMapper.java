package site.moregreen.basic.funding;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import site.moregreen.basic.command.DeliveryDto;
import site.moregreen.basic.command.FundingDto;
import site.moregreen.basic.command.LikeDto;
import site.moregreen.basic.command.UploadDto;
import site.moregreen.basic.util.Criteria;

@Mapper
public interface FundingMapper {

	public void updateFunding(FundingDto dto); 							//펀딩 수정
	

	public List<FundingDto> selectFundingList(Criteria cri); 			// 펀딩 목록 조회
	public List<FundingDto> selectAdminFundingList(Criteria cri); 		// 관리자 펀딩 목록 조회

	public List<FundingDto> selectFundingDetail(int f_num); 			// 상세조회

	public void createFunding(FundingDto dto); 							// 등록
	public int createFundingFile(UploadDto dto);

	public void fundingAccept(FundingDto dto);							// 펀딩 승인
	public void fundingReject(FundingDto dto);							// 펀딩 반려
	
	public DeliveryDto selectDelivery(int m_num);

	public List<FundingDto> selectFundingApplyList(Criteria cri); 		// 프로젝트 신청 목록 조회
	
	public int selectTotal(Criteria cri); 								//전체 게시글수
	public int selectApplyListTotal(Criteria cri); 						//전체 게시글수
	
	public List<FundingDto> selectFundingListForCheckStatus();			//펀딩 마감 처리를 위한 펀딩 목록 조회
	public List<FundingDto> selectFundingListForCancel(); 				//환불 처리를 위한 펀딩 목록 조회
	
	public void updateFundingStatusToFail(FundingDto dto);
	public void updateFundingStatusToSuccess(FundingDto dto);

	public int updateFundingLike(LikeDto dto); 							//펀딩 찜하기 개수 저장
	
}

