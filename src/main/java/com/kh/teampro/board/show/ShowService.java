package com.kh.teampro.board.show;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teampro.paging.CategoryPagingDto;


@Service
public class ShowService {

	@Autowired
	private ShowDao showDao;
	
	// 전시 전체 조회
	public List<ShowVo> getShowList(CategoryPagingDto pagingDto) throws Exception{
		List<ShowVo> list = showDao.getShowList();
		return list;
	}
	
	// 해당 전시 상세보기
	public List<ShowVo> getShowInfo(int bno) throws Exception{
		List<ShowVo> list = showDao.getShowInfo(bno);
		return list;
	}
	
	// 전시 추가
	public void insertShow(ShowVo showVo) throws Exception{
		showDao.insertShow(showVo);
	}

	// 페이징
	public int getShowCnt(CategoryPagingDto pagingDto) {
		int getShowCnt = showDao.getShowCnt(pagingDto);
		return getShowCnt;
	}
}
