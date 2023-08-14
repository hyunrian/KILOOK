package com.kh.teampro.attach;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AttachDao {
	
	private static final String NAMESPACE = "com.kh.teampro.AttachMapper."; 
	
	@Autowired
	SqlSession sqlSession;
	
	public void deleteFileData(String filename) {
		sqlSession.delete(NAMESPACE + "deleteFile", filename);
	}
	
	public void insertFileData(String fullname, int bno) {
		Map<String, Object> map = new HashMap<>();
		map.put("fullname", fullname);
		map.put("bno", bno);
		sqlSession.insert(NAMESPACE + "insertFileData", fullname);
	}

}
