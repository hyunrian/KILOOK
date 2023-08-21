package com.kh.teampro.userboard;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.teampro.reply.user.UserReplyService;
import com.kh.teampro.reply.user.UserReplyVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = 
	{"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class UserReplyServiceTest {
	
	@Autowired
	private UserReplyService service;
	
	@Test
	public void insertTest() {
		for (int i = 0; i <= 23; i++) {
			UserReplyVo vo = new UserReplyVo();
			vo.setBno(61);
			vo.setReplyer("tester");
			vo.setReplytext("test-" + i);
			vo.setUserid("testuser");
			service.insertUserNewReply(vo);
		}
	}

}
