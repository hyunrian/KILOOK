package com.kh.teampro.board.cafe;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CafeService {

	@Autowired
	private CafeDao cafeDao;
	
	// 숙소 전체 조회
	public List<CafeVo> getCafeList() throws Exception{
		List<CafeVo> list =  cafeDao.getCafeList();
		return list;
	}
	
	// 구 별 조회
	public List<CafeVo> getLocationList(String location) throws Exception{
		List<CafeVo> list = cafeDao.getLocationList(location);
		return list;
	}
	
}
