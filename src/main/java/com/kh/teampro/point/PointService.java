package com.kh.teampro.point;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PointService {
	
	@Autowired
	private PointDao pointDao;
	
	// 포인트 추가
	public void addPoint(String userid, int point) {
		pointDao.addPoint(userid, point);
	}
	
	// 포인트 확인
	public int checkPoint(String userid) {
		int point = pointDao.checkPoint(userid);
		return point;
	}
	
	// 포인트 사용
	public void usePoint(String userid, int requiredPoint) {
		pointDao.usePoint(userid, requiredPoint);
	}
	
}
