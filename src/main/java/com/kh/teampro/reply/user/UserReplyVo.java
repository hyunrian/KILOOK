package com.kh.teampro.reply.user;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class UserReplyVo {

	private int rno;
	private int bno;
	private String replytext;
	private String replyer;
	private Timestamp regdate;
	private Timestamp updatedate;
	private int rgroup;
	private int rseq;
	private int rlevel;
	private String delete_yn;
	private String parentreplyer;
	private String userid;
	
	private int count = 1;
	private int startRow;
	private int endRow;
	
}