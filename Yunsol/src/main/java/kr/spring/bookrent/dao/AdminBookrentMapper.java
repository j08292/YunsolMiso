package kr.spring.bookrent.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import kr.spring.bookrent.domain.AdminBookrentCommand;
import kr.spring.member.domain.MemberCommand;

@Repository
public interface AdminBookrentMapper {
	//관리자 도서 대출  
	public List<AdminBookrentCommand> list(Map<String, Object> map);
	public int getRowCount(Map<String, Object> map);
	@Select("SELECT count(*) FROM bookrent WHERE list_num=#{list_num} AND rent_status=2")
	public int getReserveCount(Integer list_num);
	@Update("UPDATE bookrent SET rent_status=#{rent_status},rent_regdate=sysdate WHERE rent_num=#{rent_num}")
	public void updateBookRent(AdminBookrentCommand bookrent);//도서 대출처리
	@Update("UPDATE bookrent SET rent_status=#{rent_status},rent_returndate=sysdate WHERE rent_num=#{rent_num}")
	public void updateStatusChange(AdminBookrentCommand bookrent);//도서 반납처리
	@Update("UPDATE member SET mem_penalty=#{mem_penalty} WHERE mem_id=#{mem_id}")
	public void updatePenalty(MemberCommand member);//연체일 존재하는 책 반납시
	@Update("UPDATE bookrent SET rent_status=3 WHERE list_num=#{list_num} AND rent_status=2")
	public void reserveToWaiting(Integer list_num);//예약도서 -> 대출대기	
	@Update("UPDATE bookrent SET rent_status=#{rent_status},rent_returndate=sysdate WHERE rent_num=#{rent_num}")
	public void updateRentCancel(AdminBookrentCommand bookrent);//입금 지연등의 이유로 대여 취소
}