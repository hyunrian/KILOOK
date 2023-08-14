package com.kh.teampro.board.attraction;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.teampro.board.restaurant.FoodVo;

@Controller
@RequestMapping("/databoard")
public class PlaceController {

	@Autowired
	private PlaceService placeService;
	
	// 명소 전체 조회
	@RequestMapping(value = "/attraction", method = RequestMethod.GET)
	public String getPlaceList(Model model) throws Exception{
		List<PlaceVo> list = placeService.getPlaceList();
		model.addAttribute("placeList", list);
		return "databoard/attraction";
	}
	
	// 해당 명소 상세보기
	@RequestMapping(value = "/getPlaceInfo", method = RequestMethod.GET)
	public List<PlaceVo> getPlaceList(int bno) throws Exception{
		List<PlaceVo> list = placeService.getPlaceInfo(bno);
		return list;
	}
	
}
