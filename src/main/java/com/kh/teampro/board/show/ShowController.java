package com.kh.teampro.board.show;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.teampro.paging.CategoryPagingDto;


@Controller
@RequestMapping("/databoard")
public class ShowController {
	
	@Autowired
	private ShowService showService;
	
	// 전시 전체 조회
	@RequestMapping(value = "/show", method = RequestMethod.GET)
	public String getShowList(CategoryPagingDto pagingDto, Model model) throws Exception{
		// 페이징
		int getShowCnt = showService.getShowCnt(pagingDto);
		pagingDto = new CategoryPagingDto(pagingDto.getPage(), pagingDto.getPerPage(), getShowCnt);
		
		List<ShowVo> list = showService.getShowList(pagingDto);
		
		
		model.addAttribute("showList", list);
		model.addAttribute("pagingDto", pagingDto);
		return "databoard/show";
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
