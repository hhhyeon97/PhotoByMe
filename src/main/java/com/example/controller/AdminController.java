package com.example.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.pwdconv.PwdChange;
import com.example.service.AdminService;
import com.example.vo.AdminVO;
import com.example.vo.MemberVO;
import com.example.vo.PageVO;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;

	//관리자 로그인 페이지
	@GetMapping("/admin_login")
	public ModelAndView admin_login() {
		return new ModelAndView("admin/admin_login");
	}//admin_login()

	//관리자 정보저장 + 관리자 비번 암호화 + 관리자 로그인 인증
	@PostMapping("/admin_login_ok")
	public String admin_login_ok(AdminVO ab,HttpServletResponse response,
			HttpServletRequest request, HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		ab.setApw(PwdChange.getPassWordToXEMD5String(ab.getApw())); //관리자 비번 암호화
		/*
		 * ab.setAno(1); ab.setAname("관리자"); //관리자 이름 저장
		 * this.adminService.insertAdmin(ab);//관리자 정보 저장
		 */		 
		AdminVO admin_info = this.adminService.adminLogin(ab.getAid()); //관리자 아이디로 로그인 인증

		if(admin_info == null) {
			out.println("<script>");
			out.println("alert('관리자 정보가 없습니다!');");
			out.println("history.back();");
			out.println("</script>");			
		}else {
			if(!admin_info.getApw().equals(ab.getApw())) {
				out.println("<script>");
				out.println("alert('관리자 비밀 번호가 다릅니다!');");
				out.println("history.go(-1);");
				out.println("</script>");		    	
			}else {
				session.setAttribute("aid",ab.getAid());//aid 관리자 세션 키이름에 관리자 아이디 저장
				session.setAttribute("aname",admin_info.getAname());//관리자 이름을 aname 세션 키이름에 저장
				return "redirect:/admin_index";//관리자 메인으로 이동
			}
		}		
		return null;
	}//admin_login_ok()

	//관리자 로그인 인증 후  메인 페이지로 이동
	@RequestMapping("/admin_index")
	public ModelAndView admin_index(HttpServletResponse response,HttpSession session)
			throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		String aid = (String)session.getAttribute("aid");//관리자 세션 아이디를 구함
		if(aid == null) {
			out.println("<script>");
			out.println("alert('관리자 아이디로 로그인 하세요!');");
			out.println("location='admin_login';");
			out.println("</script>");
		}else {
			ModelAndView am=new ModelAndView();
			am.setViewName("admin/main");//뷰페이지 경로 설정
			return am;
		}
		return null;
	}//admin_index()


	//관리자 로그아웃
	@RequestMapping("/admin_logout")
	public String admin_logout(HttpServletResponse response, HttpSession session)
			throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		session.invalidate();//세션 만료 => 로그아웃

		out.println("<script>");
		out.println("alert('관리자 로그아웃 되었습니다!');");
		out.println("location='admin_login';");
		out.println("</script>");		

		return null;
	}//admin_logout()
	
	
	//==================== 회원 관리 ============================
	
	//관리자 회원목록
		@RequestMapping("/member_list")
		public String member_list(Model listM,
				HttpServletResponse response,
				HttpServletRequest request,
				PageVO p)
						throws Exception{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			HttpSession session=request.getSession();
			String aid=(String)session.getAttribute("aid");
			//관리자 세션 아이디를 구함

			if(aid == null) {
				out.println("<script>");
				out.println("alert('다시 로그인 하세요!');");
				out.println("location='admin_index';");
				out.println("</script>");
			}else {
				int page=1;//쪽번호
				int limit=7;//한페이지에 보여지는 목록개수
				if(request.getParameter("page") != null) {
					page=Integer.parseInt(request.getParameter("page"));			
				}
				String find_name=request.getParameter("find_name");//검색어
				String find_field=request.getParameter("find_field");//검색 필드
				p.setFind_field(find_field);
				p.setFind_name("%"+find_name+"%");
				//%는 오라클 와일드 카드 문자로서 하나이상의 임의의 문자와 매핑 대응

				int listcount=this.adminService.getListCount(p);
				//전체 레코드 개수 또는 검색전후 레코드 개수
				//System.out.println("총 게시물수:"+listcount+"개");

				p.setStartrow((page-1)*7+1);//시작행번호
				p.setEndrow(p.getStartrow()+limit-1);//끝행번호

				List<MemberVO> blist=
						this.adminService.getMemberList(p);
				//검색 전후 회원목록

				//총페이지수
				int maxpage=(int)((double)listcount/limit+0.95);
				//현재 페이지에 보여질 시작페이지 수(1,11,21)
				int startpage=(((int)((double)page/10+0.9))-1)*10+1;
				//현재 페이지에 보여줄 마지막 페이지 수(10,20,30)
				int endpage=maxpage;
				if(endpage > startpage+10-1) endpage=startpage+10-1;

				listM.addAttribute("blist",blist);
				//blist 키이름에 값 저장
				listM.addAttribute("page",page);
				listM.addAttribute("startpage",startpage);
				listM.addAttribute("endpage",endpage);
				listM.addAttribute("maxpage",maxpage);
				listM.addAttribute("listcount",listcount);	
				listM.addAttribute("find_field",find_field);
				listM.addAttribute("find_name", find_name);

				return "admin/member_list";
				//뷰페이지 폴더경로와 파일명 지정	
			}
			return null;
		}//admin_member_list()

		
		//회원 상세정보+수정폼
		@RequestMapping("/member_info")
		public String member_info(
				@RequestParam("mid") String mid,
				@RequestParam("state") String state,
				HttpServletRequest request,
				HttpServletResponse response,
				Model am) throws Exception{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			HttpSession session=request.getSession();
			String aid=(String)session.getAttribute("aid");
			if(aid == null) {
				out.println("<script>");
				out.println("alert('다시 로그인 하세요!');");
				out.println("location='admin_index';");
				out.println("</script>");
			}else {
				int page=1;
				if(request.getParameter("page") != null) {
					page=Integer.parseInt(request.getParameter("page"));    		
				}
				
				MemberVO m=this.adminService.getMember(mid);//회원정보
				am.addAttribute("page",page);
				
				if(state.equals("info")) {//상세정보 보기
					return "admin/member_info";
				}else if(state.equals("edit")) {//수정폼
					return "admin/member_edit";
				}
			}
			return null;
		}//member_info()
	
}
