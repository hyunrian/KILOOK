package com.kh.teampro.board.cafe;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/databoard")
public class CafeController {

	@Autowired
	private CafeService cafeService;
	
	// 카페 전체 조회
	@RequestMapping(value = "/cafe", method = RequestMethod.GET)
	public String getCafeList(Model model) throws Exception{
		List<CafeVo> list = cafeService.getCafeList();
		model.addAttribute("cafeList", list);
		return "databoard/cafe";
	}
	
	// 구 별 조회
	@RequestMapping(value = "/cafeLocation/{location}", method = RequestMethod.GET)
	@ResponseBody
	public List<CafeVo> getLocationList(@PathVariable String location, Model model) throws Exception{
		List<CafeVo> list = cafeService.getLocationList(location);
		return list;
	}
}
