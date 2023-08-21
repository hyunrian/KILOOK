package com.kh.teampro.board.accommodation;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teampro.board.restaurant.FoodVo;
import com.kh.teampro.paging.CategoryPagingDto;

@Service
public class AccomService {

	@Autowired
	private AccomDao accomDao;
	
	// 숙소 전체 조회
	public List<AccomVo> getAccomList(CategoryPagingDto pagingDto) throws Exception{
		List<AccomVo> list =  accomDao.getAccomList(pagingDto);
		return list;
	}
	
	// 숙소 필터링 조회
	public List<AccomVo> getAccomFilterList(CategoryPagingDto pagingDto) throws Exception{
		List<AccomVo> list = accomDao.getAccomFilterList(pagingDto);
		return list;
	}
	
	// 해당 숙소 상세보기
	public AccomVo getAccomInfo(int bno) throws Exception {
		AccomVo accomVo = accomDao.getAccomInfo(bno);
		return accomVo;
	}
	
	// 해당 숙소 상세보기 시 조회수 업데이트
	public void setAccomViewcnt(int bno) throws Exception {
		accomDao.setAccomViewcnt(bno);
	}
	
	// 추천 숙소
	public List<AccomVo> getRecomendedAccomList(HashMap hashMap) {
		List<AccomVo> list = accomDao.getRecomendedAccomList(hashMap);
		return list;
	}

	// 숙소 개수 구하기
	public int getAccomCount() throws Exception{
		int accomCount = accomDao.getAccomCount();
		return accomCount;
	}

	// 페이징
	public int getAccomCnt(CategoryPagingDto pagingDto) throws Exception {
		int getAccomCnt = accomDao.getAccomCnt(pagingDto);
		return getAccomCnt;
	}
	
	// 메인 : 인기 숙소 best 6
	public List<AccomVo> getBestAccom() throws Exception {
		List<AccomVo> list = accomDao.getBestAccom();
		return list;
	}

	public int getFilteredAccomCnt(CategoryPagingDto pagingDto) {
		int getFilteredAccomCnt = accomDao.getFilteredAccomCnt(pagingDto);
		return getFilteredAccomCnt;
	} 
}
