package kr.spring.book.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.spring.book.domain.BookRentCommand;

@Transactional
public interface BookRentService {
	@Transactional(readOnly=true)
	public List<BookRentCommand> list(String mem_id);
	@Transactional(readOnly=true)
	public int getRowCount(String mem_id);
	@Transactional(readOnly=true)
	public BookRentCommand selectRent(int rent_num);
	@Transactional(readOnly=true)
	public BookRentCommand selectRentId(String mem_id);
	@Transactional(readOnly=true)
	public List<BookRentCommand> selectReserveId(String reserveId);
	public void insert(BookRentCommand bookRentCommand);
	public void updateOrder(BookRentCommand bookRentCommand);
	public void updateReserveDate(int list_num);
	public void updateReserveDateCancel(int rent_num);
	
}
