package com.kh.teampro.board.accommodation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/databoard")
public class AccomController {

	@Autowired
	private AccomService accomService;
	
	// 숙소 전체 조회
	@RequestMapping(value = "/accommodation", method = RequestMethod.GET)
	public String getAccomList(Model model) throws Exception{
		List<AccomVo> list = accomService.getAccomList();
		model.addAttribute("accomList", list);
		return "databoard/accommodation";
	}
	
	// 카테고리별 조회
	@RequestMapping(value = "/getRE")
	public List<AccomVo> getCategoryList(String category) throws Exception{
		List<AccomVo> list = accomService.getCategoryList(category);
		return list;
	}
	
	// 해당 숙소 상세보기
	public List<AccomVo> getAccomInfo(int bno) throws Exception{
		List<AccomVo> list = accomService.getAccomInfo(bno);
		return list;
	}
	
	// 숙소 추가
	public void insertAccom(AccomVo accomVo) throws Exception{
		accomService.insertAccom(accomVo);
	}
}
