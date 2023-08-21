package com.kh.teampro.paging;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class CategoryPagingDto {
	private int page = 1;
	private int startRow;
	private int endRow;
	private int startPage;
	private int endPage;
	private int perPage = 12;
	private int totalCount;
	private int totalPage;
	private final int PAGE_BLOCK_COUNT = 10;
	private String location;
	private String category;
	
	public CategoryPagingDto(int page, int perPage, int totalCount) {
		this.page = page;
		this.perPage = perPage;
		this.totalCount = totalCount;
		calc();
	}
	
	public void calc() {
		this.endRow = this.page * this.perPage;
		this.startRow = this.endRow - (this.perPage - 1);
		this.endPage = (int)(Math.ceil(page / (double)PAGE_BLOCK_COUNT)) * PAGE_BLOCK_COUNT;
		this.startPage = this.endPage - (PAGE_BLOCK_COUNT - 1);
		this.totalPage = (int)Math.ceil(this.totalCount / (double)perPage);
		if(this.endPage > this.totalPage) {
			this.endPage = this.totalPage;
		}
	}
}
