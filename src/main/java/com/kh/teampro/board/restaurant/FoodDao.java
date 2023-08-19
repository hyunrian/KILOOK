package com.kh.teampro.board.restaurant;

import java.util.HashMap;
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
//	public List<FoodVo> getFoodList() throws Exception{
//		List<FoodVo> list = sqlSession.selectList(NAMESPACE + "getFoodList");
//		return list;
//	}
	
	// 맛집 전체 조회
	public List<FoodVo> getFoodList(FoodPagingDto pagingDto) throws Exception{
		List<FoodVo> list = sqlSession.selectList(NAMESPACE + "getFoodList", pagingDto);
		return list;
	}
	
	// 맛집 필터링 조회
	public List<FoodVo> getFoodFilterList(String location) throws Exception{
		List<FoodVo> list = sqlSession.selectList(NAMESPACE + "getFoodFilterList", location);
		return list;
	}
	
	// 해당 맛집 상세보기
	public FoodVo getFoodInfo(int bno) throws Exception{
		FoodVo list = sqlSession.selectOne(NAMESPACE + "getFoodInfo", bno);
		System.out.println("getFoodInfo list:" + list);
		return list;
	}
	
	// 해당 맛집 상세보기 시 조회수 업데이트
	public void setFoodViewcnt(int bno) throws Exception{
		sqlSession.update(NAMESPACE + "setFoodViewcnt", bno);
	}
	
	// 맛집 추가
	public void insertFood(FoodVo foodVo) throws Exception{
		sqlSession.insert(NAMESPACE + "insertFood", foodVo);
	}

	// 추천 맛집에 담을 랜덤 count 구하기
	public int getfoodCount(){
		int foodCount = sqlSession.selectOne(NAMESPACE + "getFoodCount");
		return foodCount;
	}
	
	// 추천 맛집 추출
	public List<FoodVo> getRecomendedFoodList(HashMap hashMap) {
		List<FoodVo> list = sqlSession.selectList(NAMESPACE + "getRecomendedFoodList", hashMap);
		return list;
	}
	
	// 페이징
	public int getFoodCnt(FoodPagingDto pagingDto) throws Exception{
		int getFoodCnt = sqlSession.selectOne(NAMESPACE + "getFoodCnt", pagingDto);
		return getFoodCnt;
	}
	
	// 메인 : 인기 맛집 best 5
//	public List<FoodVo> getBestFood() throws Exception {
//		sqlSession.selectList(NAMESPACE + "getFoodLikeCnt");
//		sqlSession.update(NAMESPACE + "updateFoodLikeCnt");
//		sqlSession.selectList(NAMESPACE + "getAccReplyCnt");
//		sqlSession.update(NAMESPACE + "updateFoodReplyCnt");
//		List<FoodVo> list = sqlSession.selectList(NAMESPACE + "getBestFood");
//		System.out.println("getBestFood list:" + list);
//		return list;
//	}
}
