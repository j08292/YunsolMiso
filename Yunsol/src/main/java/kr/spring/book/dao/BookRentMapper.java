package kr.spring.book.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import kr.spring.book.domain.BookRentCommand;

@Repository
public interface BookRentMapper {
	@Insert("INSERT INTO bookrent(rent_num,list_num,mem_id,rent_regdate,rent_rentdate,rent_returndate,rent_listtitle) "
			+ "VALUES(bookrent_seq.nextval,#{list_num},#{mem_id},sysdate,#{rent_rentDate},#{rent_returnDate},#{rent_listTitle})")
	public void insert(BookRentCommand bookRentCommand);

	@Select("SELECT * FROM bookrent WHERE mem_id = #{mem_id} ORDER BY rent_num DESC")
	public List<BookRentCommand> list(String mem_id);
	
	@Select("SELECT * FROM bookrent WHERE rent_num = #{rent_num}")
	public BookRentCommand selectRent(int rent_num);
	
	@Select("SELECT * FROM bookrent WHERE mem_id = #{mem_id}")
	public BookRentCommand selectRentId(String mem_id);
	
	@Select("SELECT * FROM bookrent WHERE list_reserveid = #{list_reserveId} ORDER BY rent_num DESC")
	public List<BookRentCommand> selectReserveId(String reserveId);
	
	@Select("SELECT count(*) FROM bookrent WHERE mem_id = #{mem_id}")
	public int getRowCount(String mem_id);
	
	@Update("UPDATE bookrent SET list_order=#{list_order},list_reserveid=#{list_reserveId} WHERE list_num=#{list_num}")
	public void updateOrder(BookRentCommand bookRentCommand);
	
	@Update("UPDATE bookrent SET rent_reservedate=sysdate WHERE list_num=#{list_num}")
	public void updateReserveDate(int list_num);
	
	@Update("UPDATE bookrent SET rent_reservedatecancel=sysdate WHERE rent_num=#{rent_num}")
	public void updateReserveDateCancel(int rent_num);
}
