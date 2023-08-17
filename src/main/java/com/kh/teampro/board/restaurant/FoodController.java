package com.kh.teampro.board.restaurant;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.teampro.Like.board.FoodLikeService;
import com.kh.teampro.Like.board.FoodLikeVo;

@Controller
@RequestMapping("/databoard")
public class FoodController {
	
	@Autowired
	private FoodService foodService;
	
	@Autowired
	private FoodLikeService foodLikeService;
	
	// 맛집 전체 조회
	@RequestMapping(value = "/restaurant", method = RequestMethod.GET)
	public String getFoodList(FoodPagingDto foodPagingDto, Model model, HttpSession session) throws Exception{
		// 페이징
//		int totalCount = foodService.getFoodCountPaging(foodPagingDto);
//		foodPagingDto = new FoodPagingDto(foodPagingDto.getPage(), foodPagingDto.getPerPage(), totalCount);
		
		
		List<FoodVo> list = foodService.getFoodList();
		
		model.addAttribute("foodList", list);
		return "databoard/restaurant";
	}
	
	// 맛집 필터링 조회
	@ResponseBody
	@RequestMapping(value = "/filterRestaurant/{location}", method = RequestMethod.GET)
	public List<FoodVo> getFoodFilterList(@PathVariable String location, HttpSession session) throws Exception{
		List<FoodVo> list = foodService.getFoodFilterList(location);
		return list;
	}
	
	// 해당 맛집 상세보기
	@RequestMapping(value = "/getFoodInfo", method = RequestMethod.GET)
	public String getFoodInfo(int bno, Model model, HttpSession session) throws Exception{
		FoodVo foodVo = foodService.getFoodInfo(bno);
		
		// 맛집 게시물 좋아요
//		UserVo userVo = (UserVo)session.getAttribute(null); // 저장된 아이디 가져오기(수정필요)
		FoodLikeVo foodLikeVo = new FoodLikeVo();
		foodLikeVo.setUnickname("tester"); // 수정필요
		foodLikeVo.setBno(bno);
		
		boolean likeResult = foodLikeService.restLikeList(foodLikeVo);
		int likeCount = foodLikeService.getRestLikeCount(bno);
		
		HashMap<String, Object> likeMap = new HashMap<>();
		likeMap.put("likeResult", likeResult);
		likeMap.put("likeCount", likeCount);
				
		
		// 상세보기 페이지 - 다른 맛집 추천부분
		int foodCount = foodService.getfoodCount();
		int randomMax = foodCount; //정수표출
		
		int[]  arr = randomArr(randomMax);
		
		HashMap<String,int[]> hashMap = new HashMap<String,int[]>();
		hashMap.put("arrShopList", arr);
		
		List<FoodVo> recomendedFoodList = foodService.getRecomendedFoodList(hashMap); 
		
		model.addAttribute("getFoodInfo", foodVo);
		model.addAttribute("recomendedFoodList", recomendedFoodList);
		model.addAttribute("likeMap", likeMap);
		
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
			arr = randomArr(maxNumber);
		}
		return arr; 
	}
}
