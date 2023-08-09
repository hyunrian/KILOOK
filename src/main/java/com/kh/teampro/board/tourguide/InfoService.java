package com.kh.teampro.board.tourguide;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InfoService {

	@Autowired
	InfoDao infoDao;
	
	// 관광소 전체 조회
	public List<InfoVo> getInfoList() throws Exception{
		List<InfoVo> list = infoDao.getInfoList();
		return list;
	}
	
	// 관광소 추가
	public void insertInfo(InfoVo infoVo) throws Exception{
		infoDao.insertInfo(infoVo);
	}
}
