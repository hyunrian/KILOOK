package com.kh.teampro.reply.restaurant;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.teampro.board.restaurant.FoodDao;

@Service
public class FoodReplyService {

	@Autowired
	private FoodReplyDao foodReplyDao;
	
	@Autowired
	private FoodDao foodDao;

	// 댓글 목록
	public List<FoodReplyVo> getFoodReplyList(int bno) {
		List<FoodReplyVo> list = foodReplyDao.getFoodReplyList(bno);
		return list;
	}
	
	// 댓글 추가
//	@Transactional
	public void foodReplyInsert(FoodReplyVo foodReplyVo) {
		foodReplyDao.foodReplyInsert(foodReplyVo);
	}
	
	// 댓글 수정
	public void foodReplyUpdate(FoodReplyVo foodReplyVo) {
		foodReplyDao.foodReplyUpdate(foodReplyVo);
	}
	
	// 댓글 삭제
//	@Transactional
	public void foodReplyDelete(int rno) {
		foodReplyDao.foodReplyDelete(rno);
	}
	
	// 댓글 수정 시간 얻기
	public Timestamp getUpdatedate(int rno) {
		Timestamp updatedate = foodReplyDao.getUpdatedate(rno);
		return updatedate;
	}
}
