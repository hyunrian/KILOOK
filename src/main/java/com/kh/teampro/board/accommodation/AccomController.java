package com.kh.teampro.board.accommodation;

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

import com.kh.teampro.Like.board.AccLikeService;
import com.kh.teampro.Like.board.AccLikeVo;
import com.kh.teampro.board.restaurant.CategoryPagingDto;
import com.kh.teampro.commons.MyConstants;
import com.kh.teampro.user.info.UserVo;

@Controller
@RequestMapping("/databoard")
public class AccomController {

	@Autowired
	private AccomService accomService;
	
	@Autowired
	private AccLikeService accLikeService;
	
	// 숙소 필터링(카테고리별) 조회
	@RequestMapping(value = "/accommodation", method = RequestMethod.GET)
	public String getAccomList(CategoryPagingDto pagingDto, Model model, 
								  @RequestParam(required = false, defaultValue = "전체보기",
								  value="category") String category) throws Exception{
		
		// 페이징
		int getAccomCnt = accomService.getAccomCnt(pagingDto);
		pagingDto = new CategoryPagingDto(pagingDto.getPage(), pagingDto.getPerPage(), getAccomCnt);
		
		List<AccomVo> list; 
		if("전체보기".equals(category)) {
			list = accomService.getAccomList(pagingDto);
		} else {
			pagingDto.setCategory(category);
			list = accomService.getAccomFilterList(pagingDto);
			int getFilteredAccomCnt = accomService.getFilteredAccomCnt(pagingDto);
			pagingDto = new CategoryPagingDto(pagingDto.getPage(), pagingDto.getPerPage(), getFilteredAccomCnt);
		}
		
		model.addAttribute("accomList", list);
		model.addAttribute("category", category);
		model.addAttribute("pagingDto", pagingDto);
		return "databoard/accommodation";
	}
	
	// 해당 숙소 상세보기
	@RequestMapping(value = "/getAccomInfo", method = RequestMethod.GET)
	public String getAccomInfo(int bno, Model model, HttpSession session) throws Exception {
		// 조회수 업데이트
		accomService.setAccomViewcnt(bno);
		
		AccomVo accomVo = accomService.getAccomInfo(bno);
		
		// 숙소 게시물 좋아요
		UserVo userVo = (UserVo)session.getAttribute(MyConstants.LOGIN); // 저장된 아이디 가져오기(수정필요)
		AccLikeVo accLikeVo = new AccLikeVo();
		accLikeVo.setUserid(userVo.getUserid());
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
	
	// 메인 : 인기 숙소 best 6
	@RequestMapping(value = "/getBestAccom", method = RequestMethod.GET)
	public String getBestAccom(Model model) throws Exception {
		List<AccomVo> list = accomService.getBestAccom();
		model.addAttribute("getBestAccom", list);
		return "databoard/index";
	} // test ok
}
