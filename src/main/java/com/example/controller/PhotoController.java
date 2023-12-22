package com.example.controller;



import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.service.PhotoService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/file")
public class PhotoController {
    @Autowired
    private PhotoService photoService;

    @Value("${file.dir}")
    private String fileDir;

    @GetMapping("/upload")
    public String newFile() {
        return "photo/uploadForm";
    }

    @PostMapping("/upload")
    public String saveFile(@RequestParam String itemName,
                           @RequestParam MultipartFile file, HttpServletRequest request) {
        try {
            log.info("request={}", request);
            log.info("itemName={}", itemName);
            log.info("multipartFile={}", file);

            if (!file.isEmpty()) {
                String fullPath = fileDir + File.separator + file.getOriginalFilename();
                log.info("파일 저장 fullPath={}", fullPath);
                file.transferTo(new File(fullPath));
                // 파일 업로드가 성공했을 때의 로직 추가
                // 예를 들어, 성공 화면을 보여주거나 다른 작업을 수행할 수 있음
                return "/";
            } else {
                // 업로드된 파일이 없는 경우의 처리 로직 추가
                return "/upload";
            }
        } catch (IOException e) {
            // 파일 업로드 중 예외 발생 시의 처리 로직 추가
            log.error("파일 업로드 중 예외 발생", e);
            return "photo/error";
        }
    }
}
