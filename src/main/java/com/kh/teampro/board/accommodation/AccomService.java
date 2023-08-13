package com.kh.teampro.board.accommodation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<AccomVo> getAccomInfo(int bno) throws Exception{
		List<AccomVo> list = accomDao.getAccomInfo(bno);
		return list;
	}
	
	// 숙소 추가
	public void insertAccom(AccomVo accomVo) throws Exception{
		accomDao.insertAccom(accomVo);
	}
}
