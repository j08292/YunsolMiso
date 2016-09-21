package kr.spring.penalty.domain;

import java.sql.Date;

import org.hibernate.validator.constraints.NotEmpty;

public class PenaltyCommand {
	private int penalty_num;
	private Date penalty_blockcanceldate;
	private int penalty_day;
	private String mem_id;
	private int rent_num;
	@NotEmpty
	private String penalty_reason;
	
	public int getPenalty_num() {
		return penalty_num;
	}
	public void setPenalty_num(int penalty_num) {
		this.penalty_num = penalty_num;
	}
	public Date getPenalty_blockcanceldate() {
		return penalty_blockcanceldate;
	}
	public void setPenalty_blockcanceldate(Date penalty_blockcanceldate) {
		this.penalty_blockcanceldate = penalty_blockcanceldate;
	}
	public int getPenalty_day() {
		return penalty_day;
	}
	public void setPenalty_day(int penalty_day) {
		this.penalty_day = penalty_day;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getRent_num() {
		return rent_num;
	}
	public void setRent_num(int rent_num) {
		this.rent_num = rent_num;
	}
	public String getPenalty_reason() {
		return penalty_reason;
	}
	public void setPenalty_reason(String penalty_reason) {
		this.penalty_reason = penalty_reason;
	}
	
	@Override
	public String toString() {
		return "PenaltyCommand [penalty_num=" + penalty_num + ", penalty_blockcanceldate=" + penalty_blockcanceldate
				+ ", penalty_day=" + penalty_day + ", mem_id=" + mem_id + ", rent_num=" + rent_num + ", penalty_reason="
				+ penalty_reason + "]";
	}	
}