package com.kh.teampro.attach;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.teampro.commons.MyConstants;
import com.kh.teampro.util.FileUploadUtil;

@Service
public class AttachService {
	
	private final String BOARD = "board";
	private final String PROFILE = "profile";
	private final String BOARD_DEFAULT_PATH = "/userboard/default/default.png";
	private final String PROFILE_DEFAULT_PATH = "/profile/default/default.png";
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Autowired
	private AttachDao attachDao;
	
	// 이미지 서버에 저장
	public String saveFile(MultipartFile file) {
		
		String filename = file.getOriginalFilename();
		
		if (FileUploadUtil.isImage(filename)) { // 이미지일 때만 처리
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
		return getImage(filePath, BOARD);
	}

	// 유저게시판 썸네일 이미지 jsp로 전달
	public byte[] displayImage(int bno) {
		String thumbnail = attachDao.getThumbnail(bno);
//		if (thumbnail != null) {
			return getImage(thumbnail, BOARD);
//		} 
		// 업로드한 이미지가 없는 경우 디폴트 이미지로 썸네일 처리
//		return getImage("/userboard/default/default.png"); 
	}
	
	// 
	
	// 이미지 얻는 공통 메서드
	public byte[] getImage(String filePath, String type) {
		
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(uploadPath + filePath);
			return  IOUtils.toByteArray(fis); // 설정된 path의 이미지 리턴
		} catch (FileNotFoundException e) {
			String path = "";
			if (type.equals(BOARD)) path = BOARD_DEFAULT_PATH;
			else if (type.equals(PROFILE)) {path = PROFILE_DEFAULT_PATH;
			System.out.println("파일을 찾을 수 없어 디폴트 이미지로 출력");}
			
			try {
				fis = new FileInputStream(uploadPath + path);
				return IOUtils.toByteArray(fis); // 디폴트 이미지 리턴
			} catch (Exception e1) {
				e1.printStackTrace();
			}
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
	
	// 첨부파일 서버에서 삭제
	public String deleteFile(String filename) {

		FileUploadUtil.deleteFile(uploadPath, filename);
		return MyConstants.SUCCESS_MESSAGE;
	}
	
	// 썸네일 db에 저장
	public String insertFileData(AttachVo attachVo) {
		
		attachDao.insertFileData(attachVo);
		return MyConstants.SUCCESS_MESSAGE;
	}
	
	// 게시글의 썸네일 루트 얻기
	public String getThumbnail(int bno) {
		return attachDao.getThumbnail(bno);
	}
	
	// 썸네일 DB에서 삭제
	public void deleteThumbnail(int bno) {
		attachDao.deleteFileData(bno);
	}
	
	// 썸네일 수정
	public void updateThumbnail(AttachVo attachVo) {
		attachDao.updateThumbnail(attachVo);
	}
	
	// 유저 프로필 서버에 저장
	public String saveProfileFile(MultipartFile file, String userid) {
		String filename = file.getOriginalFilename();
		if (FileUploadUtil.isImage(filename)) { // 이미지일 때만 처리
			try {
				byte[] bytes = file.getBytes();
				String filePath = FileUploadUtil.uploadProfile(
										bytes, uploadPath, filename, userid);
				return filePath;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return MyConstants.FAIL_MESSAGE;
	}
	
	// 유저 프로필 jsp로 전달
	public byte[] displayProfile(String filePath, String userid) {
		System.out.println("attachService, filePath:" + filePath);
		if (filePath != null) {
			String[] str = filePath.split("/");
			filePath = "/" + str[1] + "/" + str[2] + "/t_" + str[3];
			return getImage(filePath, PROFILE);
		} else {
			return getImage(filePath, PROFILE);
		} 
	}
}
