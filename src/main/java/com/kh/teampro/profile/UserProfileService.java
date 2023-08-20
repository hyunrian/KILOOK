package com.kh.teampro.profile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teampro.user.info.UserVo;

@Service
public class UserProfileService {

	@Autowired
	private UserProfileDao userProfileDao;
	
	public void updateProfile(UserVo userVo) {
		userProfileDao.updateProfile(userVo);
	}
}
