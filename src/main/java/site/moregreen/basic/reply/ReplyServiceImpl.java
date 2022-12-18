package site.moregreen.basic.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import site.moregreen.basic.command.LikeDto;
import site.moregreen.basic.command.ReplyDto;
import site.moregreen.basic.funding.FundingMapper;

@Service("replyService")
@Transactional(readOnly = true)
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	ReplyMapper replyMapper;
	
	@Override
	public List<ReplyDto> retrieveReplyList(int f_num) {
		return replyMapper.selectReplyList(f_num);
	}

	@Override
	@Transactional(rollbackFor = RuntimeException.class)
	public int addReply(ReplyDto dto) {
		return replyMapper.insertReply(dto);
	}

	@Override
	@Transactional(rollbackFor = RuntimeException.class)
	public void removeReply(ReplyDto dto) {
		replyMapper.deleteReply(dto);
	}

}
