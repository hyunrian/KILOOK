package com.kh.teampro.reply.attraction;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PlaceReplyDao {
	
	private final String NAMESPACE = "com.kh.teampro.PlaceReplyMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	// 댓글 목록
	public List<PlaceReplyVo> getAttrReplyList(int bno){
		if(getReplyCount(bno) != 0) {
			List<PlaceReplyVo> list = sqlSession.selectList(NAMESPACE + "placeReplyList", bno);
			sqlSession.update(NAMESPACE + "updatePlaceReplyCnt");
			return list;
		} else {
			return null;
		}
	}
	
	// 새댓글 추가
	public void insertPlaceNewReply(PlaceReplyVo placeReplyVo) {
		sqlSession.insert(NAMESPACE + "insertPlaceNewReply", placeReplyVo);
		sqlSession.update(NAMESPACE + "updatePlaceReplyCnt");
	}
	
	// 대댓글 추가
	public void insertPlaceReReply(PlaceReplyVo placeReplyVo) {
		sqlSession.insert(NAMESPACE + "insertPlaceReReply", placeReplyVo);
		sqlSession.update(NAMESPACE + "updatePlaceReplyCnt");
	}
	
	// 가장 높은 rseq 구하기(댓글 순서)
	public int getMaxRseq(int bno, int rgroup) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("bno", bno);
		map.put("rgroup", rgroup);
		int getMaxRseq = sqlSession.selectOne(NAMESPACE + "getMaxRseq", map);
		return getMaxRseq;
	}
	
	// 게시글의 댓글개수 조회
	public int getReplyCount(int bno) {
		int getReplyCount = sqlSession.selectOne(NAMESPACE + "getReplyCount", bno);
		return getReplyCount;
	}
	
	// 댓글 그룹확인
	public int getRgroup(int rno) {
		int getRgroup = sqlSession.selectOne(NAMESPACE + "getRgroup", rno);
		return getRgroup;
	}
	
	// 댓글 삭제
	public void deletePlaceReply(int rno) {
		sqlSession.update(NAMESPACE + "deletePlaceReply", rno);
		sqlSession.update(NAMESPACE + "updatePlaceReplyCnt");
	}
	
	// 댓글 수정
	public void updatePlaceReply(PlaceReplyVo placeReplyVo) {
		sqlSession.update(NAMESPACE + "updatePlaceReply", placeReplyVo);
	}  
	
	// 대댓글이 있는 댓글인지 확인
	public boolean hasChildPlaceReply(int rno) {
		int hasChildPlaceReply = sqlSession.selectOne(NAMESPACE + "hasChildPlaceReply", rno);
		
		if (hasChildPlaceReply > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	// 수정날짜 얻기
	public Timestamp getUpdatedate(int rno) {
		Timestamp getUpdatedate = sqlSession.selectOne(NAMESPACE + "getUpdatedate", rno);
		return getUpdatedate;
	}
}
