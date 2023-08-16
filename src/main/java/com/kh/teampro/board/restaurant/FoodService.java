package com.kh.teampro.board.restaurant;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FoodService {
	
	@Autowired
	private FoodDao foodDao;
	
	// 맛집 전체 조회
	public List<FoodVo> getFoodList() throws Exception{
		List<FoodVo> list = foodDao.getFoodList();
		return list;
	}
	
	// 해당 맛집 상세보기
	public FoodVo getFoodInfo(int bno) throws Exception{
		FoodVo list = foodDao.getFoodInfo(bno);
		return list;
	}

	// 추천 맛집
	public List<FoodVo> getRecomendedFoodList(HashMap hashMap) {
		List<FoodVo> list = foodDao.getRecomendedFoodList(hashMap);
		return list;
	}

	// 맛집 개수 구하기
	public int getfoodCount() {
		int foodCount = foodDao.getfoodCount();
		return foodCount;
	}
	
	// 페이징
	public int getFoodCountPaging(FoodPagingDto foodPagingDto) throws Exception {
		int count = foodDao.getFoodCountPaging(foodPagingDto);
		return count;
	}
}
