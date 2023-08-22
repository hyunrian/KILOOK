package com.kh.teampro.attach;


import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kh.teampro.util.FileUploadUtil;

@RestController
@RequestMapping("/attach")
public class AttachController {
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Autowired
	private AttachService attachService;
	
	// 이미지 서버에 저장
	@RequestMapping(value = "/save", method = RequestMethod.POST,
			produces = "text/plain; charset=utf-8")
	public String saveFile(MultipartFile file) {
		
		return attachService.saveFile(file);
	}
	
	// 업로드한 이미지 에디터에서 보이기
	@RequestMapping(value = "/displayImage", method = RequestMethod.GET)
	public byte[] displayImage(String filePath) {
		
		return attachService.displayImage(filePath);
	}
		
	// 썸네일 이미지 jsp로 전달
	@RequestMapping(value = "/displayThumbnail/{bno}", method = RequestMethod.GET)
	public byte[] displayThumbnail(@PathVariable int bno) {
		return attachService.displayImage(bno);
	}
	
	// 이미지 서버에서 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.DELETE)
	public String deleteFile(@RequestBody String filename) {
		
		return attachService.deleteFile(filename);
	}
	
	// 이미지 여부 확인
	@RequestMapping(value = "/isImage/{filename}", method = RequestMethod.GET)
	public boolean isImage(@PathVariable String filename) {
		
		return FileUploadUtil.isImage(filename);
	}
}
