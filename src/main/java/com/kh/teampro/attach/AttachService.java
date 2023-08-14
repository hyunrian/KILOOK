package com.kh.teampro.attach;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AttachService {

	@Autowired
	private AttachDao attachDao;
	
	// 첨부파일 테이블 데이터 추가
	public void insertFileData(String fullname, int bno) {
		attachDao.insertFileData(fullname, bno);
	}
	
	// 첨부파일 테이블 데이터 삭제
	public void deleteFileData(String filename) {
		attachDao.deleteFileData(filename);
	}
	
}
