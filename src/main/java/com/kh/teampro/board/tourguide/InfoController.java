package com.kh.teampro.board.tourguide;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequestMapping("/databoard")
public class InfoController {

	@Autowired
	private InfoService infoService;
	
	// 관광소 전체 조회
	@RequestMapping(value = "/tourguide", method = RequestMethod.GET)
	public String getInfoList(Model model) throws Exception{
		List<InfoVo> list = infoService.getInfoList();
		model.addAttribute("tourguideList", list);
		return "databoard/tourguide";
	}
	
	// 관광소 추가
	public void insertInfo(InfoVo infoVo) throws Exception{
		infoService.insertInfo(infoVo);
	}
}
