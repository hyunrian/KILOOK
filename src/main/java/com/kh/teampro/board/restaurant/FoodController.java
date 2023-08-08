package com.kh.teampro.board.restaurant;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/databoard")
public class FoodController {
	@Autowired
	private FoodService foodService;
	
	// 맛집 전체 조회
	@RequestMapping(value = "/getFoodList", method = RequestMethod.GET)
	public List<FoodVo> getFoodList() throws Exception{
		List<FoodVo> list = foodService.getFoodList();
		return list;
	}
	
	// 해당 맛집 상세보기
	@RequestMapping(value = "/getFoodInfo", method = RequestMethod.GET)
	public List<FoodVo> getFoodList(int bno) throws Exception{
		List<FoodVo> list = foodService.getFoodInfo(bno);
		return list;
	}
	
}
