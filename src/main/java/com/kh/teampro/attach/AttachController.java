package com.kh.teampro.attach;

import java.io.IOException;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kh.teampro.commons.MyConstants;
import com.kh.teampro.util.FileUploadUtil;

@RestController
@RequestMapping("/attach")
public class AttachController {
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Autowired
	private AttachService attachService;
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST,
			produces = "text/plain; charset=utf-8")
	public String insertFileData(MultipartFile file) {
		
		System.out.println("originalFilename:" + file.getOriginalFilename());
		try {
			byte[] bytes = file.getBytes();
			String saveFilename = FileUploadUtil.upload(
					bytes, uploadPath, file.getOriginalFilename());
			return saveFilename; // original name으로 반환하고 있음
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
//		System.out.println("fullname" + fullname);
//		System.out.println("bno" + bno);
		
		return MyConstants.SUCCESS_MESSAGE;
	}
}
