package com.kh.teampro.attach;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.teampro.board.user.UserBoardService;
import com.kh.teampro.commons.MyConstants;
import com.kh.teampro.util.FileUploadUtil;

@Service
public class AttachService {
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Autowired
	private AttachDao attachDao;
	
	@Autowired
	private UserBoardService userBoardService;

	// 이미지 서버에 저장
	public String saveFile(MultipartFile file) {
		
		String filename = file.getOriginalFilename();
		
		if (FileUploadUtil.isImage(filename)) {
			try {
				byte[] bytes = file.getBytes();
				String filePath = FileUploadUtil.upload(bytes, uploadPath, filename);
				
				return filePath;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return MyConstants.FAIL_MESSAGE;
	}

	// 업로드한 이미지 에디터에서 보이기
	public byte[] displayImage(String filePath) {
		System.out.println("filePath:" + filePath);
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(uploadPath + filePath);
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

	// 썸네일 이미지 jsp로 전달
//	public byte[] displayThumbnail(int bno) {
	public Object displayThumbnail(int bno) {
		String thumbnail = attachDao.getThumbnail(bno);
		if (thumbnail != null) {
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
		} 
		return "/resources/images/image_1.jpg";
	}

	// 첨부파일 삭제
	public String deleteFile(String filename) {

		FileUploadUtil.deleteFile(uploadPath, filename);
		return MyConstants.SUCCESS_MESSAGE;
	}
	
	// 썸네일 db에 저장
	public String insertFileData(AttachVo attachVo) {
		
		attachDao.insertFileData(attachVo);
		return MyConstants.SUCCESS_MESSAGE;
	}
	
	public String getThumbnail(int bno) {
		return attachDao.getThumbnail(bno);
	}

}
