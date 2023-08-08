package com.kh.teampro.user.info;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserInfoService {

	@Autowired
	private UserInfoDao userInfoDao;
	
	// 유저 한명 정보 읽기
	public UserVo readOneUserInfo(String userid) {
		UserVo userVo = userInfoDao.readOneUserInfo(userid);
		return userVo;
	}
	
	// 유저 정보 수정
	public void updateUserInfo(UserVo userVo) {
		userInfoDao.updateUserInfo(userVo);
	}
}
