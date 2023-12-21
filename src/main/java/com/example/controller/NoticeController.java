package com.example.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.service.AdminService;
import com.example.service.NoticeService;
import com.example.vo.NoticeVO;
import com.example.vo.PageVO;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private AdminService adminService;
	
	// ====================== 관리자 공지사항  ========================
	
	//관리자 공지 작성
		@RequestMapping("/notice_write")
		public ModelAndView notice_write(HttpServletResponse response,
				HttpSession session,HttpServletRequest request) throws Exception{
			response.setContentType("text/html;charset=UTF-8");

			if(isAdminLogin(session, response)){
				int page=1;
				if(request.getParameter("page") != null) {
					page=Integer.parseInt(request.getParameter("page"));
				}
				ModelAndView wm=new ModelAndView();
				wm.addObject("page",page);//페이징 목록에서 책갈피 기능을 구현하기 위한것
				wm.setViewName("admin/notice_write");
				return wm;
			}
			return null;
		}//notice_write()
	
		//관리자 공지 저장
		@RequestMapping("/notice_write_ok")
		public ModelAndView notice_write_ok(NoticeVO n,HttpSession session,
				HttpServletResponse response) throws Exception{
			  //네임 피라미터 이름과 빈클래스 변수명이 같으면 noticeVO n에서 n객체에 이름,공지제목,비번,공지내용까지 
			 //저장되어 있다.
			response.setContentType("text/html;charset=UTF-8");
			
			if(isAdminLogin(session, response)){
			this.noticeService.insertNotice(n);//공지 저장
			return new ModelAndView("redirect:/notice_list");
			}
			return null;
		}//notice_write_ok()	
		
		
		//관리자 공지목록
		@RequestMapping("/notice_list")
		public ModelAndView notice_list(@ModelAttribute PageVO p,HttpServletRequest request,
				HttpSession session,HttpServletResponse response) throws Exception{
			response.setContentType("text/html;charset=UTF-8");

			if(isAdminLogin(session, response)) {//관리자로 로그인 된 경우
			int page=1;//쪽번호
			int limit=7;//한페이지에 보여지는 목록개수
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));			
			}

			String find_name=request.getParameter("find_name");//검색어
			String find_field=request.getParameter("find_field");//검색
			//필드
			p.setFind_field(find_field);
			p.setFind_name("%"+find_name+"%");
			//%는 오라클 와일드 카드 문자로서 하나이상의 임의의 문자와 매핑 대응

			int listcount=this.noticeService.getListCount(p);
			//전체 레코드 개수 또는 검색전후 레코드 개수

			System.out.println("총 게시물수:"+listcount+"개");

			p.setStartrow((page-1)*7+1);//시작행번호
			p.setEndrow(p.getStartrow()+limit-1);//끝행번호

			List<NoticeVO> nlist=this.noticeService.getNoticeList(p);
			//관리자 공지 검색 전후 목록

			System.out.println("\n===>공지목록 개수: "+nlist.size());

			//총페이지수
			int maxpage=(int)((double)listcount/limit+0.95);
			//현재 페이지에 보여질 시작페이지 수(1,11,21)
			int startpage=(((int)((double)page/10+0.9))-1)*10+1;
			//현재 페이지에 보여줄 마지막 페이지 수(10,20,30)
			int endpage=maxpage;
			if(endpage > startpage+10-1) endpage=startpage+10-1;

			ModelAndView listM=new ModelAndView("admin/notice_list");

			listM.addObject("nlist",nlist);
			//nlist 키이름에 값 저장
			listM.addObject("page",page);
			listM.addObject("startpage",startpage);
			listM.addObject("endpage",endpage);
			listM.addObject("maxpage",maxpage);
			listM.addObject("listcount",listcount);	
			listM.addObject("find_field",find_field);
			listM.addObject("find_name", find_name);

			return listM;
			}
			return null;
		}//notice_list()
	
		//공지 수정과 상세정보 보기
		@RequestMapping("/notice_cont")
		public ModelAndView notice_cont(HttpServletRequest request,
				HttpServletResponse response,HttpSession session,
				@RequestParam("no") int no,
				@RequestParam("state") String state)
						throws Exception {

			response.setContentType("text/html;charset=UTF-8");
			if(isAdminLogin(session, response)){
			int page=1;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));		

			}
			NoticeVO n=this.noticeService.getNoticeCont(no);
			String n_cont=n.getNcont().replace("\n","<br/>");
			//textarea영역에서 엔터키 친 부분을 다음줄로 줄바꿈

			ModelAndView cm=new ModelAndView();
			cm.addObject("n",n);
			cm.addObject("n_cont",n_cont);
			cm.addObject("page",page);

			if(state.equals("cont")) {//내용보기
				cm.setViewName("admin/notice_cont");
			}else if(state.equals("edit")) {//수정폼
				cm.setViewName("admin/notice_edit");
			}
			return cm;
			}
			return null;
		}//notice_cont()	
		
		//공지 수정완료
		@RequestMapping("/notice_edit_ok")
		public ModelAndView notice_edit_ok(NoticeVO n,
				HttpServletRequest request,
				HttpServletResponse response,HttpSession session)
						throws Exception{
			response.setContentType("text/html;charset=UTF-8");
			if(isAdminLogin(session, response)) {
			int page=1;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));
			}
			this.noticeService.editNotice(n);//공지 수정
			return new ModelAndView("redirect:/notice_list?page="+page);
			}
			return null;
		}//notice_edit_ok()	
	
		//공지 삭제
		@RequestMapping("/notice_del")
		public String notice_del(int no,HttpServletResponse response,
				HttpSession session,HttpServletRequest request)throws Exception{
			response.setContentType("text/html;charset=UTF-8");		
			if(isAdminLogin(session, response)) {
			int page=1;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));		
			}
			this.noticeService.delNotice(no);//공지 삭제
			return "redirect:/notice_list?page="+page;
			}
			return null;
		}//notice_del()		
		
		// ====================== 사용자 공지사항 ========================
		
		//메인화면 최신 공지 목록 5개 보기(사용자 공지사항)
		@RequestMapping("/user_notice_list")
		public String user_notice_list(Model gm) {
			List<NoticeVO> nlist=this.noticeService.getUserNoticeList();
			gm.addAttribute("nlist",nlist);
			return "notice/user_notice_list";
		}//user_notice_list()
		
		//공지내용보기+조회수 증가
		@RequestMapping("/user_notice_cont")
		public ModelAndView user_notice_cont(
				@RequestParam("nno") int nno)
		{
			NoticeVO n=this.noticeService.getUserNoticeCont(nno);
			String ncont=n.getNcont().replace("\n","<br/>");

			ModelAndView gm=new ModelAndView("notice/user_notice_cont");
			gm.addObject("n",n);
			gm.addObject("ncont",ncont);
			return gm;
		}//user_notice_cont()


		
		 // ========= 관리자 로그아웃되었을 때 반복적인 코드를 안하기 위한 부분 코드 추가 ==========
	    public static boolean isAdminLogin(HttpSession session,HttpServletResponse response)
	    throws Exception{
	    	PrintWriter out = response.getWriter();
	    	String aid=(String)session.getAttribute("aid");
	    	if(aid == null) {
	    		out.println("<script>");
	    		out.println("alert('다시 로그인 하세요!');");
	    		out.println("location='/admin_login';");
	    		out.println("</script>");
	    		return false;
	    	}
	    	return true;
	    }//isAdminLogin()	
		
}
