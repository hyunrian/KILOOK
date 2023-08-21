package com.kh.teampro.board.restaurant;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class FoodVo {
	private int bno; 
	private String rname; // PLACE
	private String content; // ITEMCNTNTS
	private String location; // GUGUN_NM
	private String address; // ADDR1
	private String rnumber; // CNTCT_TEL
	private String url; // HOMEPAGE_URL
	private String openhours; // USAGE_DAY_WEEK_AND_TIME
	private String menu; // RPRSNTV_MENU
	private int lat; // LAT
	private int rlong; // LNG
	private String image; // MAIN_IMG_NORMAL
	private String thumbimage; // MAIN_IMG_THUMB
	private int viewcnt; 
	private int replycnt; 
	private int likecnt;
}
