package com.kh.teampro.reply.accommodation;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AccomReplyDao {
	
	private final String NAMESPACE = "com.kh.teampro.AccomReplyMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	// 댓글 목록
	public List<AccomReplyVo> getAccomReplyList(int bno){
		if(getReplyCount(bno) != 0) {
			List<AccomReplyVo> list = sqlSession.selectList(NAMESPACE + "accomReplyList", bno);
			sqlSession.update(NAMESPACE + "updateAccomReplyCnt");
			return list;
		} else {
			return null;
		}
	}
	
	// 새댓글 추가
	public void insertAccomNewReply(AccomReplyVo accomReplyVo) {
		sqlSession.insert(NAMESPACE + "insertAccomNewReply", accomReplyVo);
		sqlSession.update(NAMESPACE + "updateAccomReplyCnt");
	}
	
	// 대댓글 추가
	public void insertAccomReReply(AccomReplyVo accomReplyVo) {
		sqlSession.insert(NAMESPACE + "insertAccomReReply", accomReplyVo);
//		sqlSession.update(NAMESPACE + "updateAccomReplyCnt");
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
	public void deleteAccomReply(int rno) {
		sqlSession.update(NAMESPACE + "deleteAccomReply", rno);
		sqlSession.update(NAMESPACE + "updateAccomReplyCnt");
	}
	
	// 댓글 수정
	public void updateAccomReply(AccomReplyVo foodReplyVo) {
		sqlSession.update(NAMESPACE + "updateAccomReply", foodReplyVo);
	}  
	
	// 대댓글이 있는 댓글인지 확인
	public boolean hasChildAccomReply(int rno) {
		int hasChildAccomReply = sqlSession.selectOne(NAMESPACE + "hasChildAccomReply", rno);
		
		if (hasChildAccomReply > 0) {
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
