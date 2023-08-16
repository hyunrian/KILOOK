package com.kh.teampro.board.accommodation;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.teampro.Like.board.AccLikeService;
import com.kh.teampro.Like.board.AccLikeVo;

@Controller
@RequestMapping("/databoard")
public class AccomController {

	@Autowired
	private AccomService accomService;
	
	@Autowired
	private AccLikeService accLikeService;
	
	// 숙소 전체 조회
	@RequestMapping(value = "/accommodation", method = RequestMethod.GET)
	public String getAccomList(Model model) throws Exception{
		List<AccomVo> list = accomService.getAccomList();
		model.addAttribute("accomList", list);
		return "databoard/accommodation";
	}
	
	// 카테고리별 조회
	@RequestMapping(value = "/getCategoryList")
	public List<AccomVo> getCategoryList(String category) throws Exception{
		List<AccomVo> list = accomService.getCategoryList(category);
		return list;
	}
	
	// 해당 숙소 상세보기
	@RequestMapping(value = "/getAccomInfo", method = RequestMethod.GET)
	public String getAccomInfo(int bno, Model model) throws Exception{
		AccomVo accomVo = accomService.getAccomInfo(bno);
		System.out.println("accom:" + accomVo);
		
		// 숙소 게시물 좋아요
//		UserVo userVo = (UserVo)session.getAttribute(null); // 저장된 아이디 가져오기(수정필요)
		AccLikeVo accLikeVo = new AccLikeVo();
		accLikeVo.setUnickname("tester");
		accLikeVo.setBno(bno);
		
		boolean likeResult = accLikeService.accomLikeList(accLikeVo);
		int likeCount = accLikeService.getAccomLikeCount(bno);
		
		HashMap<String, Object> likeMap = new HashMap<>();
		likeMap.put("likeResult", likeResult);
		likeMap.put("likeCount", likeCount);
		
		
		// 상세보기 페이지 - 다른 숙소 추천부분
		int accomCount = accomService.getAccomCount();
		int randomMax = accomCount;
		
		int[]  arr = randomArr(randomMax);
		
		HashMap<String,int[]> hashMap = new HashMap<String,int[]>();
		hashMap.put("arrShopList", arr);
		
		List<AccomVo> recomendedAccomList = accomService.getRecomendedAccomList(hashMap);
//		System.out.println("recomendedAccomList:" + recomendedAccomList);
		
		model.addAttribute("getAccomInfo", accomVo);
		model.addAttribute("recomendedAccomList", recomendedAccomList);
		model.addAttribute("likeMap", likeMap);
		
		return "databoard/detailAccom";
	}
	
	// 다른 숙소 추천부분 랜덤 구하기
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
