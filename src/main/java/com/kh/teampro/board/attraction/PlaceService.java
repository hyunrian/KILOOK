package com.kh.teampro.board.attraction;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	// 해당 명소 상세보기
	public List<PlaceVo> getPlaceInfo(int bno) throws Exception{
		List<PlaceVo> list = placeDao.getPlaceInfo(bno);
		return list;
	}
	
}
