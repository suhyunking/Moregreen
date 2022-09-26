package site.moregreen.basic.like;

import org.apache.ibatis.annotations.Mapper;

import site.moregreen.basic.command.LikeDto;

@Mapper
public interface LikeMapper {


	public void createFundingLike(LikeDto dto); //찜하기
	
	public void deleteFundingLike(LikeDto dto); //찜하기 취소
	
	public int retrieveFundingLike(LikeDto dto); //찜하기 중복검사


}
