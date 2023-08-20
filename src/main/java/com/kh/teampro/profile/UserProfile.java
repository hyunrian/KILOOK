package com.kh.teampro.profile;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
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
public class UserProfile {
	
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
	
	
	// 이미지 저장
	@Transactional
	@ResponseBody
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String saveProfile(MultipartFile file, HttpSession session) {
		
		UserVo userVo = (UserVo)session.getAttribute(MyConstants.LOGIN);
		System.out.println("filename: " + file.getOriginalFilename());
		String filename = file.getOriginalFilename();
		
		if (FileUploadUtil.isImage(filename)) {
			try {
				
				// 이미지 파일 서버에 저장
				byte[] bytes = file.getBytes();
				String filePath = attachService.saveProfileFile(file, userVo.getUserid());
				
				// 현재 업로드한 이미지 프로필 처리(tbl_user에 저장)
				userVo.setUimg(filePath);
				userProfileService.updateProfile(userVo);
				
				return filePath;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return MyConstants.FAIL_MESSAGE;
	}
	
	// 이미지 보이기
	@ResponseBody
	@RequestMapping(value = "/display/{filePath}", method = RequestMethod.GET)
	public byte[] displayImage(@PathVariable String filePath) {
		System.out.println("filePath:" + filePath);
		return attachService.displayImage(filePath);
	}
	
	
	
	
}
