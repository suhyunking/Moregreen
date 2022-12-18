package site.moregreen.basic.like;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import site.moregreen.basic.command.LikeDto;
import site.moregreen.basic.funding.FundingMapper;



@Service("likeService")
@Transactional(readOnly = true)
public class LikeServiceImpl implements LikeService{

	@Autowired
	LikeMapper likeMapper;
	
	@Autowired
	FundingMapper fundingMapper;
	
	//찜하기
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int doFundingLike(LikeDto dto) {
		
		likeMapper.createFundingLike(dto);
		fundingMapper.updateFundingLike(dto);
		return 1;
	}

	//찜하기 취소
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int removeFundingLike(LikeDto dto) {
		
		likeMapper.deleteFundingLike(dto);
		fundingMapper.updateFundingLike(dto);
		return 1;
	}

	//찜하기 중복검사
	@Override
	public int checkFundingLike(LikeDto dto) {
		return likeMapper.retrieveFundingLike(dto);
	}



}
