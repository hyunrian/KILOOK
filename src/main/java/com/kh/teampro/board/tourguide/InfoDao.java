package com.kh.teampro.board.tourguide;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InfoDao {

	private final String NAMESPACE = "com.kh.teampro.InfoMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	// 관광소 전체 조회
	public List<InfoVo> getInfoList() throws Exception{
		List<InfoVo> list = sqlSession.selectList(NAMESPACE + "getInfoList");
		return list;
	}
	
	// 관광소 추가
	public void insertInfo(InfoVo infoVo) throws Exception{
		sqlSession.insert(NAMESPACE + "insertInfo", infoVo);
	}
}
