package com.kh.teampro.board.tourguide;

import lombok.Data;

@Data
public class InfoVo {
	private int bno;
	private String iname;
	private String openhours;
	private String inumber;
	private int lat;
	private int ilong;
	private String address;
	private String language;
	private String introduce;
	private int viewcnt;
	private int replycnt;
}
