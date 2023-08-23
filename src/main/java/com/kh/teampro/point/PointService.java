package com.kh.teampro.point;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.teampro.commons.MyConstants;

@Service
public class PointService {
	
	@Autowired
	private PointDao pointDao;

	// 글 작성 포인트
	private final int POST_POINT = 20;
	// 댓글 작성 포인트
	private final int REPLY_POINT = 5;
	
	
	// 글 작성 포인트 추가
	public void addPostPoint(String userid) {
		pointDao.addPoint(userid, POST_POINT);
	}
	// 댓글 작성 포인트 추가
	public void addReplyPoint(String userid) {
		pointDao.addPoint(userid, REPLY_POINT);
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
