package com.kh.teampro.board.attraction;

import lombok.Data;

@Data
public class PlaceVo {
	private int bno;
	private String title;
	private String content;
	private String aname;
	private String location;
	private int lat;
	private int along;
	private String address;
	private String anumber;
	private String opendays;
	private String openhours;
	private String price;
	private String facility;
	private String image;
	private String thumbimage;
	private int viewcnt;
	private int replycnt;
}
