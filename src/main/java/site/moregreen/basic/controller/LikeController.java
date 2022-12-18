package site.moregreen.basic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import site.moregreen.basic.command.LikeDto;
import site.moregreen.basic.like.LikeService;

@Slf4j
@Controller
@RequestMapping("/like")
public class LikeController {

	
	@Autowired
	@Qualifier("likeService")
	LikeService likeService;
	
	@RequestMapping(value="fundingLike",method=RequestMethod.POST)
	public @ResponseBody int heart(@ModelAttribute LikeDto likeDto) {
		int result = likeService.doFundingLike(likeDto); 
		
		return result;
	}
	
	@RequestMapping(value="deleteFundingLike",method=RequestMethod.POST)
	public @ResponseBody int deleteHeart(@ModelAttribute LikeDto likeDto) {
		int result = likeService.removeFundingLike(likeDto); 
		
		return result;
	}

	@RequestMapping(value="checkFundingLike",method=RequestMethod.POST)
	public @ResponseBody int checkHeart(@ModelAttribute LikeDto likeDto) {
		int result = likeService.checkFundingLike(likeDto); 
		
		return result;
	}


	 
}
