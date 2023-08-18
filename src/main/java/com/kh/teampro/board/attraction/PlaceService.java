package com.kh.teampro.board.attraction;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teampro.board.accommodation.AccomVo;
import com.kh.teampro.board.restaurant.FoodVo;

@Service
public class PlaceService {
	
	@Autowired
	PlaceDao placeDao;
	
	// 명소 전체 조회
	public List<PlaceVo> getPlaceList() throws Exception{
		List<PlaceVo> list = placeDao.getPlaceList();
		return list;
	}
	
	// 명소 필터링 조회
	public List<PlaceVo> getPlaceFilterList(String location) throws Exception{
		List<PlaceVo> list = placeDao.getPlaceFilterList(location);
		return list;
	}
	
	// 해당 명소 상세보기
	public PlaceVo getPlaceInfo(int bno) throws Exception{
		PlaceVo list = placeDao.getPlaceInfo(bno);
		return list;
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
}
