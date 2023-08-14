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
	
	// 새댓글 추가
	public void insertRestNewReply(FoodReplyVo foodReplyVo) {
		foodReplyDao.insertRestNewReply(foodReplyVo);
	}
	
	// 대댓글 추가
	public void insertRestReReply(FoodReplyVo foodReplyVo) {
		foodReplyDao.insertRestReReply(foodReplyVo);
	}
	
	// 가장 높은 rseq 구하기(댓글 순서)
	public int getMaxRseq(int bno, int rgroup) {
		int getMaxRseq = foodReplyDao.getMaxResq(bno, rgroup);
		return getMaxRseq;
	}
	
	// 게시글의 댓글개수 조회
	public int getReplyCount(int bno) {
		int getReplyCount = foodReplyDao.getReplyCount(bno);
		return getReplyCount;
	}
	
	// 댓글 그룹확인
	public int getRgroup(int rno) {
		int getRgroup = foodReplyDao.getRgroup(rno);
		return getRgroup;
	}
	
	// 댓글 삭제
	public void foodReplyDelete(int rno) {
		foodReplyDao.foodReplyDelete(rno);
	}
	
	// 댓글 수정
	public void updateRestReply(FoodReplyVo foodReplyVo) {
		foodReplyDao.updateRestReply(foodReplyVo);
	}
	
	// 대댓글이 있는 댓글인지 확인
	public boolean hasChildRestReply(int rno) {
		boolean hasChildRestReply = foodReplyDao.hasChildRestReply(rno);
		return hasChildRestReply;
	}

	// 수정날짜 얻기
	public Timestamp getUpdatedate(int rno) {
		Timestamp updatedate = foodReplyDao.getUpdatedate(rno);
		return updatedate;
	}
}
