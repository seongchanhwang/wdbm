package com.springbook.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.springbook.mapper.FileMapper;
import com.springbook.service.FileService;

import lombok.extern.slf4j.Slf4j;

/* 파일 controller */
@Controller
@Slf4j
public class FileController {
	
	@Autowired FileService fileService;
	@Autowired FileMapper fileMapper;
	
	/** 멀티파일 업로드 */
	@PostMapping("/fileUpload")
	@ResponseBody
	public Map<String, Object> fileUpload(
			@RequestParam("article_file") List<MultipartFile> multipartFile
			, HttpServletRequest request) throws IOException {
		
		log.info("파일 컨트롤러 진입");
		return fileService.uploadFile(request, multipartFile);
	}
	
	/** 파일 다운로드 
	 * @throws UnsupportedEncodingException */
	@GetMapping("/fileDownload")
	@ResponseBody
	public void downloadFile(HttpServletResponse res, String fileIdx) throws UnsupportedEncodingException {
;
		//파일 조회
		Map<String, Object> fileInfo = fileMapper.getFileInfo(fileIdx); 
		System.out.println(fileInfo);
		//파일 경로
		Path saveFilePath = Paths.get(fileInfo.get("LOGI_PATH") + File.separator + fileInfo.get("LOGI_NM"));

		//해당 경로에 파일이 없으면 
		if(!saveFilePath.toFile().exists()) {
			throw new RuntimeException("file not found");
		}
		
		res.setHeader("Content-Disposition", "attachment; filename=\"" +  URLEncoder.encode((String) fileInfo.get("ORIG_NM"), "UTF-8") + "\";");
		res.setHeader("Content-Transfer-Encoding", "binary");
		res.setHeader("Content-Type", "application/download; utf-8");
		res.setHeader("Pragma", "no-cache;");
		res.setHeader("Expires", "-1;");
		
		FileInputStream fis = null;
		
		try {
			fis = new FileInputStream(saveFilePath.toFile());
			FileCopyUtils.copy(fis, res.getOutputStream());
			res.getOutputStream().flush();
		}
		catch (Exception e) {
			throw new RuntimeException(e);
		}
		finally {
			try {
				fis.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
	}
	

}