package com.kh.teampro.user.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teampro.user.info.UserVo;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	
	// 로그인
	public UserVo login(LoginDto loginDto) {
		UserVo userVo = userDao.login(loginDto);
		return userVo;
	}

	// 아이디 중복 확인 (return true == 중복 아님)
	public boolean dubCheckID(String userid) {
		boolean result = userDao.dubCheckID(userid);
		return result;
	}

	// 닉네임 중복 확인 (return true == 중복 아님)
	public boolean dubCheckNickName(String unickname) {
		boolean result = userDao.dubCheckNickName(unickname);
		return result;
	}

	// 회원가입 (return true == 회원가입 성공)
	public boolean createAccount(UserVo uservo) {
		boolean resultDubID = userDao.dubCheckID(uservo.getUserid());
		boolean resultDubNickName = userDao.dubCheckID(uservo.getUnickname());
		if (resultDubID == true && resultDubNickName == true) {
			userDao.createAccount(uservo);
			return true;
		}
		return false;
	}

	// 회원탈퇴
	public void deleteAccount(String userid) {
		userDao.deleteAccount(userid);
	}
}
