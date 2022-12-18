package site.moregreen.basic.reply;

import java.util.List;

import site.moregreen.basic.command.ReplyDto;

public interface ReplyService {
	
	public List<ReplyDto> retrieveReplyList(int f_num);		//댓글 목록 조회
		
	public int addReply(ReplyDto dto);
	public void removeReply(ReplyDto dto);
}
