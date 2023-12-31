package com.kh.teampro.user.login;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teampro.commons.MyConstants;
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
	public boolean createAccount(UserVo userVo) {
		boolean resultDubID = userDao.dubCheckID(userVo.getUserid());
		boolean resultDubNickName = userDao.dubCheckNickName(userVo.getUnickname());
		boolean idCheck = userDao.validCheckTotal(4, 15, MyConstants.ID, userVo.getUserid());
		boolean nickNameCheck = userDao.validCheckTotal(2, 10, MyConstants.NINCKNAME, userVo.getUnickname());
		boolean pwCheck = userDao.validCheckTotal(4, 15, MyConstants.PW, userVo.getUpw());
		if (resultDubID == true && resultDubNickName == true
				&& idCheck==true && nickNameCheck==true && pwCheck==true) {
			userDao.createAccount(userVo);
			return true;
		}
		return false;
	}

	// 회원탈퇴
	public void deleteAccount(String userid) {
		userDao.deleteAccount(userid);
	}
	
	// 아이디와 이메일이 일치하는 계정 확인 (result가 true면 일치하는 아이디가 있음)
	public boolean findAccount(String userid, String uemail) {
		boolean result = userDao.findAccount(userid, uemail); 
		return result;
	}
	
	// 임시 비밀번호 생성
	public void makeTempPW(String userid, String upw) {
		userDao.makeTempPW(userid, upw);
	}
}
