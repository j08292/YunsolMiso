package kr.spring.book.domain;

import java.sql.Date;

public class BookListCommand {

	private int list_num;
	private String list_code;
	private String list_title;
	private String list_writer;
	private String list_publish;
	private int list_page;
	private String list_filename;
	private Date list_regdate;
	private int list_grade;
	private int list_status;
	private int list_rent;
	private String list_rentDate;
	private String list_returnDate;
	private int list_order;
	private String mem_id;
	private String list_reserveId;

	public String getList_reserveId() {
		return list_reserveId;
	}

	public void setList_reserveId(String list_reserveId) {
		this.list_reserveId = list_reserveId;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getList_num() {
		return list_num;
	}

	public void setList_num(int list_num) {
		this.list_num = list_num;
	}

	public String getList_code() {
		return list_code;
	}

	public void setList_code(String list_code) {
		this.list_code = list_code;
	}

	public String getList_title() {
		return list_title;
	}

	public void setList_title(String list_title) {
		this.list_title = list_title;
	}

	public String getList_writer() {
		return list_writer;
	}

	public void setList_writer(String list_writer) {
		this.list_writer = list_writer;
	}

	public String getList_publish() {
		return list_publish;
	}

	public void setList_publish(String list_publish) {
		this.list_publish = list_publish;
	}

	public int getList_page() {
		return list_page;
	}

	public void setList_page(int list_page) {
		this.list_page = list_page;
	}

	public String getList_filename() {
		return list_filename;
	}

	public void setList_filename(String list_filename) {
		this.list_filename = list_filename;
	}

	public Date getList_regdate() {
		return list_regdate;
	}

	public void setList_regdate(Date list_regdate) {
		this.list_regdate = list_regdate;
	}

	public int getList_grade() {
		return list_grade;
	}

	public void setList_grade(int list_grade) {
		this.list_grade = list_grade;
	}

	public int getList_status() {
		return list_status;
	}

	public void setList_status(int list_status) {
		this.list_status = list_status;
	}

	public int getList_rent() {
		return list_rent;
	}

	public void setList_rent(int list_rent) {
		this.list_rent = list_rent;
	}

	public String getList_rentDate() {
		return list_rentDate;
	}

	public void setList_rentDate(String list_rentDate) {
		this.list_rentDate = list_rentDate;
	}

	public String getList_returnDate() {
		return list_returnDate;
	}

	public void setList_returnDate(String list_returnDate) {
		this.list_returnDate = list_returnDate;
	}

	public int getList_order() {
		return list_order;
	}

	public void setList_order(int list_order) {
		this.list_order = list_order;
	}

	@Override
	public String toString() {
		return "BookListCommand [list_num=" + list_num + ", list_code=" + list_code + ", list_title=" + list_title
				+ ", list_writer=" + list_writer + ", list_publish=" + list_publish + ", list_page=" + list_page
				+ ", list_filename=" + list_filename + ", list_regdate=" + list_regdate + ", list_grade=" + list_grade
				+ ", list_status=" + list_status + ", list_rent=" + list_rent + ", list_rentDate=" + list_rentDate
				+ ", list_returnDate=" + list_returnDate + ", list_order=" + list_order + ", mem_id=" + mem_id
				+ ", list_reserveId=" + list_reserveId + "]";
	}


}
