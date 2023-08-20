package com.kh.teampro.profile;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.teampro.attach.AttachService;
import com.kh.teampro.commons.MyConstants;
import com.kh.teampro.user.info.UserVo;
import com.kh.teampro.util.FileUploadUtil;

@Controller
@RequestMapping("/profile")
public class UserProfileController {
	
	@Resource
	private String uploadPath;
	
	@Autowired
	private AttachService attachService;
	
	@Autowired
	private UserProfileService userProfileService; 
	
	
	// 페이지 처리
	@RequestMapping(value = "/page", method = RequestMethod.GET)
	public String goToPage() {
		return "profile/page";
	}
	
	// 파일 저장 경로: C:/teampro/profile/유저아이디/이미지이름
	// 기본사진 경로: C:/teampro/profile/default/이미지
	// C:/teampro/profile까지는 미리 생성해야 함
	// default 이미지도 폴더 만들어서 미리 추가해야 함
	
	// 이미지 저장
	@Transactional
	@ResponseBody
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String saveProfile(MultipartFile file, HttpSession session) {
		
		// 임의로 세션값 설정(세션에 들어있는 userVo 사용하면 됨)
		UserVo userVo = new UserVo();
		userVo.setUserid("testuser");
		session.setAttribute(MyConstants.LOGIN, userVo);
		
		userVo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		String filename = file.getOriginalFilename();
		
		if (FileUploadUtil.isImage(filename)) {
			try {
				// 이미지 파일 서버에 저장
				byte[] bytes = file.getBytes();
				String filePath = attachService.saveProfileFile(file, userVo.getUserid());
				return filePath;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return MyConstants.FAIL_MESSAGE;
	}
	
	// 수정 완료 버튼 클릭 시 tbl_user 테이블에 uimg 저장
	@ResponseBody
	@RequestMapping(value = "/uimg", method = RequestMethod.POST)
	public String saveUimg(String filePath, HttpSession session) {

		// 임의로 세션값 설정(세션에 들어있는 userVo 사용하면 됨)
		UserVo userVo = new UserVo();
		userVo.setUserid("testuser");
		session.setAttribute(MyConstants.LOGIN, userVo);
		
		userVo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		userVo.setUimg(filePath);
		
		userProfileService.updateProfile(userVo);
		
		return MyConstants.SUCCESS_MESSAGE;
	}
	
	// 이미지 보이기
	@ResponseBody
	@RequestMapping(value = "/displayUpdate", method = RequestMethod.GET)
	public byte[] displayImage(String filePath, HttpSession session) {
		
		// 임의로 세션값 설정(세션에 들어있는 userVo 사용하면 됨)
		UserVo userVo = new UserVo();
		userVo.setUserid("testuser");
		session.setAttribute(MyConstants.LOGIN, userVo);
		
		userVo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		byte[] profile = attachService.displayProfile(filePath, userVo.getUserid());
		return profile;
	}
	
	@ResponseBody
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public byte[] displayImage(HttpSession session) {
		
		// 임의로 세션값 설정(세션에 들어있는 userVo 사용하면 됨)
		UserVo userVo = new UserVo();
		userVo.setUserid("testuser");
		session.setAttribute(MyConstants.LOGIN, userVo);
		
		userVo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		
		String filePath = userProfileService.getUimg(userVo.getUserid());
		System.out.println("path:" + filePath);
		byte[] profile = attachService.displayProfile(filePath, userVo.getUserid());
		
		return profile;
	}
	
	
	
	
}
