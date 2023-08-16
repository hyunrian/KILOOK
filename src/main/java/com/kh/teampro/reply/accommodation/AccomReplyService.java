package com.kh.teampro.reply.accommodation;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.teampro.board.accommodation.AccomDao;
import com.kh.teampro.board.restaurant.FoodDao;

@Service
public class AccomReplyService {

	@Autowired
	private AccomReplyDao accomReplyDao;
	
	@Autowired
	private AccomDao accomDao;

	// 댓글 목록
	public List<AccomReplyVo> getAccomReplyList(int bno) {
		List<AccomReplyVo> list = accomReplyDao.getAccomReplyList(bno);
		return list;
	}
	
	// 새댓글 추가
	public void insertAccomNewReply(AccomReplyVo accomReplyVo) {
		accomReplyDao.insertAccomNewReply(accomReplyVo);
	}
	
	// 대댓글 추가
	public void insertAccomReReply(AccomReplyVo accomReplyVo) {
		accomReplyDao.insertAccomReReply(accomReplyVo);
	}
	
	// 가장 높은 rseq 구하기(댓글 순서)
	public int getMaxRseq(int bno, int rgroup) {
		int getMaxRseq = accomReplyDao.getMaxRseq(bno, rgroup);
		return getMaxRseq;
	}
	
	// 게시글의 댓글개수 조회
	public int getReplyCount(int bno) {
		int getReplyCount = accomReplyDao.getReplyCount(bno);
		return getReplyCount;
	}
	
	// 댓글 그룹확인
	public int getRgroup(int rno) {
		int getRgroup = accomReplyDao.getRgroup(rno);
		return getRgroup;
	}
	
	// 댓글 삭제
	public void deleteAccomReply(int rno) {
		accomReplyDao.deleteAccomReply(rno);
	}
	
	// 댓글 수정
	public void updateAccomReply(AccomReplyVo accomReplyVo) {
		accomReplyDao.updateAccomReply(accomReplyVo);
	}
	
	// 대댓글이 있는 댓글인지 확인
	public boolean hasChildAccomReply(int rno) {
		boolean hasChildRestReply = accomReplyDao.hasChildAccomReply(rno);
		return hasChildRestReply;
	}

	// 수정날짜 얻기
	public Timestamp getUpdatedate(int rno) {
		Timestamp updatedate = accomReplyDao.getUpdatedate(rno);
		return updatedate;
	}
}
