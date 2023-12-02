package com.example.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.pwdconv.PwdChange;
import com.example.service.MemberService;
import com.example.vo.MemberVO;

@Controller
@RequestMapping(value = "/member")
public class MemberController {

	//private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberservice;
	
	//로그인 페이지 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET() {
		//logger.info("로그인 페이지 진입");
	}
	
		//회원가입 페이지 이동
		@RequestMapping(value = "/join", method = RequestMethod.GET)
		public ModelAndView member_join() {
			//String[] email = {"직접입력","gmail.com","naver.com","daum.net"};
			ModelAndView jm=new ModelAndView();
			//jm.addObject("email",email);
			jm.setViewName("/member/join");//뷰페이지 경로 설정
			return jm;
		}//member_join()
		
		
		
		// 아이디 중복 검사
		@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
		@ResponseBody
		public String memberIdChk(String mid,HttpServletResponse response) throws Exception{
			//logger.info("memberIdChk() 진입");
			
			PrintWriter out = response.getWriter();
			MemberVO db_id = this.memberservice.idCheck(mid);
			int re = -1; // 중복 아이디가 없는 경우 반환값 
			if(db_id != null) { // 중복 아이디가 있는 경우
				re=1;
			}
			out.println(re); // 값 반환 기능 
			return null;
		} // memberIdChk()	
		
		// 회원가입(회원 데이터 저장) 
		@RequestMapping("join_ok")
		public ModelAndView join_ok(MemberVO m) {
			/*	MemberVO m 이라고 하면 join.jsp의 네임피라미터 이름과 
			 *  해당 vo클래스 변수명이 같으면 m에 입력한 회원 정보가 자동 저장 연결 될 수 있다.
			 */
			m.setMpw(PwdChange.getPassWordToXEMD5String(m.getMpw())); // 비번 암호화
			this.memberservice.memberJoin(m); // 회원 저장 
			return new ModelAndView("redirect:/member/login");
			// 생성자 인자값에 redirect:/가 들어가면 원하는 매핑주소로 이동시킴.
		}//join_ok()
		
		
		//회원가입
		
		/*
		@RequestMapping(value="/join_ok", method=RequestMethod.POST)
		public String join_ok(MemberVO member,Model model) throws Exception{
			//logger.info("join 진입");
			// 회원가입 서비스 실행
			memberservice.memberJoin(member);
			//logger.info("join Service 성공");
			 model.addAttribute("regSuccess", true);
			return "redirect:/member/login";
		}	
		
		*/
		

		

		
		/* 이메일 인증 */
	    @RequestMapping(value="/mailCheck", method=RequestMethod.GET)
	    @ResponseBody
	    public void mailCheckGET(String memail) throws Exception{
	        
	        /* 뷰(View)로부터 넘어온 데이터 확인 */
	        //logger.info("이메일 데이터 전송 확인");
	        //logger.info("인증번호 : " + memail);
	    }
			
	    /* 로그인 ok */
	    @PostMapping("/login_ok")
	    public String login_ok() {
	    	return "redirect:/";
	    }
	    
	    
	    //비번찾기 공지창
	    @RequestMapping("/pwd_find")
	    public ModelAndView pwd_find() {
	    	return new ModelAndView("member/pwd_find");//생성자 인자값으로 뷰페이지 경로 설정 =>
	    	// /WEB-INF/views/member/pwd_find.jsp
	    }//pwd_find()
	    
	    
	  //비번찾기 결과
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
	    
	    
	  //로그인 인증처리
	    @PostMapping("/member_login_ok")
	    public ModelAndView member_login_ok(String mid,String login_pwd,
	    		HttpServletResponse response,HttpSession session) throws Exception{
	    	response.setContentType("text/html;charset=UTF-8");
	    	PrintWriter out=response.getWriter();
	    	
	    	MemberVO m = this.memberservice.loginCheck(mid);
	    	
	    	if(m == null) {
	    		out.println("<script>");
	    		out.println("alert('가입 안된 회원입니다!');");
	    		out.println("history.back();");
	    		out.println("</script>");
	    	}else {
	    		if(!m.getMpw().equals(PwdChange.getPassWordToXEMD5String(login_pwd))) {
	    			out.println("<script>");
	    			out.println("alert('비번이 다릅니다!');");
	    			out.println("history.go(-1);");
	    			out.println("</script>");
	    		}else {
	    			session.setAttribute("id",mid);//세션 id 키이름에 아이디 저장
	    			return new ModelAndView("redirect:/member/login");
	    		}
	    	}
	    	return null;
	    }//member_login_ok()
	    
}
