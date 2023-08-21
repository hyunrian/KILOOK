package com.kh.teampro.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

import com.kh.teampro.commons.MyConstants;
import com.kh.teampro.user.info.UserVo;


public class FileUploadUtil {

	// 사용자가 업로드한 파일을 지정된 경로에 저장
	public static String upload(byte[] bytes, 
								String uploadPath, 
								String originalFilename) {
		
		UUID uuid = UUID.randomUUID();
		String dirPath = makeDir(uploadPath);
		String filename = uuid + "_" + originalFilename;
		String saveFilename = uploadPath + "/" + dirPath + "/" + filename;
		File target = new File(saveFilename);
		try {
			FileCopyUtils.copy(bytes, target); // 해당 경로에 파일 복사
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		makeThumbnail(uploadPath, dirPath, filename);
		String filePath = saveFilename.substring(uploadPath.length());
		
		return filePath;
	}
	
	// 이미지 여부 확인
	public static boolean isImage(String filename) {
		String formatName = getFormatName(filename);
		if (formatName.equalsIgnoreCase("jpg") ||
				formatName.equalsIgnoreCase("gif") ||
				formatName.equalsIgnoreCase("png")) {
			return true;
		}
		return false;
	}
	
	// 파일 포맷 얻기
	public static String getFormatName(String filename) {
		int dotIndex = filename.lastIndexOf(".");
		return filename.substring(dotIndex + 1);
	}
	
	// 날짜별 폴더 만들어서 업로드 파일 저장
	private static String makeDir(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int date = cal.get(Calendar.DATE);
		String dirPath = "userboard/" + year + "/" + month + "/" + date;
		
		// C:/teampro/userboard/2023/08/14
		File f = new File(uploadPath + "/" + dirPath);
		if (!f.exists()) {
			f.mkdirs();
		}
		
		return dirPath;
	}
	
	// 썸네일 이미지 생성
	private static void makeThumbnail(
			String uploadPath, String dirPath, String filename) {
		
		String sourcePath = uploadPath + "/" + dirPath + "/" + filename;
		String thumbnailPath = uploadPath + "/" + dirPath + "/t_" + filename;
		
		try {
			// 원본 이미지 메모리에 로딩
			BufferedImage sourceImage = ImageIO.read(new File(sourcePath));
			
			// 저장할 썸네일(높이 100px에 맞춰 너비 자동 조절)
			BufferedImage destImage = 
					Scalr.resize(sourceImage, Scalr.Method.AUTOMATIC, 
									Scalr.Mode.FIT_TO_HEIGHT, 100);
			
			// 썸네일 이미지 저장
			File f = new File(thumbnailPath);
			String formatName = getFormatName(filename);
			ImageIO.write(destImage, formatName.toUpperCase(), f);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 파일 삭제(사용자가 이미지를 첨부한 후 게시글을 등록하지 않았을 경우)
	public static void deleteFile(String uploadPath, String filename) {
		
		// 썸네일 파일 삭제
		int slashIndex = filename.lastIndexOf("/");
		String front = filename.substring(0, slashIndex + 1);
		String back = filename.substring(slashIndex + 1);
		String thumbnail = front + "t_" + back;
		File tFile = new File(uploadPath + thumbnail);
		if (tFile.exists()) tFile.delete();
		
		// 원본파일 삭제
		File oFile = new File(uploadPath + filename);
		if (oFile.exists()) oFile.delete();
	}
	
	// 유저 프로필 사진 폴더 만들어서 파일 저장
	private static String makeProfileDir(String uploadPath, String userid) {
		String dirPath = "profile/" + userid;
		
		// C:/teampro/profile/testuser
		File f = new File(uploadPath + "/" + dirPath);
		if (!f.exists()) {
			f.mkdirs();
		}
		
		return dirPath;
	}
	
	// 사용자가 업로드한 프로필을 지정된 경로에 저장
	public static String uploadProfile(byte[] bytes, 
								String uploadPath, 
								String originalFilename, String userid) {
		
		UUID uuid = UUID.randomUUID();
		String dirPath = makeProfileDir(uploadPath, userid);
		String filename = uuid + "_" + originalFilename;
		String saveFilename = uploadPath + "/" + dirPath + "/" + filename;
		File target = new File(saveFilename);
		try {
			FileCopyUtils.copy(bytes, target); // 해당 경로에 파일 복사
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		makeThumbnail(uploadPath, dirPath, filename);
		String filePath = saveFilename.substring(uploadPath.length());
		
		return filePath;
	}
}
