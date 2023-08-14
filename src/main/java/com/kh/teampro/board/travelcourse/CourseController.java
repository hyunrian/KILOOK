package com.kh.teampro.board.travelcourse;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/course")
public class CourseController {
	
	@Autowired
	private CourseService courseService;
	
	// 나만의 코스 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String getCourseList(Model model) throws Exception {
		System.out.println("/list controller 들어옴");
		List<CourseVo> list = courseService.getCourseList();
		model.addAttribute("courseList", list);
		return "databoard/travelcourse";
	}
	
	// 코스 상세보기
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String getCourseInfo(int cno, Model model) throws Exception {
		CourseVo courseVo = courseService.getCourseInfo(cno);
		model.addAttribute("courseVo", courseVo);
		return "databoard/detailCourse";
	}
		
	// 나만의 코스 등록
	
	
}
