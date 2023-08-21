package com.kh.teampro.paging;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class ReplyPagingDto {
	
	private int bno;
	private int nowPage = 1;
	private int startRow = 1;
	private int endRow = 10;
	private int perPage = 10;
	private int totalCount;
	private int endPage;
	
	public ReplyPagingDto(int bno, int nowPage, int totalCount) {
		this.bno = bno;
		this.nowPage = nowPage;
		this.totalCount = totalCount;
		calc();
	}
	
	public void calc() {
		
		endRow = nowPage * 10;
		startRow = endRow - 9;
		
		/* 전체댓글 28개
		 * 더보기 버튼 누르면 한번에 10개씩 추가
		 * 댓글 10개씩 보기
		 * 1회: 1~10개
		 * 2회: 11~20개
		 * 3회: 21~28개
		 * 
		 * 버튼 누를 때마다
		 * nowPage 1씩 증가
		 * startRow, endRow 10씩 증가
		 * 
		 * endRow < totalCount일 때
		 * endRow = totalCount,
		 * 버튼 안보이게 
		 * 
		 * 
		 * */
		
		if ((totalCount % perPage) == 0) {
			endPage = totalCount / perPage;
		} else {
			endPage = totalCount / perPage + 1;
		}
		
		if (endRow > totalCount) {
			endRow = totalCount;
		}
		
	}

}
