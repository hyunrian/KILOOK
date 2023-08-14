package com.kh.teampro.board.travelcourse;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CourseService {

	@Autowired
	private CourseDao courseDao;
	
	// 나만의 코스 조회
	public List<CourseVo> getCourseList() {
		List<CourseVo> list = courseDao.getCourseList();
		return list;
	}
	
	// 코스 상세보기
	public CourseVo getCourseInfo(int cno) {
		CourseVo courseVo = courseDao.getCourseInfo(cno);
		return courseVo;
	}
	
	// 나만의 코스 등록
	public void courseInsert(CourseVo courseVo) {
		courseDao.courseInsert(courseVo);
	}
}
