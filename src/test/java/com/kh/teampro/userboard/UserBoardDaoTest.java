package com.kh.teampro.userboard;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.teampro.Like.board.LikeUserBoardVo;
import com.kh.teampro.board.user.UserBoardDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = 
	{"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class UserBoardDaoTest {

	@Autowired
	private UserBoardDao dao;
	
	@Test
	public void getList() {
		System.out.println(dao.getUserArticleList());
	}
	
	@Test
	public void select() {
		System.out.println(dao.getUserArticleDetail(1));
	}
}
