package com.kh.teampro.board.attraction;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.teampro.board.restaurant.FoodVo;

@Repository
public class PlaceDao {
	
	@Autowired
	SqlSession sqlSession;
	
	private final String NAMESPACE = "com.kh.teampro.PlaceMapper.";
	
	// 명소 전체 조회
	public List<PlaceVo> getPlaceList() throws Exception{
		List<PlaceVo> list = sqlSession.selectList(NAMESPACE + "getPlaceList");
		return list;
	}
	
	// 해당 명소 상세보기
	public List<PlaceVo> getPlaceInfo(int bno) throws Exception{
		List<PlaceVo> list = sqlSession.selectList(NAMESPACE + "getPlaceInfo", bno);
		return list;
	}

	// 명소 추가
	public void insertPlace(PlaceVo placeVo) throws Exception{
		sqlSession.insert(NAMESPACE + "insertPlace", placeVo);
	}
	
}
