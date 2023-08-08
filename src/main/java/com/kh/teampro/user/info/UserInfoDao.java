package com.kh.teampro.user.info;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserInfoDao {
	
	private final String NAMESPACE = "com.kh.teampro.UserInfoMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	// 유저 한명 정보 읽기
	public UserVo readOneUserInfo(String userid) {
		UserVo userVo = sqlSession.selectOne(NAMESPACE + "readOneUserInfo", userid);
		return userVo;
	}
	
	// 유저 정보 수정 
	public void updateUserInfo(UserVo userVo) {
		sqlSession.update(NAMESPACE + "updateUserInfo", userVo);
	}
	
}
