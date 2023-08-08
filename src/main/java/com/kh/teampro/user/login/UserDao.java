package com.kh.teampro.user.login;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.teampro.user.info.UserVo;

@Repository
public class UserDao {
	private static final String NAMESPACE = "com.kh.loginTest.UserMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	// 로그인
	public UserVo login(LoginDto loginDto) {
		UserVo uservo = sqlSession.selectOne(NAMESPACE+"login",loginDto);
		return uservo;
	}
	
	// 아이디 중복 확인 (return true == 중복 아님)
	public boolean dubCheckID(String userid) {
		int result = sqlSession.selectOne(NAMESPACE+"dubCheckID",userid);
		if (result == 0) {
			return true;
		}
		return false;
	} 
	
	// 닉네임 중복 확인 (return true == 중복 아님)
	public boolean dubCheckNickName(String unickname) {
		int result = sqlSession.selectOne(NAMESPACE+"dubCheckNickName",unickname);
		if (result == 0) {
			return true;
		}
		return false;
	} 
	
	// 회원가입
	public void createAccount(UserVo uservo) {
		sqlSession.insert(NAMESPACE+"createAccount", uservo);
	}
	
	// 회원탈퇴
	public void deleteAccount(String userid) {
		sqlSession.delete(NAMESPACE+"deleteAccount", userid);
	}
}
