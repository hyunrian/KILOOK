package com.kh.teampro.board.show;

import lombok.Data;

@Data
public class ShowVo {
	private int bno;
	private String showname;
	private String begindate;
	private String enddate;
	private String placename;
	private String openhours;
	private String price;
	private String url;
	private int viewcnt;
	private int replycnt;
}
