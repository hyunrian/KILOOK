package com.kh.teampro.paging;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class PagingDto {
	
	private int nowPage = 1;
	private int startRow;
	private int endRow;
	private int startPage;
	private int endPage;
	private int perPage = 8;
	private int totalCount;
	private int totalPage;
	private final int PAGE_BLOCK_COUNT = 10;
	private String option;
	private String keyword;
	private String filter;
	
	public PagingDto(int nowPage, int totalCount, 
			String option, String keyword, String filter) {
		this.nowPage = nowPage;
		this.totalCount = totalCount;
		this.option = option;
		this.keyword = keyword;
		this.filter = filter;
		calc();
	}
	
	public void calc() {
		endRow = nowPage * perPage;
		startRow = endRow - (perPage - 1);
		
		/* 전체글 237개
		 * 페이지 블럭 10페이지씩
		 * 글 8개씩 보기
		 * 1페이지: 1~8개
		 * 2페이지: 9~16
		 * 3페이지: 17~24
		 * 4페이지: 25~32
		 * 10페이지: 72~80
		 * 11페이지: 81~88
		 * 12페이지: 89~96
		 * 
		 * 29페이지: 224~232
		 * 30페이지: 233~237
		 * 
		 * 1페이지 -> 1~10
		 * 2페이지 -> 1~10
		 * 10페이지 -> 1~10
		 * 11페이지 -> 11~20
		 * 
		 * 
		 * */
		endPage = (int)(Math.ceil(nowPage / (double)PAGE_BLOCK_COUNT)) * PAGE_BLOCK_COUNT;
		startPage = endPage - (PAGE_BLOCK_COUNT - 1);
		
		if ((totalCount % perPage) == 0) {
			totalPage = totalCount / perPage;
		} else {
			totalPage = (totalCount / perPage) + 1;
		}
		if (endPage > totalPage) {
			endPage = totalPage;
		}
	}
}
