package com.kh.teampro.board.user;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserBoardDao {
	
	private static final String NAMESPACE = "com.kh.teampro.UserBoardMapper."; 
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<UserBoardVo> getUserArticleList() {
		return sqlSession.selectList(NAMESPACE + "getUserArticleList");
	}
	
	public UserBoardVo getUserArticleDetail(int bno) {
		return sqlSession.selectOne(NAMESPACE + "getUserArticleDetail", bno);
	}
	
	public void addViewcnt(int bno) {
		sqlSession.update(NAMESPACE + "addViewcnt", bno);
	}
	
	public void deleteFileData(String filename) {
		sqlSession.delete(NAMESPACE + "deleteFile", filename);
	}

}
