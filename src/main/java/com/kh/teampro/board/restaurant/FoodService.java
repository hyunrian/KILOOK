package com.kh.teampro.board.restaurant;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teampro.paging.CategoryPagingDto;

@Service
public class FoodService {
	
	@Autowired
	private FoodDao foodDao;
	
	// 맛집 전체 조회
	public List<FoodVo> getFoodList(CategoryPagingDto pagingDto) throws Exception{
		List<FoodVo> list = foodDao.getFoodList(pagingDto);
		return list;
	}
	
	// 맛집 필터링 조회
	public List<FoodVo> getFoodFilterList(CategoryPagingDto pagingDto) throws Exception{
		List<FoodVo> list = foodDao.getFoodFilterList(pagingDto);
		return list;
	}
	
	// 해당 맛집 상세보기
	public FoodVo getFoodInfo(int bno) throws Exception {
		FoodVo list = foodDao.getFoodInfo(bno);
		return list;
	}
	
	// 해당 맛집 상세보기 시 조회수 업데이트
	public void setFoodViewcnt(int bno) throws Exception {
		foodDao.setFoodViewcnt(bno);
	}

	// 추천 맛집
	public List<FoodVo> getRecomendedFoodList(HashMap hashMap) {
		List<FoodVo> list = foodDao.getRecomendedFoodList(hashMap);
		return list;
	}

	// 맛집 개수 구하기
	public int getfoodCount() throws Exception {
		int foodCount = foodDao.getfoodCount();
		return foodCount;
	}
	
	// 페이징
	public int getFoodCnt(CategoryPagingDto pagingDto) throws Exception {
		int getFoodCnt = foodDao.getFoodCnt(pagingDto);
		return getFoodCnt;
	}
	
	// 메인 : 인기 맛집 best 5
	public List<FoodVo> getBestFood() throws Exception {
		List<FoodVo> list = foodDao.getBestFood();
		return list;
	}

	public int getFilteredFoodCnt(CategoryPagingDto pagingDto) {
		int getFilteredFoodCnt = foodDao.getFilteredFoodCnt(pagingDto);
		return getFilteredFoodCnt;
	}
}
