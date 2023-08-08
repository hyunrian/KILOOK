package com.kh.teampro.board.restaurant;

import java.util.List;

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
	public List<FoodVo> getFoodInfo(int bno) throws Exception{
		List<FoodVo> list = foodDao.getFoodInfo(bno);
		return list;
	}

}
