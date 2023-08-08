package com.kh.teampro.board.restaurant;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FoodDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.kh.teampro.FoodMapper.";
	
	// 맛집 전체 조회
	public List<FoodVo> getFoodList() throws Exception{
		List<FoodVo> list = sqlSession.selectList(NAMESPACE + "getFoodList");
		return list;
	}
	
	// 해당 맛집 상세보기
	public List<FoodVo> getFoodInfo(int bno) throws Exception{
		List<FoodVo> list = sqlSession.selectOne(NAMESPACE + "getFoodInfo", bno);
		return list;
	}
	
	// 맛집 추가
	public void insertFood(FoodVo foodVo) throws Exception{
		sqlSession.insert(NAMESPACE + "insertFood", foodVo);
//		System.out.println("foodVo:" + foodVo); // test ok
	}
	
}
