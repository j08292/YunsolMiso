package kr.spring.book.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.spring.book.domain.BookListCommand;

@Transactional
public interface BookListService {
	@Transactional(readOnly=true)
	public List<BookListCommand> list(Map<String,Object> map);
	@Transactional(readOnly=true)
	public int getRowCount(Map<String,Object> map);
	@Transactional(readOnly=true)
	public BookListCommand selectBook(String list_title);
	@Transactional(readOnly=true)
	public List<BookListCommand> selectId(String mem_id);
	public void update(BookListCommand bookListCommand);
	public void updateOrder(BookListCommand bookListCommand);
}
