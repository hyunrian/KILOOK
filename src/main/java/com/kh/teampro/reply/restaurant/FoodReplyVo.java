package com.kh.teampro.reply.restaurant;

import java.util.Date;

import lombok.Data;

@Data
public class FoodReplyVo {
	private int rno;
	private int bno;
	private String replytext;
	private String replyer;
	private Date regdate;
	private Date updatedate;
	private int rgroup;
	private int rseq;
	private int rlevel;
	private String delete_yn;
	private String userid;
}
