package com.kh.teampro.profile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	// 파일 저장 경로: C:/teampro/profile/유저아이디_이미지이름
	// 기본사진 경로: /resources/images/userProfile/default_profile.png 이미지
	
	// -> (D:../../teampro/src/main/webapp)/resources/images/userProfile/default_profile.png 
	
	// 이미지 저장
	@Transactional
	@ResponseBody
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String saveProfile(MultipartFile file, HttpSession session) {
		UserVo userVo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		String filename = file.getOriginalFilename();
		
		if (FileUploadUtil.isImage(filename)) {
			// 이미지 파일 서버에 저장
			String filePath = attachService.saveProfileFile(file, userVo.getUserid());
			System.out.println("profileController, filePath:" + filePath);
			return filePath;
		}
		return MyConstants.FAIL_MESSAGE;
	}
	
	// 수정 완료 버튼 클릭 시 tbl_user 테이블에 uimg 저장
	@ResponseBody
	@RequestMapping(value = "/uimg", method = RequestMethod.POST)
	public String saveUimg(String filePath, HttpSession session) {

		// 세션으로 userVo 가져오기
		UserVo userVo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		userVo.setUimg(filePath);
		
		// userVo로 DB업데이트
		userProfileService.updateProfile(userVo);
		
		// 기존 세션 제거 후 업데이트 된 세션 새로 입력해주기
		session.removeAttribute(MyConstants.LOGIN);
		session.setAttribute(MyConstants.LOGIN, userVo);
		
		return MyConstants.SUCCESS_MESSAGE;
	}
	
	// 프로필 변경했을 때 이미지 보이기
	@ResponseBody
	@RequestMapping(value = "/displayUpdate", method = RequestMethod.GET)
	public byte[] displayImage(String filePath, HttpSession session) {
		// 세션으로 userVo 가져오기
		UserVo userVo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		
		byte[] profile = attachService.displayProfile(filePath, userVo.getUserid());
		return profile;
	}
	
	// 기존에 설정되어있는 프로필 보이기 
	@ResponseBody
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public byte[] displayImageWithId(String userid, HttpSession session) {
		
		// 세션으로 userVo 가져오기
		UserVo userVo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		
		byte[] profile;
		
		if (userid == null) {
			String filePath = userProfileService.getUimg(userVo.getUserid());
			profile = attachService.displayProfile(filePath, userVo.getUserid());
		} else {
			String filePath = userProfileService.getUimg(userid);
			profile = attachService.displayProfile(filePath, userid);
		}
		
		return profile;
	}
	
}
