package com.kh.teampro.user.info;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@ToString
public class UserInfoPagingDto {
	private int page = 1; 			// 현재 페이지
	private int startRow;		// 시작 행 번호 (rnum bewteen 'A')
	private int endRow;			//  끝 행 번호  (and 'B')
	private int startPage;		// 1 2 3 ... 10 : 1
	private int endPage; 		// 1 2 3 ... 10 : 10 
	private int perPage = 5; 	// 페이지당 게시글 수 (N줄씩 보기)
	private int totalCount; 			// 전체 데이터 갯수
	private int totalPage; 		// 전체 페이지
	private final int PAGE_BLOCK_COUNT = 5;
	
	public UserInfoPagingDto(int page, int perPage, int count) {
		this.page = page;
		this.perPage = perPage;
		this.totalCount = count;
		calc();
	}
	
	public void calc() {
		this.endRow = this.page * this.perPage;
		this.startRow = this.endRow - (this.perPage - 1);
		this.endPage = (int)(Math.ceil(page / (double)PAGE_BLOCK_COUNT)) * PAGE_BLOCK_COUNT;
		this.startPage = this.endPage - (PAGE_BLOCK_COUNT - 1);
		this.totalPage = (int)Math.ceil(this.totalCount / (double)perPage);
		if (this.endPage > this.totalPage) {
			this.endPage = this.totalPage;
		}
	}
	
//	public void calc() {
//		this.endRow = this.page * this.perPage;
//		this.startRow = this.endRow - (this.perPage - 1);
//		int temp = (page-1)/perPage;
//		this.startPage = (temp)*PAGE_BLOCK_COUNT + 1;
//		this.endPage =   (temp)*PAGE_BLOCK_COUNT + PAGE_BLOCK_COUNT;
//		this.totalPage = (int)Math.ceil(this.totalCount / (double)perPage);
//		if (this.endPage > this.totalPage) {
//			this.endPage = this.totalPage;
//		}
//	}
	
	

	// page  1  2  3 ...  7 ... 10 : rowNum = 0, s =  1, e = 10 (int)((i-1)/perPage) = rowNum / rowNum*perPage + 1 = s / rowNum*perPage + perPage = e
	// page 11 12 13 ... 17 ... 20 : rowNum = 1, s = 11, e = 20 (int)((i-1)/perPage) = rowNum / rowNum*perPage + 1 = s / rowNum*perPage + perPage = e
	// page 21 21 23 ... 27 ... 30 : rowNum = 2, s = 21, e = 30
	// page 81 82 83 ... 87 ... 90 : rowNum = 8, s = 81, e = 90
	
	//page 1 2 3 4  5 : temp = 0, s =  1, e =  5 (int)(i+(5)-1)/5 = 1 / ((1-1) * 5) + 1 = s / 1 * (5) = e
	//page 6 7 8 9 10 : temp = 1, s =  6, e = 10 (int)(i+(5)-1)/5 = 2 / ((2-1) * 5) + 1 = s / 2 * (5) = e
	
	
//	((int)((page-1)/perPage))*perPage + 1 = s
//	((int)((page-1)/perPage))*perPage + perPage = e
//	this.startPage = ((int)((this.page-1)/(double)perPage))*this.perPage + 1;
//	this.endPage = ((int)((this.page-1)/(double)perPage))*this.perPage + this.perPage;
	// count 1 = page 1
	// count 7 = page 1
	// count 10 = page 2
	// count 11 = page 2
	// count 20 = page 3
	// count 30 = page 4
	// this.totalPage = (int)Math.ceil(this.totalCount / (double)perPage)
	
}
