package kr.spring.member.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import kr.spring.member.domain.MemberCommand;

@Repository
public interface MemberMapper {
	@Insert("INSERT INTO member(mem_id, mem_name, mem_passwd, mem_cell, mem_email, mem_address, sample3_postcode ,mem_regdate) VALUES (#{mem_id}, #{mem_name}, #{mem_passwd}, #{mem_cell}, #{mem_email}, #{mem_address}, #{sample3_postcode} ,sysdate)")
	public void insert(MemberCommand member);
	
	@Select("SELECT * FROM member WHERE mem_id = #{mem_id}")
	public MemberCommand selectMember(String mem_id);
	
	@Update("UPDATE member SET"
			+ " mem_passwd = #{mem_passwd}, mem_name = #{mem_name}, mem_cell=${mem_cell}, mem_email=#{mem_email}, mem_address=#{mem_address} WHERE mem_id = #{mem_id}")
	public void update(MemberCommand member);
	
	@Delete("DELETE FROM member WHERE mem_id = #{mem_id}") 	
	public void delete(String id);
}