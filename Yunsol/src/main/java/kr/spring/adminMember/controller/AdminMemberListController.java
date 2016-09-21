package kr.spring.adminMember.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.adminMember.domain.AdminMemberCommand;
import kr.spring.adminMember.service.AdminMemberService;
import kr.spring.util.PagingUtil;

@Controller
public class AdminMemberListController {
	private Logger log= Logger.getLogger(this.getClass());

	private int rowCount=10;
	private int pageCount=10;

	@Resource
	private AdminMemberService adminMemberService;

	//커맨드 객체 초기화
	@ModelAttribute("command")
	public AdminMemberCommand initCommand() {
		return new AdminMemberCommand();
	}

	@RequestMapping(value="/admin/member/list.do", method = RequestMethod.GET)
	public String form(){
		return "adminMemberList";
	}

	@RequestMapping(value="/admin/member/list.do", method = RequestMethod.POST)
	public ModelAndView submit(@RequestParam(value="pageNum",defaultValue="1")int currentPage,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
							   @RequestParam(value="keyfield",defaultValue="")String keyfield,
							   @RequestParam(value="keyword",defaultValue="")String keyword){
		if(log.isDebugEnabled()){
			log.debug("currentPage : " + currentPage);
			log.debug("keyfield : " + keyfield);
			log.debug("keyword : " + keyword);
		}

		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);

		//총 글의 갯수 또는 검색된 글의 갯수
		int count = adminMemberService.getRowCount(map);

		PagingUtil page = new PagingUtil(keyfield,keyword,currentPage,count,rowCount,pageCount,"/admin/member/list.do");

		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());

		List<AdminMemberCommand> list = null;
		if(count > 0){
			list = adminMemberService.list(map);
		}else{
			list = Collections.emptyList();
		}

		if(log.isDebugEnabled()){
			log.debug("count : " + count);
			log.debug("list : " + list);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminMemberList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("pagingHtml", page.getPagingHtml());

		return mav;
	}
}