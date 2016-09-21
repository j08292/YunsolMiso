package kr.admin.bookrent.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.bookrent.domain.AdminBookrentCommand;
import kr.spring.bookrent.service.AdminBookrentService;
import kr.spring.member.domain.MemberCommand;

@Controller  
public class BookrentPenaltyController {
	private Logger log= Logger.getLogger(this.getClass());
	
	@Resource
	private AdminBookrentService bookrentService;
	
	@RequestMapping("/admin/bookrent/updatePenalty.do")
	public ModelAndView process(@RequestParam("rent_num") int rent_num,
								@RequestParam("rent_status")int rent_status,
								@RequestParam("mem_penalty")int mem_penalty,
								@RequestParam("mem_id")String mem_id){
		if(log.isDebugEnabled()){
			log.debug("rent_num : " +rent_num);
			log.debug("rent_status : " +rent_status);
			log.debug("mem_penalty : " +mem_penalty);
			log.debug("mem_id : " +mem_id);
		}

		AdminBookrentCommand bookrent = new AdminBookrentCommand();
		bookrent.setRent_num(rent_num);
		bookrent.setRent_status(rent_status);
		bookrentService.updateStatusChange(bookrent);
		
		MemberCommand member =  new MemberCommand();
		member.setMem_penalty(mem_penalty);
		member.setMem_id(mem_id);
		bookrentService.updatePenalty(member);

		return new ModelAndView("redirect:/admin/bookrent/list.do");
	}
}