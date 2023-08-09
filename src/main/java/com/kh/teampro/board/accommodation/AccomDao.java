package com.kh.teampro.board.accommodation;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.teampro.board.attraction.PlaceVo;

@Repository
public class AccomDao {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.kh.teampro.AccomMapper.";	
	
	// 숙소 전체 조회
	public List<AccomVo> getAccomList() throws Exception{
		List<AccomVo> list = sqlSession.selectList(NAMESPACE + "getAccomList");
		return list;
	} 
	
	// 카테고리별 조회
	public List<AccomVo> getCategoryList(String category) throws Exception{
		List<AccomVo> list = sqlSession.selectList(NAMESPACE + "getCategoryList", category);
		return list;
	}
	
	// 해당 명소 상세보기
	public List<AccomVo> getAccomInfo(int bno) throws Exception{
		List<AccomVo>list = sqlSession.selectOne(NAMESPACE + "getAccomInfo", bno);
		return list;
	}
	
	// 숙소 추가
	public void insertAccom(AccomVo accomVo) throws Exception{
		sqlSession.insert(NAMESPACE + "insertAccom", accomVo);
	}
}
