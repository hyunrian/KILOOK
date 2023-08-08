package com.kh.teampro.like;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.teampro.Like.board.LikeUserBoardDao;
import com.kh.teampro.Like.board.LikeUserBoardVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = 
	{"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ReplyDaoTest {

	@Autowired
	private LikeUserBoardDao dao;
	
	@Test
	public void addLike() {
		LikeUserBoardVo vo = new LikeUserBoardVo("tester", 2);
		dao.addLike(vo);
	}
	
	@Test
	public void cancelLike() {
		LikeUserBoardVo vo = new LikeUserBoardVo("tester", 2);
		dao.cancelLike(vo);
	}
}
