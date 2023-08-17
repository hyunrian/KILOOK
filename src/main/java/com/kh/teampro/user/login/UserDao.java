package com.kh.teampro.user.login;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.teampro.commons.MyConstants;
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
	
	// 영문 지정
	public boolean isEnglish(char c) {
	    return ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z');
	}
	
	// 한글 확인
	public boolean isKorean(char c) {
		// 한글 유니코드 범위: 가(U+AC00)에서 힣(U+D7A3)까지
		return ('\uAC00' <= c && c <= '\uD7A3');
    }
	
	// 문자 유효성 확인 (영문, 숫자, 지정된 특수문자가 아니면 false return)
	public boolean checkValidCharacter(String type, String input) {
		switch (type) {
		case MyConstants.ID:
			for (char c : input.toCharArray()) {
				if (!isEnglish(c) && !Character.isDigit(c)) {
					return false;
				}
			}
			break;
			
		case MyConstants.PW:
			for (char c : input.toCharArray()) {
				if (!isEnglish(c) && !Character.isDigit(c) && !isSpecialCharacter(c)) {
					return false;
				}
			}
			break;

		case MyConstants.NINCKNAME:
			for (char c : input.toCharArray()) {
				if (!isEnglish(c) && !isKorean(c) && !Character.isDigit(c) && !isSpecialCharacter(c)) {
					return false;
				}
			}
			break;
		}
	    return true;
	}
	
	// 통합 유효성 확인
	public boolean validCheckTotal(int gt, int lt, String type, String input) {
		boolean length = false;
		boolean checkValid = false;
		boolean checkRequired = false;
		if (type == MyConstants.ID) {
	    	length = checkInputLength(gt, lt, input);
	    	checkValid = checkValidCharacter(type, input);
	    	
	    	return length && checkValid;
	    } else if (type == MyConstants.NINCKNAME) {
	    	length = checkInputLength(gt, lt, input);
	    	checkValid = checkValidCharacter(type, input);
	    	
	    	return length && checkValid;
	    } else if (type == MyConstants.PW) {
	    	length = checkInputLength(gt, lt, input);
	    	checkValid = checkValidCharacter(type, input);
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
	public void createAccount(UserVo userVo) {
		sqlSession.insert(NAMESPACE+"createAccount", userVo);
	}
	
	// 회원탈퇴
	public void deleteAccount(String userid) {
		sqlSession.delete(NAMESPACE+"deleteAccount", userid);
	}
	
	// 아이디와 이메일이 일치하는 계정 확인 (result가 1이면 일치하는 아이디가 있음)
	public boolean findAccount(String userid, String uemail) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("uemail", uemail);
		int result = sqlSession.selectOne(NAMESPACE+"findAccount", map);
		if (result == 1) {
			return true;
		}
		return false;
	}
	
	// 임시 비밀번호 생성
	public void makeTempPW(String userid, String upw) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("upw", upw);
		sqlSession.selectOne(NAMESPACE+"makeTempPW", map);
	}
}
