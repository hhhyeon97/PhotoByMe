package com.example.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.service.PhotoService;
import com.example.vo.PhotoVO;

@Controller
public class PhotoController {
	
	private final ResourceLoader resourceLoader;

    public PhotoController(ResourceLoader resourceLoader) {
        this.resourceLoader = resourceLoader;
    }
	
	
	@Value("${file.upload.directory}")
	private String uploadDirectory;

	@Autowired
	private PhotoService photoService;
	
	// 테스트 매핑
	 @GetMapping("/test")
	    public String main(Model model) {
	        List<PhotoVO> photoList = photoService.getAllPhotos();
	        model.addAttribute("photoList", photoList);
	        return "test";
	    }
	// 사진 업로드 폼  
	  @GetMapping("/uploadForm")
	    public String showUploadForm() {
	        return "photo/uploadForm";
	    }
	  // 업로드 
	  @PostMapping("/upload")
	    public String handleUpload(@RequestParam("file") MultipartFile file,
	                               @RequestParam("title") String title,
	                               Model model) {
	        if (!file.isEmpty()) {
	            try {
	                byte[] bytes = file.getBytes();

	                // 실제 파일 시스템 경로 가져오기
	                Path uploadPath = Paths.get(resourceLoader.getResource(uploadDirectory).getURI());
	                Path filePath = uploadPath.resolve(file.getOriginalFilename());

	                // 파일 저장
	                Files.write(filePath, bytes);

	                // Photo 엔터티 생성
	                PhotoVO photo = new PhotoVO();
	                photo.setPurl("/upload/" + file.getOriginalFilename());
	                photo.setPtitle(title);
	                photoService.uploadPhoto(photo);

	                model.addAttribute("message", "Upload success!");
	            } catch (IOException e) {
	                model.addAttribute("message", "Upload failed: " + e.getMessage());
	            }
	        } else {
	            model.addAttribute("message", "File is empty!");
	        }
	        return "uploadForm";
	    }
	 

}
