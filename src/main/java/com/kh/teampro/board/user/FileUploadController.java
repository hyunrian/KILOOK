package com.kh.teampro.board.user;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kh.teampro.attach.AttachService;
import com.kh.teampro.commons.MyConstants;
import com.kh.teampro.util.FileUploadUtil;

@RestController
@RequestMapping("/upload")
public class FileUploadController {

	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Resource
	private UserBoardService userBoardService;
	
	@Resource
	private AttachService attachService;
	
	// 파일 업로드 처리
	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST,
			produces = "text/plain; charset=utf-8")
	public String uploadFile(MultipartFile file) {
		
		System.out.println("original filename: " + file.getOriginalFilename());
		try {
			byte[] bytes = file.getBytes();
			String saveFilename = FileUploadUtil.upload(
					bytes, uploadPath, file.getOriginalFilename());
			return saveFilename;
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	// 썸네일 이미지 jsp로 전달
	@RequestMapping(value = "/displayImage", method = RequestMethod.GET)
	public byte[] displayImage(String thumbnail) {
		
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(uploadPath + thumbnail);
			byte[] data = IOUtils.toByteArray(fis);
			return data;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException ie) {
			ie.printStackTrace();
		} finally {
			try {
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	// 첨부파일 삭제
	@Transactional
	@RequestMapping(value = "/deleteFile", method = RequestMethod.DELETE)
	public String deleteFile(@RequestBody String filename) {
		
		FileUploadUtil.deleteFile(uploadPath, filename);
		attachService.deleteFileData(filename);
		
		return MyConstants.SUCCESS_MESSAGE;
	}
	
}
