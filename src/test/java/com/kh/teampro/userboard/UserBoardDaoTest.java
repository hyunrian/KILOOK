package com.kh.teampro.userboard;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.teampro.Like.board.LikeUserBoardDao;
import com.kh.teampro.board.user.UserBoardDao;
import com.kh.teampro.board.user.UserBoardVo;
import com.kh.teampro.paging.PagingDto;
import com.kh.teampro.reply.user.UserReplyDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = 
	{"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class UserBoardDaoTest {

	@Autowired
	private UserBoardDao dao;
	
	@Autowired
	private LikeUserBoardDao likeDao;
	
	@Autowired
	private UserReplyDao replyDao;
	
	@Test
	public void getList() {
//		System.out.println(dao.getUserArticleList());
	}
	
	@Test
	public void select() {
		System.out.println(dao.getUserArticleDetail(1));
	}
	
	@Test
	public void insert() {
		// #{bno}, #{title}, #{content}, #{writer}, #{userid}
		UserBoardVo vo = new UserBoardVo();
		for (int i = 0; i < 200; i++) {
			int bno = dao.getNextSeq();
			vo.setBno(bno);
			vo.setTitle("title-" + i);
			vo.setContent("content-" + i);
			vo.setWriter("star");
			vo.setUserid("user2");
			dao.createArticle(vo);
			try {
				Thread.sleep(80);
			} catch (InterruptedException e) {
			}
		}
	}
	
	@Test
	public void testPagingDto() {
//		int totalCount = dao.getTotalCount();
//		PagingDto dto = new PagingDto();
//		dto.setNowPage(11);
//		dto.setTotalCount(totalCount);
//		PagingDto pagingDto = new PagingDto(dto.getNowPage(), totalCount, 
//				dto.getOption(), dto.getKeyword());
//		System.out.println("dto!!!: " + pagingDto);
	}
	
	@Test
	public void updateAllData() {
		PagingDto dto = new PagingDto();
		int totalCount = dao.getTotalCount(dto);
		dto.setTotalCount(totalCount);
		List<UserBoardVo> list = dao.getUserArticleList(dto);
		for (UserBoardVo vo : list) {
			vo.setLikecnt(likeDao.countLikes(vo.getBno()));
			vo.setReplycnt(replyDao.getReplycnt(vo.getBno()));
		}
	}
}
