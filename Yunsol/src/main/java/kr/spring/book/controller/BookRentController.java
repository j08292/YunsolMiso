package kr.spring.book.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.book.domain.BasketCommand;
import kr.spring.book.domain.BookListCommand;
import kr.spring.book.domain.BookRentCommand;
import kr.spring.book.domain.DeliveryCommand;
import kr.spring.book.service.BasketService;
import kr.spring.book.service.BookListService;
import kr.spring.book.service.BookRentService;
import kr.spring.book.service.DeliveryService;
import kr.spring.member.domain.MemberCommand;
import kr.spring.member.service.MemberService;

@Controller
public class BookRentController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private MemberService memberService;
	
	@Resource
	private BookListService bookListService;
	
	@Resource
	private BookRentService bookRentService;
	
	@Resource
	private BasketService basketService;
	
	@Resource
	private DeliveryService deliveryService;
	
	// 커맨드 객체 초기화
		@ModelAttribute("command")
		public DeliveryCommand initCommand() {
			return new DeliveryCommand();
		}
	
	@RequestMapping(value = "/book/rent.do", method = RequestMethod.GET)
	public ModelAndView form(HttpSession session){
		String userId = (String) session.getAttribute("userId");

		if(log.isDebugEnabled()){
			log.debug("userId : " + userId);
		}
		
		List<BasketCommand> list = null;
		list = basketService.list(userId);
		
		MemberCommand member = memberService.selectMember(userId);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bookRent");
		mav.addObject("member", member);
		mav.addObject("list", list);
		return mav;
	}
	

	@RequestMapping(value = "/book/rent.do", method = RequestMethod.POST)
	public String submit(HttpSession session, SessionStatus status,
			@ModelAttribute("command") @Valid DeliveryCommand deliveryCommand, BindingResult result) {
		
		String userId = (String) session.getAttribute("userId");
		
		List<BasketCommand> list = null;
		list = basketService.list(userId);
		
		String rentDate = null;
		String returnDate = null;
		String list_title = null;
		int basket_num;
		int list_num;
		int rent=1;
		
		BookListCommand bookListCommand = new BookListCommand();
		BookRentCommand bookRentCommand = new BookRentCommand();
		
		for(int i=0; i<list.size(); i++){
			rentDate = list.get(i).getBasket_rentDate();
			returnDate = list.get(i).getBasket_returnDate();
			list_num = list.get(i).getList_num();
			list_title = list.get(i).getList_title();
			basket_num = list.get(i).getBasket_num();
  
			bookListCommand.setList_rentDate(rentDate);
			bookListCommand.setList_returnDate(returnDate);
			bookListCommand.setList_rent(rent);
			bookListCommand.setList_num(list_num);
			bookListCommand.setMem_id(userId);
			
			bookRentCommand.setList_num(list_num);
			bookRentCommand.setMem_id(userId);
			bookRentCommand.setRent_rentDate(rentDate);
			bookRentCommand.setRent_returnDate(returnDate);
			bookRentCommand.setRent_listTitle(list_title);
			
			bookListService.update(bookListCommand);
			bookRentService.insert(bookRentCommand);
			basketService.delete(basket_num);
		}
		
		if(log.isDebugEnabled()){  
			log.debug("list.size(): " + list.size()); 
			log.debug("userId : " + userId);
			log.debug("deliveryCommand : " + deliveryCommand );
			log.debug("list : " + list);
			log.debug("rentDate : " + rentDate);
			log.debug("returnDate : " + returnDate);
		}
		
		deliveryCommand.setMem_id(userId);
		deliveryService.insert(deliveryCommand);
		
		return "redirect:/member/myOrder.do";
	}

}

