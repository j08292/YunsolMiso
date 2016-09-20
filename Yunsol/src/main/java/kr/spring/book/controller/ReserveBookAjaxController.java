package kr.spring.book.controller;

import java.util.HashMap;
import java.util.List;
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
public class ReserveBookAjaxController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource
	private BookListService bookListService;

	@Resource
	private BookRentService bookRentService;

	@RequestMapping("/book/reserveBook.do")
	@ResponseBody
	public Map<String, String> process(HttpSession session, @RequestParam("list_title") String list_title,
			@RequestParam("list_num") Integer list_num) {

		String userId = (String) session.getAttribute("userId");

		Map<String, String> map = new HashMap<String, String>();
		BookListCommand bookListCommand = new BookListCommand();
		BookRentCommand bookRentCommand = new BookRentCommand();

		List<BookRentCommand> list = null;
		list = bookRentService.list(userId);

		int order = bookListService.selectBook(list_title).getList_order();

		if (log.isDebugEnabled()) {
			log.debug("userId : " + userId);
			log.debug("list_num : " + list_num);
			log.debug("list_title : " + list_title);
			log.debug("order : " + order);
			log.debug("list : " + list);
		}

		try {
			if (userId != null) {
				if (list.size() > 0) {
					for (int i = 0; i < list.size(); i++) {
						if (list_num == list.get(i).getList_num()) {
							map.put("result", "duplicated");
						}else if (order == 2) {
							map.put("result", "fail");
						}
					}
				} else {
					if (order == 1) {
						order = 2;
						bookListCommand.setList_order(order);
						bookListCommand.setList_reserveId(userId);
						bookListCommand.setList_title(list_title);

						bookRentCommand.setList_reserveId(userId);
						bookRentCommand.setList_order(order);
						bookRentCommand.setList_num(list_num);
						map.put("result", "success");

						bookListService.updateOrder(bookListCommand);
						bookRentService.updateOrder(bookRentCommand);
						bookRentService.updateReserveDate(list_num);
					} else if (order == 2) {
						map.put("result", "fail");
					}
				}
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
