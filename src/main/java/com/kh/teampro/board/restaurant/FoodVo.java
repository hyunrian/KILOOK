package com.kh.teampro.board.restaurant;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class FoodVo {
	private int bno; 
	private String rname; // PLACE(17)
	private String content; // ITEMCNTNTS(91)
	private String location; // GUGUN_NM (4)
	private String address; // ADDR1(16)
	private String rnumber; // CNTCT_TEL(12)
	private String url; // HOMEPAGE_URL(75)
	private String openhours; // USAGE_DAY_WEEK_AND_TIME(96)
	private String menu; // RPRSNTV_MENU(19)
	private int lat; // LAT(9)
	private int rlong; // LNG(9)
	private String image; // MAIN_IMG_NORMAL(74)
	private String thumbimage; // MAIN_IMG_THUMB(75)
	private int viewcnt; 
	private int replycnt; 
}
