package com.kh.teampro.board.user;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.teampro.paging.PagingDto;

@Repository
public class UserBoardDao {
	
	private static final String NAMESPACE = "com.kh.teampro.UserBoardMapper."; 
	
	@Autowired
	private SqlSession sqlSession;
	
//	public List<UserBoardVo> getUserArticleList() {
//		return sqlSession.selectList(NAMESPACE + "getUserArticleList");
//	}
	public List<UserBoardVo> getUserArticleList(PagingDto pagingDto) {
		return sqlSession.selectList(NAMESPACE + "getUserArticleList", pagingDto);
	}
	
	public UserBoardVo getUserArticleDetail(int bno) {
		return sqlSession.selectOne(NAMESPACE + "getUserArticleDetail", bno);
	}
	
	public void addViewcnt(int bno) {
		sqlSession.update(NAMESPACE + "addViewcnt", bno);
	}
	
	public void createArticle(UserBoardVo userBoardVo) {
		sqlSession.insert(NAMESPACE + "createArticle", userBoardVo);
	}
	
	public int getNextSeq() {
		return sqlSession.selectOne(NAMESPACE + "getNextSeq");
	}
	
	public void deleteArticle(int bno) {
		sqlSession.update(NAMESPACE + "deleteArticle", bno);
	}
	
	public void updateArticle(UserBoardVo userBoardVo) {
		sqlSession.update(NAMESPACE + "updateArticle", userBoardVo);
	}
	
	public int getTotalCount(PagingDto pagingDto) {
		return sqlSession.selectOne(NAMESPACE + "getTotalCount", pagingDto);
	}

	public void updateLikecnt(UserBoardVo userBoardVo) {
		sqlSession.update(NAMESPACE + "updateLikecnt", userBoardVo);
	}
	
	public void updateReplycnt(UserBoardVo userBoardVo) {
		sqlSession.update(NAMESPACE + "updateReplycnt", userBoardVo);
	}
}
