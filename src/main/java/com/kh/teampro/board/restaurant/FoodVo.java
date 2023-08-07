package com.kh.teampro.board.restaurant;

import lombok.Data;

@Data
public class FoodVo {
	private int bno;
	private String rname;
	private String content;
	private String location;
	private String address;
	private String rnumber;
	private String url;
	private String openhours;
	private String menu;
	private int lat;
	private int rlong;
	private String image;
	private String thumbimage;
	private int viewcnt;
	private int replycnt;
}
