package com.kh.teampro.board.parking;

import lombok.Data;

@Data
public class ParkingVo {
	private int bno;
	private String pname;
	private int lat;
	private int plong;
	private String jibunaddress;
	private String doroaddress;
	private String weekdayopen;
	private String weekdayclose;
	private String saturdayopen;
	private String saturdayclose;
	private String holidayopen;
	private String holidayclose;
	private String price;
	private int viewcnt;
	private int replycnt;
}
