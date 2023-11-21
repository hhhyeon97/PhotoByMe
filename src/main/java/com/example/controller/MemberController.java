package com.example.controller;

import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	//회원가입 페이지 이동
		@RequestMapping(value = "/join", method = RequestMethod.GET)
		public void loginGET() {
			
			//logger.info("회원가입 페이지 진입");
		}
		
		//회원가입
		@RequestMapping(value="/join_ok", method=RequestMethod.POST)
		public String join_ok(MemberVO member,Model model) throws Exception{
			
			//logger.info("join 진입");
			
			// 회원가입 서비스 실행
			memberservice.memberJoin(member);
			
			//logger.info("join Service 성공");
			
			 model.addAttribute("regSuccess", true);
			 
			return "redirect:/member/login";
		}	
		
		//로그인 페이지 이동
		@RequestMapping(value = "/login", method = RequestMethod.GET)
		public void joinGET() {
			//logger.info("로그인 페이지 진입");
		}
		
		

		// 아이디 중복 검사
		@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
		@ResponseBody
		public String memberIdChk(String mid) throws Exception{

			//logger.info("memberIdChk() 진입");

			int result = memberservice.idCheck(mid);

			//logger.info("결과값 = " + result);

			if(result != 0) {

				return "fail";	// 중복 아이디가 존재

			} else {

				return "success";	// 중복 아이디 x

			}
		} // memberIdChk() 종료	

		
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
}
