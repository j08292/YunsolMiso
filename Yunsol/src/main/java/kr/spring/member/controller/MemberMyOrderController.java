package kr.spring.member.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.book.domain.BookListCommand;
import kr.spring.book.domain.BookRentCommand;
import kr.spring.book.domain.DeliveryCommand;
import kr.spring.book.service.BookListService;
import kr.spring.book.service.BookRentService;
import kr.spring.book.service.DeliveryService;
import kr.spring.member.service.MemberService;

@Controller
public class MemberMyOrderController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private MemberService memberService;
	
	@Resource
	private BookListService bookListService;

	@Resource
	private BookRentService bookRentService;
	
	@Resource
	private DeliveryService deliveryService;
	
	@RequestMapping(value = "/member/myOrder.do", method=RequestMethod.GET )
	public ModelAndView form(HttpSession session){
		
		String userId = (String)session.getAttribute("userId");

		List<DeliveryCommand> list_del = null;
		list_del = deliveryService.list(userId);
		
		List<BookRentCommand> list_rent = null;
		list_rent = bookRentService.list(userId);

		List<BookRentCommand> list_rentRe = null;
		list_rentRe = bookRentService.selectReserveId(userId);
		
		List<BookListCommand> list_book = null;
		list_book = bookListService.selectId(userId);
		
		int count = bookRentService.getRowCount(userId);
		
		if(log.isDebugEnabled()){
			log.debug("list_del : " + list_del);
			log.debug("list_rent : " + list_rent);
			log.debug("list_rentRe : " + list_rentRe);
			log.debug("list_book : " + list_book );
			log.debug("mem_id : " + userId);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("memberMyOrder");
		mav.addObject("count", count);
		mav.addObject("list_del", list_del);
		mav.addObject("list_rent", list_rent);
		mav.addObject("list_rentRe", list_rentRe);
		mav.addObject("list_book", list_book);
		
		return mav;
	}
	
}










