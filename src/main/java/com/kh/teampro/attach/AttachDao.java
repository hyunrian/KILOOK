package com.kh.teampro.attach;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AttachDao {
	
	private static final String NAMESPACE = "com.kh.teampro.AttachMapper."; 
	
	@Autowired
	private SqlSession sqlSession;
	
	public void deleteFileData(int bno) {
		sqlSession.delete(NAMESPACE + "deleteThumbnail", bno);
	}
	
	public void insertFileData(AttachVo attachVo) {
		sqlSession.insert(NAMESPACE + "insertThumbnail", attachVo);
	}
	
	public void updateThumbnail(AttachVo attachVo) {
		sqlSession.update(NAMESPACE + "updateThumbnail", attachVo);
	}
	
	public String getThumbnail(int bno) {
		return sqlSession.selectOne(NAMESPACE + "getThumbnail", bno);
	}

}
