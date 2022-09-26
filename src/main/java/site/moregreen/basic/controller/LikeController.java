package site.moregreen.basic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.java.Log;
import site.moregreen.basic.command.LikeDto;
import site.moregreen.basic.like.LikeService;

@Log
@Controller
@RequestMapping("/like")
public class LikeController {

	
	@Autowired
	@Qualifier("likeService")
	LikeService likeService;
	
	/*
	 * @GetMapping("/profile/{url}/liked") public String interestList (HttpSession
	 * session, Model model, String idx,@PathVariable String url) {
	 * 
	 * String id = likeService.getIdUrl(url); HashMap<String, String> map = new
	 * HashMap<String, String>(); map.put("id", id); map.put("url", url); MemberDTO
	 * dto = memberService.getAllProfile(map);
	 * 
	 * String name = memberService.getName(id);
	 * 
	 * List<LikedDTO> likeList = profileService.getLikedProject(id); ProjectDTO pdto
	 * = projectService.getData(idx);
	 * 
	 * model.addAttribute("likeList", likeList); model.addAttribute("likecount",
	 * likeList.size()); model.addAttribute("dto", dto); model.addAttribute("name",
	 * name);
	 * 
	 * return "/profile/projectInterest"; }
	 */
	
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
	
//	  @ResponseBody
//	  
//	  public void addFundingLike(@RequestBody LikeDto dto, 
//			  						@RequestParam("f_num") int f_num,
//			  						@RequestParam("m_num") int m_num,
//			  						Model model) {
//		  
//	   System.out.println("========컨트롤러 연결 성공===========");
//	  
//	   //찜하기가 되어있는지 확인하기 위해 m_num과 f_num을 보냄
//	  likeService.addFundingLike(dto, m_num, f_num);
//	  //찾은 정보를 likeDto로 담아서 보냄
//	  model.addAttribute("dto", dto);
//	 
//	  }
	 
	  
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping("/removeFundingLike") public void removeFundingLike(int
	 * l_num) { System.out.println("좋아요 싫어요!");
	 * likeService.removeFundingLike(l_num); }
	 * 
	 * 
	 * 
	 * @PostMapping("retrieveFundingLike") public int retrieveFundingLike(int f_num)
	 * { int check = likeService.removeFundingLike(f_num);
	 * 
	 * if(check == 0) { likeService.retrieveFundingLike(f_num); } else {
	 * likeService.retrieveFundingLike(f_num); }
	 * 
	 * return check; }
	 */
	  
	  
/*
		 * if(likeService.hateCheck(rno, memberId) == 1) { int likeCheck = 2; return
		 * likeCheck; } else { int likeCheck = likeService.likeCheck(rno, memberId);
		 * if(likeCheck == 0) { //좋아요 처음누름 likeService.insertLike(bno, rno , memberId
		 * );//like테이블 삽입 likeService.updateLike(rno); //게시판테이블 +1
		 * likeService.memberPointPlus(writerId); //회원포인트 +1
		 * 
		 * }else if(likeCheck == 1) { likeService.updateLikeCancel(rno); //게시판테이블 =1
		 * likeService.deleteLike(rno, memberId); //like테이블 삭제
		 * 
		 * 
		 * } return likeCheck; } }
		 * 
		 */
	  
	/*
	 * @RequestMapping(value = "/commentLike") public int updateLike(int bno,int
	 * rno, String memberId,String writerId,Model model)throws Exception{
	 * 
	 * if(likeService.hateCheck(rno, memberId) == 1) { int likeCheck = 2; return
	 * likeCheck; } else { int likeCheck = likeService.likeCheck(rno, memberId);
	 * if(likeCheck == 0) { //좋아요 처음누름 likeService.insertLike(bno, rno , memberId
	 * );//like테이블 삽입 likeService.updateLike(rno); //게시판테이블 +1
	 * likeService.memberPointPlus(writerId); //회원포인트 +1
	 * 
	 * }else if(likeCheck == 1) { likeService.updateLikeCancel(rno); //게시판테이블 =1
	 * likeService.deleteLike(rno, memberId); //like테이블 삭제
	 * 
	 * 
	 * } return likeCheck; } }
	 */
	/*
	 * @ResponseBody
	 * 
	 * @PostMapping("/liked/check") public int likedCheck(int idx, String id) { int
	 * check = fundingService.getLikeCheck(idx, id);
	 * 
	 * if(check == 0) { fundingService.addFundingLike(idx, id); }else {
	 * fundingService.removeFundingLike(idx, id); } return check; }
	 */
}
