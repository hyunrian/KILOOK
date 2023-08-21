package com.kh.teampro.board.attraction;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teampro.board.accommodation.AccomVo;
import com.kh.teampro.board.restaurant.FoodVo;
import com.kh.teampro.paging.CategoryPagingDto;

@Service
public class PlaceService {
	
	@Autowired
	PlaceDao placeDao;
	
	// 명소 전체 조회
	public List<PlaceVo> getPlaceList(CategoryPagingDto pagingDto) throws Exception{
		List<PlaceVo> list = placeDao.getPlaceList(pagingDto);
		return list;
	}
	
	// 명소 필터링 조회
	public List<PlaceVo> getPlaceFilterList(CategoryPagingDto pagingDto) throws Exception{
		List<PlaceVo> list = placeDao.getPlaceFilterList(pagingDto);
		return list;
	}
	
	// 해당 명소 상세보기
	public PlaceVo getPlaceInfo(int bno) throws Exception{
		PlaceVo list = placeDao.getPlaceInfo(bno);
		return list;
	}
	
	// 해당 명소 상세보기 시 조회수 업데이트
	public void setPlaceViewcnt(int bno) throws Exception {
		placeDao.setPlaceViewcnt(bno);
	}
	
	// 추천 숙소
	public List<PlaceVo> getRecomendedPlaceList(HashMap hashMap) {
		List<PlaceVo> list = placeDao.getRecomendedPlaceList(hashMap);
		return list;
	}

	// 숙소 개수 구하기
	public int getPlaceCount() {
		int placeCount = placeDao.getPlaceCount();
		return placeCount;
	}
	
	// 페이징
	public int getPlaceCnt(CategoryPagingDto pagingDto) throws Exception {
		int getPlaceCnt = placeDao.getPlaceCnt(pagingDto);
		return getPlaceCnt;
	}
	
	// 메인 : 인기 명소 best 6
	public List<PlaceVo> getBestPlace() throws Exception {
		List<PlaceVo> list = placeDao.getBestPlace();
		return list;
	}

	// 필터링된 장소 개수
	public int getFilteredPlaceCnt(CategoryPagingDto pagingDto) {
		int getFilteredPlaceCnt = placeDao.getFilteredPlaceCnt(pagingDto);
		return getFilteredPlaceCnt;
	}
}
