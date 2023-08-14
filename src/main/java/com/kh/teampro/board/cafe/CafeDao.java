package com.kh.teampro.board.cafe;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CafeDao {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.kh.teampro.ShowMapper.";	
	
	// 카페 전체 조회
	public List<CafeVo> getCafeList() throws Exception{
		List<CafeVo> list = sqlSession.selectList(NAMESPACE + "getCafeList");
		return list;
	}
	
	// 카페 구 별 조회
	public List<CafeVo> getLocationList(String location) throws Exception{
		List<CafeVo> list = sqlSession.selectList(NAMESPACE + "getLocationList", location);
		return list;
	}
}
