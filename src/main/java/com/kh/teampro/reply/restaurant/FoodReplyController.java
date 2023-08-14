package com.kh.teampro.reply.restaurant;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/reply")
public class FoodReplyController {

	@Autowired
	private FoodReplyService foodReplyService;
	
	// 댓글 목록
	@RequestMapping(value = "/restList/{bno}", method = RequestMethod.GET)
	public List<FoodReplyVo> getFoodReplylist(@PathVariable("bno") int bno){
		List<FoodReplyVo> list = foodReplyService.getFoodReplyList(bno);
		return list;
	}
	
	// 댓글 추가
	@RequestMapping(value = "/restInsert", method = RequestMethod.POST)
	public String foodReplyInsert(@RequestBody FoodReplyVo foodReplyVo,
		HttpSession session) throws Exception{
		foodReplyService.foodReplyInsert(foodReplyVo);
		return "success";
	}
	
	 // 댓글 수정
	@RequestMapping(value = "/restUpdate", method = RequestMethod.PATCH)
	public Timestamp foodReplyUpdate(@RequestBody FoodReplyVo foodReplyVo) {
		foodReplyService.foodReplyUpdate(foodReplyVo);
		Timestamp updatedate = foodReplyService.getUpdatedate(foodReplyVo.getRno());
		return updatedate;
	}
	
	// 댓글 삭제
	@RequestMapping(value = "/restDelete/{rno}/{bno}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("rno") int rno) {
		foodReplyService.foodReplyDelete(rno);
		return "success";
	}
}
