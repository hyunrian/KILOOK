package com.kh.teampro.board.restaurant;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/databoard")
public class FoodController {
	
	@Autowired
	private FoodService foodService;
	
	// 맛집 전체 조회
	@RequestMapping(value = "/restaurant", method = RequestMethod.GET)
	public String getFoodList(Model model) throws Exception{
		List<FoodVo> list = foodService.getFoodList();
		model.addAttribute("foodList", list);
		return "databoard/restaurant";
	}
	
	// 해당 맛집 상세보기
	@RequestMapping(value = "/getFoodInfo", method = RequestMethod.GET)
	public String getFoodInfo(int bno, Model model) throws Exception{
		FoodVo foodVo = foodService.getFoodInfo(bno);
		
		// 상세보기 페이지 - 다른 맛집 추천부분
		int foodCount = foodService.getfoodCount();
		int randomMax = foodCount; //정수표출
		
		int[]  arr = randomArr(randomMax);
		
		HashMap<String,int[]> hashMap = new HashMap<String,int[]>();
		hashMap.put("arrShopList", arr);
		
		List<FoodVo> recomendedFoodList = foodService.getRecomendedFoodList(hashMap); 
		
		model.addAttribute("getFoodInfo", foodVo);
		model.addAttribute("recomendedFoodList", recomendedFoodList);
		
		String a = "1";
		
		return "databoard/detailRest";
	}
	
	// 다른 맛집 추천부분 랜덤 구하기
	public int[] randomArr(int maxNumber) {
		int[] arr = new int[3];
		for(int i = 0; i < 3; i++) {
			int a = (int)(Math.random()*maxNumber);
			
			if(a < 1) {
				a = 1;
			}
			arr[i] = a;
		}
		
		int[] newArr = Arrays.stream(arr).distinct().toArray();
		
		if(newArr.length != 3) {
			randomArr(maxNumber);
		}
		return arr; 
	}
}
