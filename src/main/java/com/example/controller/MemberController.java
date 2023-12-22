package com.example.controller;

import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.pwdconv.PwdChange;
import com.example.service.MemberService;
import com.example.vo.MemberVO;

@Controller
//@RequestMapping(value = "/member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private MemberService memberservice;
	//로그인 폼
	@GetMapping("/login")
	public ModelAndView login() {
		return new ModelAndView("/member/login");
	}

	//회원가입 폼
	@GetMapping("/join")
	public ModelAndView join() {
		return new ModelAndView("/member/join");
	}
	// 로딩페이지
	@GetMapping("/loading")
	public ModelAndView loading() {
		return new ModelAndView("/loading");
	}

	// 마이페이지 
	@GetMapping("/myPage")
	public ModelAndView myPage() {
		return new ModelAndView("/member/myPage");
	}

	//아이디 중복검색
	@PostMapping("/idCheck")
	public ModelAndView idCheck(String id,HttpServletResponse response)
			throws Exception{
		PrintWriter out=response.getWriter();
		MemberVO db_id = this.memberservice.idCheck(id);
		int re=-1; // 중복 아이디가 없는 경우 반환값 
		if(db_id != null) {// 중복 아이디가 있는 경우
			re=1;
		}
		out.println(re); // 값 반환
		return null;
	}

	//회원저장
	@PostMapping("/join_ok")
	public ModelAndView join_ok(MemberVO m) {
		m.setMpw(PwdChange.getPassWordToXEMD5String(m.getMpw()));//비번암호화
		this.memberservice.join_ok(m);
		return new ModelAndView("redirect:/login");
	}	

	// 로그인 인증 처리 
	@PostMapping("/login_ok")
	public ModelAndView login_ok(String mid,String mpw,
			HttpServletResponse response, HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		MemberVO m = this.memberservice.loginCheck(mid);
		if(m==null) {
			out.println("<script>");
			out.println("alert('회원이 아닙니다!');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			if(!m.getMpw().equals(PwdChange.getPassWordToXEMD5String(mpw))) {
				out.println("<script>");
				out.println("alert('비번이 다릅니다!');");
				out.println("history.go(-1);");
				out.println("</script>");
			}else {
				session.setAttribute("mid", mid); // 세션 mid 키이름에 아이디 저장
				System.out.println("로그인 성공 "+mid);
				return new ModelAndView("redirect:/");
			}
		}
		return null;
	}//login_ok()

	// 로그아웃
	@RequestMapping(value = "/logout", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView logout(HttpServletResponse response,
			HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		// 세션에 저장된 아이디를 가져와서 로그 출력
		String mid = (String) session.getAttribute("mid");
		System.out.println("Logout - User ID: " + mid);

		session.invalidate(); // 세션 만료 (로그아웃)

		out.println("<script>");
		out.println("alert('로그아웃 되었습니다!');");
		out.println("location='/';");
		out.println("</script>");

		return null;
	} // member_logout()


	//비밀번호 공지창
	@RequestMapping("/pwd_find")
	public ModelAndView pwd_find() {
		return new ModelAndView("member/pwd_find");//생성자 인자값으로 뷰페이지 경로 설정 =>
		// /WEB-INF/views/member/pwd_find.jsp
	}//pwd_find()


	//임시 비번 발급
	@RequestMapping("/pwd_find_ok")
	public ModelAndView pwd_find_ok(@RequestParam("pwd_id") String pwd_id,
			String pwd_name,HttpServletResponse response,MemberVO m) 
					throws Exception{
		/*  @RequestParam("pwd_id")는 request.getParameter("pwd_id")와 같은 역할을 한다.   	 * 
		 */
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		m.setMid(pwd_id); m.setMname(pwd_name);
		MemberVO pm = this.memberservice.pwdMember(m);
		/* 문제)아이디와 회원이름을 기준으로 회원정보를 오라클로 부터 검색하는 pwdMember()메서드를 작성해
		 * 본다. member.xml에 설정하는 유일아이디명은 p_find이다. 
		 */

		if(pm == null) {
			out.println("<script>");
			out.println("alert('회원으로 검색되지 않습니다!\\n 올바른 회원정보를 입력하세요!');");
			out.println("history.go(-1);");
			out.println("</script>");
		}else {
			//System.out.println("오라클로 부터 검색된 회원:"+pm.getMname());

			Random r=new Random();
			int pwd_random=r.nextInt(100000);//0이상 십만 미만 사이의 정수 숫자 난수가 발생
			String ran_pwd=Integer.toString(pwd_random);//정수숫자를 문자열로 변경
			m.setMpw(PwdChange.getPassWordToXEMD5String(ran_pwd));//임시 비번 암호화

			this.memberservice.updatePwd(m);//암호화 된 임시비번으로 수정

			ModelAndView fm=new ModelAndView("member/pwd_find_ok");
			fm.addObject("pwd_ran", ran_pwd);
			return fm;
		}
		return null;
	}//pwd_find_ok()

	// 회원 정보 수정 폼 
	// 방법 1
	/*@GetMapping("/member_edit")
	public ModelAndView member_edit(HttpServletResponse response, HttpSession session) {
	    response.setContentType("text/html;charset=UTF-8");
	    // 세션에서 "mid"를 가져오기
	    String mid = (String) session.getAttribute("mid");
	    
	    System.out.println("현재 세션 id "+mid);
	    // 세션의 유효성 확인
	    if (mid != null && session.getAttribute("mid") != null) {
	        // 세션이 유효하면 회원 정보 조회 및 페이지 이동
	        MemberVO em = this.memberservice.getMember(mid);
	        ModelAndView m = new ModelAndView("member/userEdit");
	        m.addObject("em", em);
	        return m;
	    }
	    return new ModelAndView("redirect:/login");
	}*/
	
	 //회원 정보 수정 폼(회원 정보 구하기)
	// 방법2
    @GetMapping("/user_edit")
    public ModelAndView user_edit(HttpServletResponse response,HttpSession session)
    throws Exception{
    	response.setContentType("text/html;charset=UTF-8");
    	String mid = (String)session.getAttribute("mid");//세션 아이디를 구함
    	 System.out.println("현재 세션 id "+mid);
    	if(isLogin(session,response)) {//==true가 생략됨
    		MemberVO em = this.memberservice.getMember(mid);
    		ModelAndView m = new ModelAndView("member/userEdit");
    		m.addObject("em", em);
    		return m;
    	}
    	return null;
    }//user_edit()
	
 // 회원 정보 수정 완료
    @RequestMapping("/user_edit_ok")
    public ModelAndView user_edit_ok(MemberVO m,HttpServletResponse response,
    		HttpSession session) throws Exception{
    	response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out=response.getWriter();
    	String mid=(String)session.getAttribute("mid");
    	if(isLogin(session, response)) {
    		m.setMid(mid);
    		m.setMpw(PwdChange.getPassWordToXEMD5String(m.getMpw()));//정식 비번 암호화
    		this.memberservice.updateMember(m);// 회원정보 수정
    		 // 세션 로그아웃 처리
            session.invalidate();
            out.println("<script>");
            out.println("alert('정보 수정했습니다!새로운 비밀번호로 다시 로그인해주세요.');");
            out.println("location='/login';"); // 로그인 페이지로 이동
            out.println("</script>");
    	}
    	return null;
    }//user_edit_ok()

    //회원 탈퇴 폼
    @RequestMapping("/user_del")
    public ModelAndView user_del(HttpServletResponse response,HttpSession session)
    throws Exception{
    	response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out=response.getWriter();
    	String mid=(String)session.getAttribute("mid");//세션 아이디 구하기
    	if(isLogin(session, response)) {
    		MemberVO dm = this.memberservice.getMember(mid);
    		ModelAndView m=new ModelAndView("member/userDel");
    		m.addObject("dm",dm);
    		return m;
    	}
    	return null;
    }//user_del()    

    //회원탈퇴 완료
    @RequestMapping("/user_del_ok")
    public ModelAndView user_del_ok(HttpServletResponse response,HttpSession session,
    		String del_pwd) throws Exception{
    	response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out=response.getWriter();
    	String mid=(String)session.getAttribute("mid");
    	if(isLogin(session, response)) {
    		del_pwd = PwdChange.getPassWordToXEMD5String(del_pwd);//비번 암호화
    		MemberVO db_pwd = this.memberservice.getMember(mid);
    		System.out.println("db_pwd : "+db_pwd);
    		if(!db_pwd.getMpw().equals(del_pwd)) {
    			out.println("<script>");
    			out.println("alert('비번이 다릅니다!');");
    			out.println("history.back();");
    			out.println("</script>");
    		}else {
    			MemberVO dm=new MemberVO();
    			dm.setMid(mid);
    			this.memberservice.delMember(dm);//회원탈퇴
    			session.invalidate();//세션만료=>로그아웃
    			out.println("<script>");
    			out.println("alert('회원 탈퇴 했습니다!');");
    			out.println("location='/';");
    			out.println("</script>");
    		}
    	}
    	return null;
    }//user_del_ok()


    
    //반복적인 코드 줄이기
    public static boolean isLogin(HttpSession session,HttpServletResponse response)
    throws Exception{
    	PrintWriter out = response.getWriter();
    	String mid=(String)session.getAttribute("mid");
    	if(mid == null) {
    		out.println("<script>");
    		out.println("alert('다시 로그인 하세요!');");
    		out.println("location='/login';");
    		out.println("</script>");
    		return false;
    	}
    	return true;
    }//isLogin()
    
    

    
}
