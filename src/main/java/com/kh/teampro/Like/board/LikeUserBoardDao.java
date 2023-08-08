package com.kh.teampro.Like.board;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikeUserBoardDao {

	private static final String NAMESPACE = "com.kh.teampro.LikeUserBoardMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	public void addLike(LikeUserBoardVo likeUserBoardVo) {
		sqlSession.insert(NAMESPACE + "addLike", likeUserBoardVo);
	}
	
	public void cancelLike(LikeUserBoardVo likeUserBoardVo) {
		sqlSession.delete(NAMESPACE + "cancelLike", likeUserBoardVo);
	}
	
	public boolean userLiked(LikeUserBoardVo likeUserBoardVo) {
		int userLiked = 
				sqlSession.selectOne(NAMESPACE + "userLiked", likeUserBoardVo);
		if (userLiked == 1) return true;
		else return false;
	}
	
	public int countLikes(int bno) {
		return sqlSession.selectOne(NAMESPACE + "countLikes", bno);
	}
}
