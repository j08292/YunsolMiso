package kr.spring.book.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.book.dao.BookListMapper;
import kr.spring.book.domain.BookListCommand;

@Service("bookListService")
public class BookListServiceImpl implements BookListService {

	@Resource
	private BookListMapper bookListMapper;

	@Override
	public List<BookListCommand> list(Map<String, Object> map) {
		return bookListMapper.list(map);
	}

	@Override
	public int getRowCount(Map<String, Object> map) {
		return bookListMapper.getRowCount(map);
	}

	@Override
	public BookListCommand selectBook(String list_title) {
		return bookListMapper.selectBook(list_title);
	}

	@Override
	public void update(BookListCommand bookListCommand) {
		bookListMapper.update(bookListCommand);
	}

	@Override
	public void updateOrder(BookListCommand bookListCommand) {
		bookListMapper.updateOrder(bookListCommand);
	}

	@Override
	public List<BookListCommand> selectId(String mem_id) {
		return bookListMapper.selectId(mem_id);
	}

	

}
