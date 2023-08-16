package com.kh.teampro.board.accommodation;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teampro.board.restaurant.FoodVo;

@Service
public class AccomService {

	@Autowired
	private AccomDao accomDao;
	
	// 숙소 전체 조회
	public List<AccomVo> getAccomList() throws Exception{
		List<AccomVo> list =  accomDao.getAccomList();
		return list;
	}
	
	// 카테고리별 조회
	public List<AccomVo> getCategoryList(String category) throws Exception{
		List<AccomVo> list = accomDao.getCategoryList(category);
		return list;
	}
	
	// 해당 숙소 상세보기
	public AccomVo getAccomInfo(int bno) throws Exception{
		AccomVo accomVo = accomDao.getAccomInfo(bno);
		return accomVo;
	}
	
	// 숙소 추가
	public void insertAccom(AccomVo accomVo) throws Exception{
		accomDao.insertAccom(accomVo);
	}
	
	// 추천 숙소
	public List<AccomVo> getRecomendedAccomList(HashMap hashMap) {
		List<AccomVo> list = accomDao.getRecomendedAccomList(hashMap);
		return list;
	}

	// 숙소 개수 구하기
	public int getAccomCount() {
		int accomCount = accomDao.getAccomCount();
		return accomCount;
	}
}
