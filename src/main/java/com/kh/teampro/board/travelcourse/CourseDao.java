package com.kh.teampro.board.travelcourse;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CourseDao {

	private final String NAMESPACE = "com.kh.teampro.CourseMapper.";	
	
	@Autowired
	private SqlSession sqlSession;
	
	// 나만의 코스 조회
	public List<CourseVo> getCourseList() {
		List<CourseVo> list = sqlSession.selectList(NAMESPACE + "courseList");
		return list;
	}
	
	// 코스 상세보기
	public CourseVo getCourseInfo(int cno) {
		CourseVo courseVo = sqlSession.selectOne(NAMESPACE + "getCourseInfo", cno);
		return courseVo;
	}
	
	// 나만의 코스 등록
	public void courseInsert(CourseVo courseVo) {
		sqlSession.insert(NAMESPACE + "courseInsert", courseVo);
	}
}
