package kr.spring.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.book.domain.BookListCommand;
import kr.spring.book.domain.BookRentCommand;
import kr.spring.book.service.BookListService;
import kr.spring.book.service.BookRentService;

@Controller
public class ReserveDateCancelAjaxController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource
	private BookListService bookListService;

	@Resource
	private BookRentService bookRentService;

	@RequestMapping("/member/reserveCancel.do")
	@ResponseBody
	public Map<String, String> process(HttpSession session, @RequestParam("rent_num") Integer rent_num,
			 @RequestParam("list_num") Integer list_num) {

		String userId = (String) session.getAttribute("userId");

		Map<String, String> map = new HashMap<String, String>();

		BookListCommand bookListCommand = new BookListCommand(); 
		BookRentCommand bookRentCommand = new BookRentCommand();
		
		if (log.isDebugEnabled()) {
			log.debug("userId : " + userId);
			log.debug("rent_num : " + rent_num);
			log.debug("list_num : " + list_num);
		}
		int list_order = 1;
		String list_reserveId = "";
		bookListCommand.setList_order(list_order);
		bookListCommand.setList_reserveId(list_reserveId);
		
		int rent_order = 3;
		String rent_reserveId = "";
		bookRentCommand.setList_order(rent_order);
		bookRentCommand.setList_reserveId(rent_reserveId);
		bookRentCommand.setList_num(list_num);
		
		try {
			if (userId != null) {
				map.put("result", "success");
				bookRentService.updateReserveDateCancel(rent_num);
				bookListService.updateOrder(bookListCommand);
			} else if (userId == null) {
				map.put("result", "noUserId");
			}

		} catch (Exception e) {
			log.error(e);
			map.put("result", "failure");
		}
		return map;
	}
}
