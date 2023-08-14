package com.kh.teampro.user.info;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserReplyDto {
	private int rno;
	private int bno;
	private String replytext;
	private String replyer;
	private Timestamp regdate;
	private Timestamp updatedate;
	private String delete_yn;
	private String title;
}
