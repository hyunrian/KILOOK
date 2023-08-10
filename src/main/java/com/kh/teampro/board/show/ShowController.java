package com.kh.teampro.board.show;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/databoard")
public class ShowController {
	
	@Autowired
	private ShowService showService;
	
	// 전시 전체 조회
	public List<ShowVo> getShowList() throws Exception{
		List<ShowVo> list = showService.getShowList();
		return list;
	}
	
	// 해당 전시 상세보기
	public List<ShowVo> getShowInfo(int bno) throws Exception{
		List<ShowVo> list = showService.getShowInfo(bno);
		return list;
	}
	
	// 전시 추가
	public void insertShow(ShowVo showVo) throws Exception{
		showService.insertShow(showVo);
	}
}
