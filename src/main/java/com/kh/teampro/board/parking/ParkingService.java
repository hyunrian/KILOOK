package com.kh.teampro.board.parking;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ParkingService {

	@Autowired
	private ParkingDao parkingDao;
	
	// 주차장 전체 조회
	public List<ParkingVo> getParkingList() throws Exception{
		List<ParkingVo> list = parkingDao.getParkingList();
		return list;
	}
	
	// 주차장 추가
	public void insertParking(ParkingVo parkingVo) throws Exception{
		parkingDao.insertParking(parkingVo);
	}
}
