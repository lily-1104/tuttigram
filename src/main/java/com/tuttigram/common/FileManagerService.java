package com.tuttigram.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {
	
	
	// 이미지 파일 저장 
	
	
	// 멤버 변수로 밖으로 빼기
	public static final String FILE_UPLOAD_PATH = "C:\\Users\\User\\Desktop\\개발\\Spring\\Project\\image file\\tuttigram\\upload/";  
				// 경로 맨 뒤에 슬래시 붙여주기 ★★
	
	private static Logger logger = LoggerFactory.getLogger(FileManagerService.class);
		// org.slf4j.Logger,  org.slf4j.LoggerFactory  두개 임포트
	
	
	// 파일을 저장하고 외부에서 접근 가능한 경로로 리턴하는 기능
	public static String saveFile(int userId, MultipartFile file) {	
		
		
		// 정상적인 file 인지 확인
		if(file == null) {
			logger.error("FileManagerService - saveFile : file 객체 null");
			return null;
		}
		
		
		
		String directoryName = userId + "_" + System.currentTimeMillis() + "/";
		
		
		
		// 디렉토리 생성
		String filePath = FILE_UPLOAD_PATH + directoryName;
		File directory = new File(filePath);	// java.io.File 로 임포트
					
		if (directory.mkdir() == false) {
				
			// 디렉토리 생성 실패했을 경우
			logger.error("FileManagerService - saveFile : 디렉토리 생성 실패" + filePath);	// filePath 붙이면 에러가 난 주소를 더 쉽게 알기 쉬움
			return null;
		}
		
		
		
		// 파일 저장
		try {
			byte[] bytes = file.getBytes();
			
			Path path = Paths.get(filePath + file.getOriginalFilename());
			Files.write(path, bytes);
			
		} catch (IOException e) {
			logger.error("FileManagerService - saveFile : 파일 저장 실패");
			e.printStackTrace();
			
			// 파일 처리 예외 상황
			return null;
		}
		
		
		
		// 외부에서 접근 가능한 경로 리턴 
		return "/images/" + directoryName + file.getOriginalFilename();
		
		
	}

}
