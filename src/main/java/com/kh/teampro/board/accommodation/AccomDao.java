package com.kh.teampro.board.accommodation;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.teampro.board.attraction.PlaceVo;
import com.kh.teampro.board.restaurant.FoodVo;
import com.kh.teampro.paging.CategoryPagingDto;

@Repository
public class AccomDao {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.kh.teampro.AccomMapper.";	
	
	// 숙소 전체 조회
	public List<AccomVo> getAccomList(CategoryPagingDto pagingDto) throws Exception{
		List<AccomVo> list = sqlSession.selectList(NAMESPACE + "getAccomList", pagingDto);
		return list;
	} 
	
	// 숙소 필터링 조회
	public List<AccomVo> getAccomFilterList(CategoryPagingDto pagingDto) throws Exception{
		List<AccomVo> list = sqlSession.selectList(NAMESPACE + "getAccomFilterList", pagingDto);
		return list;
	}
	
	// 해당 숙소 상세보기
	public AccomVo getAccomInfo(int bno) throws Exception{
		AccomVo accomVo = sqlSession.selectOne(NAMESPACE + "getAccomInfo", bno);
		return accomVo;
	}
	
	// 해당 숙소 상세보기 시 조회수 업데이트
	public void setAccomViewcnt(int bno) throws Exception {
		sqlSession.update(NAMESPACE + "setAccomViewcnt", bno);
	}
	
	// 숙소 추가
	public void insertAccom(AccomVo accomVo) throws Exception{
		sqlSession.insert(NAMESPACE + "insertAccom", accomVo);
	}
	
	// 추천 맛집에 담을 랜덤 count 구하기
	public int getAccomCount() {
		int accomCount = sqlSession.selectOne(NAMESPACE + "getAccomCount");
		return accomCount;
	}
	
	// 추천 맛집 추출
	public List<AccomVo> getRecomendedAccomList(HashMap hashMap) {
		List<AccomVo> list = sqlSession.selectList(NAMESPACE + "getRecomendedAccomList", hashMap);
		return list;
	}

	// 페이징
	public int getAccomCnt(CategoryPagingDto pagingDto) throws Exception {
		int getAccomCnt = sqlSession.selectOne(NAMESPACE + "getAccomCnt", pagingDto);
		return getAccomCnt;
	}
	
	// 메인 : 인기 숙소 best 6
	public List<AccomVo> getBestAccom() throws Exception {
		List<AccomVo> list = sqlSession.selectList(NAMESPACE + "getBestAccom");
		return list;
	}

	
	public int getFilteredAccomCnt(CategoryPagingDto pagingDto) {
		int getFilteredAccomCnt = sqlSession.selectOne(NAMESPACE + "getFilteredAccomCnt", pagingDto);
		return getFilteredAccomCnt;
	}
	
}
