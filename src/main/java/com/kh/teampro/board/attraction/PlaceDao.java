package com.kh.teampro.board.attraction;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.teampro.board.accommodation.AccomVo;
import com.kh.teampro.board.restaurant.FoodVo;
import com.kh.teampro.paging.CategoryPagingDto;

@Repository
public class PlaceDao {
	
	@Autowired
	SqlSession sqlSession;
	
	private final String NAMESPACE = "com.kh.teampro.PlaceMapper.";
	
	// 명소 전체 조회
	public List<PlaceVo> getPlaceList(CategoryPagingDto pagingDto) throws Exception{
		List<PlaceVo> list = sqlSession.selectList(NAMESPACE + "getPlaceList", pagingDto);
		return list;
	}
	
	// 명소 필터링 조회
	public List<PlaceVo> getPlaceFilterList(CategoryPagingDto pagingDto) throws Exception{ 
		List<PlaceVo> list = sqlSession.selectList(NAMESPACE + "getPlaceFilterList", pagingDto);
		return list;
	}
	
	// 해당 명소 상세보기
	public PlaceVo getPlaceInfo(int bno) throws Exception{
		PlaceVo list = sqlSession.selectOne(NAMESPACE + "getPlaceInfo", bno);
		return list;
	}
	
	// 해당 명소 상세보기 시 조회수 업데이트
	public void setPlaceViewcnt(int bno) throws Exception {
		sqlSession.update(NAMESPACE + "setPlaceViewcnt", bno);
	}

	// 명소 추가
	public void insertPlace(PlaceVo placeVo) throws Exception{
		sqlSession.insert(NAMESPACE + "insertPlace", placeVo);
	}
	
	// 추천 명소에 담을 랜덤 count 구하기
	public int getPlaceCount() {
		int placeCount = sqlSession.selectOne(NAMESPACE + "getPlaceCount");
		return placeCount;
	}
	
	// 추천 명소 추출
	public List<PlaceVo> getRecomendedPlaceList(HashMap hashMap) {
		List<PlaceVo> list = sqlSession.selectList(NAMESPACE + "getRecomendedPlaceList", hashMap);
		return list;
	}
	
	// 페이징
	public int getPlaceCnt(CategoryPagingDto pagingDto) throws Exception {
		int getPlaceCnt = sqlSession.selectOne(NAMESPACE + "getPlaceCnt", pagingDto);
		return getPlaceCnt;
	}
	
	// 메인 : 인기 관광지 best 6
	public List<PlaceVo> getBestPlace() throws Exception {
		List<PlaceVo> list = sqlSession.selectList(NAMESPACE + "getBestPlace");
		return list;
	}

	public int getFilteredPlaceCnt(CategoryPagingDto pagingDto) {
		int getFilteredPlaceCnt = sqlSession.selectOne(NAMESPACE + "getFilteredPlaceCnt", pagingDto);
		return getFilteredPlaceCnt;
	}
}
