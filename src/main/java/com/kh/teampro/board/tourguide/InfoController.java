package com.kh.teampro.board.tourguide;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/databoard")
public class InfoController {

	@Autowired
	private InfoService infoService;
	
	// 관광소 전체 조회
	public List<InfoVo> getInfoList() throws Exception{
		List<InfoVo> list = infoService.getInfoList();
		return list;
	}
	
	// 관광소 추가
	public void insertInfo(InfoVo infoVo) throws Exception{
		infoService.insertInfo(infoVo);
	}
}
