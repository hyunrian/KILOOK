package com.kh.teampro.user.login;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.teampro.user.info.UserVo;

@Repository
public class UserDao {
	private static final String NAMESPACE = "com.kh.teampro.UserMapper.";
	
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
	
	// 글자수 길이 확인
	public boolean checkInputLength(int gt, int lt, String input) {
        int length = input.length();
        return length >= gt && length <= lt;
    }
	

	// 특수문자 지정
	public boolean isSpecialCharacter(char c) {
	    String specialCharacters = "!@#$%_";
	    return specialCharacters.indexOf(c) != -1;
	}
	
	// 문자 유효성 확인 (영문, 숫자, 지정된 특수문자가 아니면 false return)
	public boolean checkValidCharacter(String input) {
	    for (char c : input.toCharArray()) {
	        if (!Character.isLetter(c) && !Character.isDigit(c) && !isSpecialCharacter(c)) {
	            return false;
	        }
	    }
	    return true;
	}
	
	// 통합 유효성 확인
	public boolean validCheckTotal(int gt, int lt, String type, String input) {
		boolean length = false;
		boolean checkValid = false;
		boolean checkRequired = false;
		if (type == "id") {
	    	length = checkInputLength(gt, lt, input);
	    	checkValid = checkValidCharacter(input);
	    	
	    	return length && checkValid;
	    } else if (type == "nickName") {
	    	// 한글 추가시 해당 항목 수정
	    	length = checkInputLength(gt, lt, input);
	    	checkValid = checkValidCharacter(input);
	    	
	    	return length && checkValid;
	    } else if (type == "pw") {
	    	length = checkInputLength(gt, lt, input);
	    	checkValid = checkValidCharacter(input);
	    	checkRequired = checkRequiredCharacters(input);
	    	
	    	return length && checkValid && checkRequired;
	    }
		
	    return false;
	}
	
	// 최소 필요문자 포함 (비밀번호용)
	public boolean checkRequiredCharacters(String input) {
        boolean containsAlphabet = false;
        boolean containsDigit = false;
        boolean containsSpecial = false;

        for (char c : input.toCharArray()) {
            if (Character.isLetter(c)) {
                containsAlphabet = true;
            } else if (Character.isDigit(c)) {
                containsDigit = true;
            } else if (isSpecialCharacter(c)) {
                containsSpecial = true;
            }
        }

        return containsAlphabet && containsDigit && containsSpecial;
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
