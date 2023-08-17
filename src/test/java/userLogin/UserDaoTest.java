package userLogin;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.teampro.commons.MyConstants;
import com.kh.teampro.user.info.UserVo;
import com.kh.teampro.user.login.LoginDto;
import com.kh.teampro.user.login.UserDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = 
	{"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class UserDaoTest {

	@Autowired
	private UserDao userDao;
	
	// 계정 하나 만들기 테스트
	@Test
	public void testCreate() throws Exception{
		UserVo userVo = new UserVo();
		userVo.setUserid("Hong");
		userVo.setUpw("aa1!");
		userVo.setUnickname("greate도적");
//		userVo.setUemail("hong@gmail.com");
		userDao.createAccount(userVo);
	}
	
	// 계정 10개 만들기 테스트
	@Test
	public void testCreate10() throws Exception{
		for (int i = 1 ; i <= 10 ; i++) {
			UserVo userVo = new UserVo();
			userVo.setUserid("Hong"+ i);
			userVo.setUpw("1234");
			userVo.setUnickname("No." + i + " 도적");
			userVo.setUemail("hong" +i+ "@gmail.com");
			userDao.createAccount(userVo);
			
			Thread.sleep(100);
		}
	}

	// 아이디 중복 테스트
	@Test
	public void testIdDubCkeck() {
		boolean result = userDao.dubCheckID("Hong");
		if (result == true) {
			System.out.println("사용 가능한 아이디");
		} else {
			System.out.println("아이디 중복됨");
		}
	}
	
	// 문자 유효성 테스트
	@Test
	public void testCheckValidCharacter() {
		boolean result = userDao.checkValidCharacter(MyConstants.ID, "aA1!");
		if (result == true) {
			System.out.println("사용 가능한 닉네임");
		} else {
			System.out.println("사용 불가능한 닉네임");
		}
	}
	
	// 닉네임 중복 테스트
	@Test
	public void testNicknameDubCkeck() {
		boolean result = userDao.dubCheckNickName("greate도적");
		if (result == true) {
			System.out.println("사용 가능한 닉네임");
		} else {
			System.out.println("닉네임 중복됨");
		}
	}
	// 로그인 테스트
	@Test
	public void testLogin () {
		LoginDto dto = new LoginDto();
		dto.setUserid("Hong");
		dto.setUpw("1234");
		UserVo uservo = userDao.login(dto);
		System.out.println("회원정보: " + uservo);
	}
	
	// 계정삭제 테스트
	@Test
	public void testDeleteAccount () {
		userDao.deleteAccount("Hong");
	}
	
	// 아이디와 이메일이 일치하는 계정 확인 (true면 해당 계정 존재함)
	@Test
	public void testfindAccount () {
		boolean result = userDao.findAccount("testuser", "eownschlrh@naver.com");
		if (result == true) {
			System.out.println("계정 확인됨");
		} else {
			System.out.println("일치하는 계정이 없습니다");
		}
	}

	// 임시 비밀번호 생성
	@Test
	public void makeTempPW () {
		userDao.makeTempPW("temp", "1234");
	}
	
}
