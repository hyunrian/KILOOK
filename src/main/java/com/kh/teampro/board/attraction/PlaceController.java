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
import com.kh.teampro.board.restaurant.CategoryPagingDto;
import com.kh.teampro.board.restaurant.FoodVo;
import com.kh.teampro.commons.MyConstants;
import com.kh.teampro.user.info.UserVo;

@Controller
@RequestMapping("/databoard")
public class PlaceController {

	@Autowired
	private PlaceService placeService;
	
	@Autowired
	private PlaceLikeService placeLikeService;
	
	// 명소 필터링 조회
	@RequestMapping(value = "/attraction", method = RequestMethod.GET)
	public String getPlaceList(CategoryPagingDto pagingDto, Model model,
								@RequestParam(required = false, defaultValue = "전체보기",
								value = "location") String location) throws Exception{
		// 페이징
		int getPlaceCnt = placeService.getPlaceCnt(pagingDto);
		pagingDto = new CategoryPagingDto(pagingDto.getPage(), pagingDto.getPerPage(), getPlaceCnt);
		
		List<PlaceVo> list;
		if("전체보기".equals(location)) {
			list = placeService.getPlaceList(pagingDto);
		} else {
			pagingDto.setLocation(location);
			list = placeService.getPlaceFilterList(pagingDto);
			int getFilteredPlaceCnt = placeService.getFilteredPlaceCnt(pagingDto);
			pagingDto = new CategoryPagingDto(pagingDto.getPage(), pagingDto.getPerPage(), getFilteredPlaceCnt);
		}
		model.addAttribute("placeList", list);
		model.addAttribute("location", location);
		model.addAttribute("pagingDto", pagingDto);
		return "databoard/attraction";
	}
	
	// 해당 명소 상세보기
	@RequestMapping(value = "/getPlaceInfo", method = RequestMethod.GET)
	public String getPlaceList(int bno, Model model, HttpSession session) throws Exception {
		// 조회수 업데이트
		placeService.setPlaceViewcnt(bno);
		
		PlaceVo placeVo = placeService.getPlaceInfo(bno);
		
		// 명소 게시물 좋아요
		UserVo userVo = (UserVo)session.getAttribute(MyConstants.LOGIN); // 저장된 아이디 가져오기(수정필요)
		PlaceLikeVo placeLikeVo = new PlaceLikeVo();
		placeLikeVo.setUserid(userVo.getUserid());
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
	
	// 해당 인기 명소 best 6
	@RequestMapping(value = "/getBestPlace", method = RequestMethod.GET)
	public String getBestPlace(Model model) throws Exception {
		List<PlaceVo> list = placeService.getBestPlace();
		model.addAttribute("placeService", list);
		return "databoard/index";
	}
}
