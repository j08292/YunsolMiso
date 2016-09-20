package kr.spring.book.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.book.domain.BookListCommand;
import kr.spring.book.service.BookListService;

@Controller
public class BookDetailController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private BookListService bookListService;

	@RequestMapping("/book/detail.do" )
	public ModelAndView process(HttpSession session,
								@RequestParam(value="list_title") String list_title,
								@RequestParam(value="list_filename") String list_filename,
								@RequestParam(value="list_num") Integer list_num){
		
		BookListCommand book = bookListService.selectBook(list_title);
		session.setAttribute("list_title", list_title);
		session.setAttribute("list_num", list_num);
		session.setAttribute("list_filename", list_filename);
		
		if(log.isDebugEnabled()){
			log.debug("list_title : " + list_title);
			log.debug("list_filename : " + list_filename);
			log.debug("list_num : " + list_num);
			log.debug("book : " + book);
		}
		
		return new ModelAndView("bookDetail", "book", book);
	}
	
}
