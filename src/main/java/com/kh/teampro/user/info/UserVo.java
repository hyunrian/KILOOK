package com.kh.teampro.user.info;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserVo {
	private String userid;
	private String upw;
	private String unickname;
	private int upoint;
	private String uimg;
	private String uemail;
	private String signupfrom;
	private Timestamp joindate;
	private String verified;
}
