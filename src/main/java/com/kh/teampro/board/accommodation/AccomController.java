package com.kh.teampro.board.accommodation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/databoard")
public class AccomController {

	@Autowired
	private AccomService accomService;
	
	// 숙소 전체 조회
	public List<AccomVo> getAccomList() throws Exception{
		List<AccomVo> list = accomService.getAccomList();
		return list;
	}
	
	// 카테고리별 조회
	public List<AccomVo> getCategoryList(String category) throws Exception{
		List<AccomVo> list = accomService.getCategoryList(category);
		return list;
	}
	
	// 해당 명소 상세보기
	public List<AccomVo> getAccomInfo(int bno) throws Exception{
		List<AccomVo> list = accomService.getAccomInfo(bno);
		return list;
	}
	
	// 숙소 추가
	public void insertAccom(AccomVo accomVo) throws Exception{
		accomService.insertAccom(accomVo);
	}
}
