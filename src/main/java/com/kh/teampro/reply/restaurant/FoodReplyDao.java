package com.kh.teampro.reply.restaurant;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FoodReplyDao {
	
	private final String NAMESPACE = "com.kh.teampro.FoodReplyMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	// 댓글 목록
	public List<FoodReplyVo> getFoodReplyList(int bno){
		if(getReplyCount(bno) != 0) {
			List<FoodReplyVo> list = sqlSession.selectList(NAMESPACE + "restReplyList", bno);
			sqlSession.update(NAMESPACE + "updateFoodReplyCnt");
			return list;
		} else {
			return null;
		}
	}
	
	// 새댓글 추가
	public void insertRestNewReply(FoodReplyVo foodReplyVo) {
		sqlSession.insert(NAMESPACE + "insertRestNewReply", foodReplyVo);
		sqlSession.update(NAMESPACE + "updateFoodReplyCnt");
	}
	
	// 대댓글 추가
	public void insertRestReReply(FoodReplyVo foodReplyVo) {
		sqlSession.insert(NAMESPACE + "insertRestReReply", foodReplyVo);
		sqlSession.update(NAMESPACE + "updateFoodReplyCnt");
	}
	
	// 가장 높은 rseq 구하기(댓글 순서)
	public int getMaxResq(int bno, int rgroup) {
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
	public void foodReplyDelete(int rno) {
		sqlSession.update(NAMESPACE + "deleteRestReply", rno);
		sqlSession.update(NAMESPACE + "updateFoodReplyCnt");
	}
	
	// 댓글 수정
	public void updateRestReply(FoodReplyVo foodReplyVo) {
		sqlSession.update(NAMESPACE + "updateRestReply", foodReplyVo);
	}  
	
	// 대댓글이 있는 댓글인지 확인
	public boolean hasChildRestReply(int rno) {
		int hasChildRestReply = sqlSession.selectOne(NAMESPACE + "hasChildRestReply", rno);
		
		if (hasChildRestReply > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	// 수정날짜 얻기
	public Timestamp getUpdatedate(int rno) {
		Timestamp updatedate = sqlSession.selectOne(NAMESPACE + "getUpdatedate", rno);
		return updatedate;
	}
}
