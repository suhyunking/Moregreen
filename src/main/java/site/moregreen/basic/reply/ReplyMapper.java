package site.moregreen.basic.reply;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import site.moregreen.basic.command.LikeDto;
import site.moregreen.basic.command.ReplyDto;
import site.moregreen.basic.util.Criteria;

@Mapper
public interface ReplyMapper {


	public List<ReplyDto> selectReplyList(int f_num);		//댓글 목록 조회
	
	public int insertReply(ReplyDto dto);
	public void deleteReply(ReplyDto dto);
}
