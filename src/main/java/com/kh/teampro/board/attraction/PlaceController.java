package com.kh.teampro.board.attraction;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.teampro.Like.board.PlaceLikeService;
import com.kh.teampro.Like.board.PlaceLikeVo;
import com.kh.teampro.board.accommodation.AccomVo;
import com.kh.teampro.board.restaurant.FoodVo;

@Controller
@RequestMapping("/databoard")
public class PlaceController {

	@Autowired
	private PlaceService placeService;
	
	@Autowired
	private PlaceLikeService placeLikeService;
	
	// 명소 전체 조회
	@RequestMapping(value = "/attraction", method = RequestMethod.GET)
	public String getPlaceList(Model model) throws Exception{
		List<PlaceVo> list = placeService.getPlaceList();
		model.addAttribute("placeList", list);
		return "databoard/attraction";
	}
	
	// 명소 필터링 조회
		@RequestMapping(value = "/filterAttraction", method = RequestMethod.GET)
		public String getFoodFilterList(@RequestParam("location") String location, Model model,HttpSession session) throws Exception{
			List<PlaceVo> list;
			if(location.equals("전체보기"))	{
				list = placeService.getPlaceList();
			} else {
				list = placeService.getPlaceFilterList(location);
			}
			model.addAttribute("placeList", list);
//			System.out.println(model);
			return "databoard/attraction";
		}
	
	// 해당 명소 상세보기
	@RequestMapping(value = "/getPlaceInfo", method = RequestMethod.GET)
	public String getPlaceList(int bno, Model model) throws Exception{
		PlaceVo placeVo = placeService.getPlaceInfo(bno);
//		System.out.println("placeVo:" + placeVo);
		
		// 명소 게시물 좋아요
		PlaceLikeVo placeLikeVo = new PlaceLikeVo();
		placeLikeVo.setUnickname("tester");
		placeLikeVo.setBno(bno);
		
		boolean likeResult = placeLikeService.placeLikeList(placeLikeVo);
		int likeCount = placeLikeService.getPlaceLikeCount(bno);
		
		HashMap<String, Object> likeMap = new HashMap<>();
		likeMap.put("likeResult", likeResult);
		likeMap.put("likeCount", likeCount);
		
		// 상세보기 페이지 - 다른 명소 추천부분
		int placeCount = placeService.getPlaceCount();
		int randomMax = placeCount;
		
		int[]  arr = randomArr(randomMax);
		
		HashMap<String,int[]> hashMap = new HashMap<String,int[]>();
		hashMap.put("arrShopList", arr);
		
		List<PlaceVo> recomendedAccomList = placeService.getRecomendedPlaceList(hashMap);
//		System.out.println("recomendedAccomList:" + recomendedAccomList);
		
		model.addAttribute("getPlaceInfo", placeVo);
		model.addAttribute("recomendedAccomList", recomendedAccomList);
		model.addAttribute("likeMap", likeMap);
		
		return "databoard/detailPlace";
	}
	
	// 다른 명소 추천부분 랜덤 구하기
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
