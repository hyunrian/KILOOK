package com.kh.teampro.board.show;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.teampro.board.restaurant.CategoryPagingDto;

@Repository
public class ShowDao {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.kh.teampro.ShowMapper.";
	
	// 전시 전체 조회
	public List<ShowVo> getShowList() throws Exception{
		List<ShowVo> list = sqlSession.selectList(NAMESPACE + "getShowList");
		return list;
	}
	
	// 해당 전시 상세보기
	public List<ShowVo> getShowInfo(int bno) throws Exception{
		List<ShowVo> list = sqlSession.selectOne(NAMESPACE + "getShowInfo", bno);
		return list;
	}

	// 전시 추가
	public void insertShow(ShowVo showVo) throws Exception{
		sqlSession.insert(NAMESPACE + "insertShow", showVo);
	}

	// 페이징
	public int getShowCnt(CategoryPagingDto pagingDto) {
		int getShowCnt = sqlSession.selectOne(NAMESPACE + "getShowCnt", pagingDto);
		return getShowCnt;
	}
}
