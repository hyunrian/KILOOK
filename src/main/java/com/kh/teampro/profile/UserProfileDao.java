package com.kh.teampro.profile;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.teampro.user.info.UserVo;

@Repository
public class UserProfileDao {

	private static final String NAMESPACE = "com.kh.teampro.ProfileMapper."; 

	@Autowired
	SqlSession sqlSession;
	
	public void updateProfile(UserVo userVo) {
		sqlSession.update(NAMESPACE + "updateProfile", userVo);
	}
	
}
