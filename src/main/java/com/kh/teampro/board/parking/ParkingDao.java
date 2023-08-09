package com.kh.teampro.board.parking;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ParkingDao {

	private final String NAMESPACE = "com.kh.teampro.ParkingMapper.";
	
	@Autowired
	SqlSession sqlSession;
	
	// 주차장 전체 조회
	public List<ParkingVo> getParkingList() throws Exception{
		List<ParkingVo> list = sqlSession.selectList(NAMESPACE + "getParkingList");
		return list;
	}
	
	// 주차장 추가
	public void insertParking(ParkingVo parkingVo) throws Exception{
		sqlSession.insert(NAMESPACE + "insertParking", parkingVo);
	}
}
