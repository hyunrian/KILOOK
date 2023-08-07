package com.kh.teampro.point;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PointDao {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAME_SPACE = "com.kh.teampro.PointMapper.";

	// 포인트 추가
	public void addPoint(String userid, int point) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("point", point);
		sqlSession.update(NAME_SPACE + "addPoint", map);
	}
	
	// 포인트 확인
	public int checkPoint(String userid) {
		int point = sqlSession.selectOne(NAME_SPACE + "checkPoint", userid);
		return point;
	}
	
	// 포인트 사용
	public void usePoint(String userid, int requiredPoint) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("requiredPoint", requiredPoint);
		sqlSession.update(NAME_SPACE + "usePoint", map);
	}
	
}
