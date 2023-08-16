package com.kh.teampro.reply.attraction;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.teampro.board.accommodation.AccomDao;
import com.kh.teampro.board.attraction.PlaceDao;
import com.kh.teampro.board.restaurant.FoodDao;

@Service
public class PlaceReplyService {

	@Autowired
	private PlaceReplyDao placeReplyDao;
	
	@Autowired
	private PlaceDao placeDao;

	// 댓글 목록
	public List<PlaceReplyVo> getAttrReplyList(int bno) {
		List<PlaceReplyVo> list = placeReplyDao.getAttrReplyList(bno);
		return list;
	}
	
	// 새댓글 추가
	public void insertPlaceNewReply(PlaceReplyVo placeReplyVo) {
		placeReplyDao.insertPlaceNewReply(placeReplyVo);
	}
	
	// 대댓글 추가
	public void insertPlaceReReply(PlaceReplyVo placeReplyVo) {
		placeReplyDao.insertPlaceReReply(placeReplyVo);
	}
	
	// 가장 높은 rseq 구하기(댓글 순서)
	public int getMaxRseq(int bno, int rgroup) {
		int getMaxRseq = placeReplyDao.getMaxRseq(bno, rgroup);
		return getMaxRseq;
	}
	
	// 게시글의 댓글개수 조회
	public int getReplyCount(int bno) {
		int getReplyCount = placeReplyDao.getReplyCount(bno);
		return getReplyCount;
	}
	
	// 댓글 그룹확인
	public int getRgroup(int rno) {
		int getRgroup = placeReplyDao.getRgroup(rno);
		return getRgroup;
	}
	
	// 댓글 삭제
	public void deletePlaceReply(int rno) {
		placeReplyDao.deletePlaceReply(rno);
	}
	
	// 댓글 수정
	public void updatePlaceReply(PlaceReplyVo placeReplyVo) {
		placeReplyDao.updatePlaceReply(placeReplyVo);
	}
	
	// 대댓글이 있는 댓글인지 확인
	public boolean hasChildPlaceReply(int rno) {
		boolean hasChildPlaceReply = placeReplyDao.hasChildPlaceReply(rno);
		return hasChildPlaceReply;
	}

	// 수정날짜 얻기
	public Timestamp getUpdatedate(int rno) {
		Timestamp updatedate = placeReplyDao.getUpdatedate(rno);
		return updatedate;
	}
}
