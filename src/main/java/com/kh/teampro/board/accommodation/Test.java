package com.kh.teampro.board.accommodation;

public class Test {

	public static void main(String[] args) {
		// 이미지 랜덤 배열
		String[] accomImg = new String[26];
		
		for(int i = 0; i < 26; i++) {
			int random = (int)(Math.random() * accomImg.length) + 1;
			accomImg[i] = "/resources/images/accommodation/hotel_" + random;
			System.out.println("accomImg:" + accomImg[i]);
		}
		
		
	}

}
