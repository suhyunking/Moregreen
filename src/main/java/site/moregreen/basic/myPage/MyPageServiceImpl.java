package site.moregreen.basic.myPage;
  
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import site.moregreen.basic.command.FundingDto;
import site.moregreen.basic.command.PurchaseDto;
import site.moregreen.basic.util.Criteria;
  
  @Service("myPageService")
  @Transactional(readOnly = true) //serviceImpl에서 모든 method에 적용됨 (select에서 사용)
  public class MyPageServiceImpl implements MyPageService {
  
  
  	@Override
	public List<FundingDto> retrieveFuningLikeList(Criteria cri) {
		return myPageMapper.selectFuningLikeList(cri);
	}

	@Override
	public int retrieveTotal(Criteria cri) {
		return myPageMapper.selectTotal(cri);
	}
  
  @Autowired 
  MyPageMapper myPageMapper;
  
  	@Override 
  	public List<PurchaseDto> retrieveMyPurchaseList(Criteria cri) {
	  
	  return myPageMapper.selectMyPurchaseList(cri); 
  	}
  
	@Override
	public List<FundingDto> retrieveMyProjectList(Criteria cri) {
		return myPageMapper.selectMyProjectList(cri);
	}
  	
  	
	/*
	 * @Override public List<PurchaseDto> retrievePurchaseDetail(int f_num) {
	 * 
	 * return null; }
	 */
  
  
  
  }
 

