package com.kh.teampro.board.parking;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequestMapping("/databoard")
public class ParkingController {

	@Autowired
	private ParkingService parkingService;
	
	// 주차장 전체 조회
	@RequestMapping(value = "/parking", method = RequestMethod.GET)
	public String getParkingList(Model model) throws Exception{
		List<ParkingVo> list = parkingService.getParkingList();
		model.addAttribute("parkingList", list);
		return "databoard/parking";
	}
	
	// 주차장 추가
	public void insertParking(ParkingVo parkingVo) throws Exception{
		parkingService.insertParking(parkingVo);
	}
}
