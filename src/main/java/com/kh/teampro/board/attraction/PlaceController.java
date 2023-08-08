package com.kh.teampro.board.attraction;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.teampro.board.restaurant.FoodVo;

@RestController
@RequestMapping("/databoard")
public class PlaceController {

	@Autowired
	private PlaceService placeService;
	
	// 명소 전체 조회
	@RequestMapping(value = "/getPlaceList", method = RequestMethod.GET)
	public List<PlaceVo> getPlaceList() throws Exception{
		List<PlaceVo> list = placeService.getPlaceList();
		return list;
	}
	
	// 해당 명소 상세보기
	@RequestMapping(value = "/getPlaceInfo", method = RequestMethod.GET)
	public List<PlaceVo> getPlaceList(int bno) throws Exception{
		List<PlaceVo> list = placeService.getPlaceInfo(bno);
		return list;
	}
	
}
