package com.kh.teampro.user.info;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserBoardDto {
	private int bno;
	private String title;
	private String content;
	private String writer;
	private Timestamp regdate;
	private int viewcnt;
	private int replycnt;
	private String contenthtml;
	private int likecnt;
}
