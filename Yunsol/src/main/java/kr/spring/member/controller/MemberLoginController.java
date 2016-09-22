package kr.spring.member.controller;

import java.sql.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.member.domain.MemberCommand;
import kr.spring.member.service.MemberService;
import kr.spring.penalty.domain.PenaltyCommand;

@Controller
public class MemberLoginController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private MemberService memberService;
	
	//커맨드 객체(자바빈) 초기화
	@ModelAttribute("command")
	public MemberCommand initCommand(){
		return new MemberCommand();
	}
	
	@RequestMapping(value="/member/login.do",method=RequestMethod.GET)
	public ModelAndView form(){
		return new ModelAndView("memberLogin");
	}
	
	@RequestMapping(value="/member/login.do",method=RequestMethod.POST)
	public ModelAndView submit(@ModelAttribute("command")
	                     @Valid MemberCommand memberCommand,
	                     BindingResult result,
	                     HttpSession session){
		
		if(log.isDebugEnabled()){
			log.debug("memberCommand : " + memberCommand);
		}
		//유효성 체크
		if(result.hasFieldErrors("mem_id") || 
				result.hasFieldErrors("mem_passwd")){
			return form();
		}
		
		//로그인 체크
		try{
			MemberCommand member = 
					memberService.selectMember(memberCommand.getMem_id());
			boolean check = false;
			
			if(member!=null){
				check = member.isCheckedPasswd(memberCommand.getMem_passwd());				
			}
			if(check){
				if(memberService.checkBlock(memberCommand.getMem_id()) > 0){//차단회원 로그인 시도 -> 로그인 막음
					result.reject("blockMemberId");
					
					PenaltyCommand penalty = memberService.selectBlockMember(memberCommand.getMem_id());
					
					/*ModelAndView mav= new ModelAndView();
					mav.setViewName("memberLogin");
					mav.addObject("blockcanceldate",blockcanceldate);
					mav.addObject("reason", reason);*/
					return new ModelAndView("memberLogin","penalty",penalty);
				}else{
					//인증 성공, 로그인 처리
					session.setAttribute("userId", memberCommand.getMem_id());
					session.setAttribute("mem_level", member.getMem_level());
					
					return new ModelAndView("redirect:/main/main.do");
				}				
			}else{
				//인증 실패
				throw new Exception();
			}
		}catch(Exception e){
			//인증 실패로 폼 호출
			result.reject("invalidIdOrPassword");
			return form();
		}
	}
}