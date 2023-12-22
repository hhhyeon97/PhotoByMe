package com.example.controller;

import java.io.File;
import java.util.Calendar;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.service.PhotoService;
import com.example.vo.PhotoVO;
import com.oreilly.servlet.MultipartRequest;

@Controller
public class PhotoController {
	@Autowired
	private PhotoService photoService;

	// 사진 업로드 폼  
	  @GetMapping("/uploadForm")
	    public String showUploadForm() {
	        return "photo/uploadForm";
	    }
	
	// 사진 업로드  
		@PostMapping("/upload_ok")
		public String upload_ok(PhotoVO p,HttpServletRequest request) 
				throws Exception{
			String saveFolder = request.getRealPath("upload");//이진 파일 업로드 서버 경로
			int fileSize = 5*1024*1024;//이진파일 업로드 최대크기
			MultipartRequest multi = null; //이진파일 업로드 참조변수
			multi=new MultipartRequest(request,saveFolder,fileSize,"UTF-8");
			String ptitle = multi.getParameter("ptitle");
			File upFile = multi.getFile("purl");//첨부한 이진파일을 가져온다.

			if(upFile != null) {//첨부한 파일이 있는 경우 실행
				String fileName = upFile.getName();//첨부한 파일명을 구함
				Calendar c=Calendar.getInstance();
				int year = c.get(Calendar.YEAR);//년도값
				int month = c.get(Calendar.MONTH)+1;//월값, +1을 한 이유는 1월이 0으로 반환되기 때문이다.
				int date = c.get(Calendar.DATE);//일값
				String homedir = saveFolder+"/"+year+"-"+month+"-"+date;//오늘날짜 폴더 경로를 저장
				File path01=new File(homedir);
				if(!(path01.exists())) {//오늘날짜 폴더 경로가 없다면
					path01.mkdir();//오늘날짜 폴더 생성
				}
				Random r=new Random();//난수를 발생시키는 클래스
				int random = r.nextInt(100000000);//0이상 1억 미만 사이의 정수 숫자 난수를 발생
				int index=fileName.lastIndexOf(".");//.를 맨 오른쪽부터 찾아서 가장 먼저 나오는
				//.위치번호를 맨왼쪽부터 카운터 해서 구함. 첫문자는 0부터 시작
				String fileExtendsion=fileName.substring(index+1);//.이후부터 마지막 문자까지 구함.
				//즉 첨부파일 확장자만 구함
				String refileName="bbs"+year+month+date+random+"."+ fileExtendsion;
				//새로운 첨부파일명을 저장
				String fileDBName = "/"+year+"-"+month+"-"+date+"/"+refileName;
				//데이터베이스에 저장될 레코드 값
				upFile.renameTo(new File(homedir+"/"+refileName));
				//새롭게 생성된 폴더에 변경된 파일명으로 실제 업로드

				p.setPurl(fileDBName);//데이터 베이스에 저장될 레코드값
			}else {//첨부 파일이 없는경우
				String fileDBName = "";
				p.setPurl(fileDBName);
			}//if else
			p.setPtitle(ptitle);

			this.photoService.insertPhoto(p);//자료실 저장

			return "redirect:/";
		}//upload_ok()
	 
	   
}
