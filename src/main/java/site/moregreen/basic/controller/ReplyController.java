package site.moregreen.basic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import site.moregreen.basic.command.ReplyDto;
import site.moregreen.basic.reply.ReplyService;

@Slf4j
@Controller
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	@Qualifier("replyService")
	ReplyService replyService;
	
	@RequestMapping(value="replyForm",method=RequestMethod.POST)
	@ResponseBody
	public int addReply(@ModelAttribute ReplyDto replyDto) {
		replyService.addReply(replyDto); 
		int r_num = replyDto.getR_num();
		return r_num;
	}
	
	@RequestMapping(value="removeReply",method=RequestMethod.POST)
	@ResponseBody
	public int removeReply(@ModelAttribute ReplyDto replyDto) {
		replyService.removeReply(replyDto); 
		
		return 1;
	}
	
}
