package com.kh.teampro.board.travelcourse;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CourseVo {
	private int cno;
	private String title;
	private int totalcost;
	private String content;
	private String writer;
	private int daycount;
	private Timestamp regdate;
	private Timestamp updatedate;
}
