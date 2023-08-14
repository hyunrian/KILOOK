package com.kh.teampro.reply.restaurant;

import java.sql.Timestamp;
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
		List<FoodReplyVo> list = sqlSession.selectList(NAMESPACE + "restReplyList", bno);
		return list;
	}
	
	// 댓글 추가
	public void foodReplyInsert(FoodReplyVo foodReplyVo) {
		sqlSession.insert(NAMESPACE + "insertRestReply", foodReplyVo);
	}
	
	// 댓글 수정
	public void foodReplyUpdate(FoodReplyVo foodReplyVo) {
		sqlSession.update(NAMESPACE + "updateRestReply", foodReplyVo);
	}  
	
	// 댓글 삭제
	public void foodReplyDelete(int rno) {
		sqlSession.delete(NAMESPACE + "deleteRestReply", rno);
	}
	
	// 수정날짜 얻기
	public Timestamp getUpdatedate(int rno) {
		Timestamp updatedate = sqlSession.selectOne(NAMESPACE + "getUpdatedate", rno);
		return updatedate;
	}
}
