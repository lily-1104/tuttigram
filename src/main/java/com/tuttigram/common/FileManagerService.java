package com.tuttigram.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {
	
	
	// 이미지 파일 저장 
	
	
	// 멤버 변수로 밖으로 빼기
	public static final String FILE_UPLOAD_PATH = "C:\\Users\\User\\Desktop\\개발\\Spring\\Project\\tuttigram\\upload/";  
				// 경로 맨 뒤에 슬래시 붙여주기 ★★
	
	
	
	// 파일을 저장하고 외부에서 접근 가능한 경로로 리턴하는 기능
	public static String saveFile(int userId, MultipartFile file) {	
		
		String directoryName = userId + "_" + System.currentTimeMillis() + "/";
		
		
		
		// 디렉토리 생성
		String filePath = FILE_UPLOAD_PATH + directoryName;
		File directory = new File(filePath);	// java.io.File 로 임포트
					
		if (directory.mkdir() == false) {
				
			// 디렉토리 생성 실패했을 경우
			return null;
		}
		
		
		
		// 파일 저장
		try {
			byte[] bytes = file.getBytes();
			
			Path path = Paths.get(filePath + file.getOriginalFilename());
			Files.write(path, bytes);
			
		} catch (IOException e) {
			e.printStackTrace();
			
			// 파일 처리 예외 상황
			return null;
		}
		
		
		
		// 외부에서 접근 가능한 경로 리턴 
		return "/images/" + directoryName + file.getOriginalFilename();
		
		
	}

}
