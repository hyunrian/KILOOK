package com.kh.teampro.board.parking;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/databoard")
public class ParkingController {

	@Autowired
	private ParkingService parkingService;
	
	// 주차장 전체 조회
	public List<ParkingVo> getParkingList() throws Exception{
		List<ParkingVo> list = parkingService.getParkingList();
		return list;
	}
	
	// 주차장 추가
	public void insertParking(ParkingVo parkingVo) throws Exception{
		parkingService.insertParking(parkingVo);
	}
}
