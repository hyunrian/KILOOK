package com.kh.teampro.board.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.teampro.Like.board.LikeUserBoardService;
import com.kh.teampro.paging.PagingDto;
import com.kh.teampro.reply.user.UserReplyService;
import com.kh.teampro.reply.user.UserReplyVo;

@Controller
@RequestMapping("/userboard")
public class UserBoardController {

	@Autowired
	private UserBoardService userBoardService;
	
	@Autowired
	private UserReplyService userReplyService;
	
	// 유저 게시글 목록 보기
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String getList(PagingDto pagingDto, Model model) {
		
		int totalCount = userBoardService.getTotalCount(pagingDto);
		pagingDto.setTotalCount(totalCount);
		pagingDto = new PagingDto(pagingDto.getNowPage(), totalCount, 
				pagingDto.getOption(), pagingDto.getKeyword(), pagingDto.getFilter());
		
		List<UserBoardVo> list = userBoardService.getUserArticleList(pagingDto);
		
		model.addAttribute("userArticleList", list);
		model.addAttribute("pagingDto", pagingDto);
		
		return "userboard/userboard";
	}
	
	// 게시글 작성 페이지 이동
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeArticle() {
		return "userboard/userboardWrite";
	}
	
	// 게시글 쓰기
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writeArticle(UserBoardVo userBoardVo, String thumbnail) {
		userBoardVo.setUserid("user2"); // session의 loginInfo로 변경
		userBoardVo.setWriter("star"); // session의 loginInfo로 변경
		userBoardService.createArticle(userBoardVo, thumbnail);
		
		return "redirect:/userboard/list";
	}
	
	// 유저 게시글 내용 보기
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String getDetail(int bno, PagingDto pagingDto, Model model) {
		
		userBoardService.addViewcnt(bno);
			
		UserBoardVo userBoardVo = userBoardService.getUserArticleDetail(bno);
		List<UserReplyVo> list = userReplyService.getUserReply(bno);

		model.addAttribute("userBoardVo", userBoardVo);
		model.addAttribute("replyList", list);
		model.addAttribute("pagingDto", pagingDto);
		
		return "userboard/userboardDetail";
	}
	
	// 게시글 삭제
	@ResponseBody
	@RequestMapping(value = "/delete/{bno}", method = RequestMethod.PATCH)
	public String deleteArticle(@PathVariable int bno) {
		
		// delete_yn = 'Y'로 처리(update)
		userBoardService.deleteArticle(bno);
		
		return "/userboard/list";
	}
	
	// 게시글 수정 페이지 이동
	@RequestMapping(value = "/update/{bno}", method = RequestMethod.GET)
	public String updateArticle(@PathVariable int bno, Model model) {
		
		UserBoardVo userBoardVo = userBoardService.getUserArticleDetail(bno);
		model.addAttribute("userBoardVo", userBoardVo);
		
		return "userboard/userboardWrite";
	}
	
	// 게시글 수정 처리
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateArticle(UserBoardVo userBoardVo, String thumbnail) {
		
		userBoardVo.setWriter("tester"); // 세션에 저장된 닉네임으로 재설정 필요
		userBoardService.updateArticle(userBoardVo, thumbnail);
		
		return "redirect:/userboard/detail?bno=" + userBoardVo.getBno();
	}
	
}
