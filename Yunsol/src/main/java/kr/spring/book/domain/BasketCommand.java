package kr.spring.book.domain;

public class BasketCommand {
	private int basket_num;
	private int basket_price;
	private int basket_amount;
	private String mem_id;
	private int list_num;
	private String list_filename;
	private String list_title;
	private String basket_rentDate;
	private String basket_returnDate;

	public String getBasket_rentDate() {
		return basket_rentDate;
	}

	public void setBasket_rentDate(String basket_rentDate) {
		this.basket_rentDate = basket_rentDate;
	}

	public String getBasket_returnDate() {
		return basket_returnDate;
	}

	public void setBasket_returnDate(String basket_returnDate) {
		this.basket_returnDate = basket_returnDate;
	}

	public String getList_title() {
		return list_title;
	}

	public void setList_title(String list_title) {
		this.list_title = list_title;
	}

	public int getBasket_num() {
		return basket_num;
	}

	public void setBasket_num(int basket_num) {
		this.basket_num = basket_num;
	}

	public int getBasket_price() {
		return basket_price;
	}

	public void setBasket_price(int basket_price) {
		this.basket_price = basket_price;
	}

	public int getBasket_amount() {
		return basket_amount;
	}

	public void setBasket_amount(int basket_amount) {
		this.basket_amount = basket_amount;
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

	public String getList_filename() {
		return list_filename;
	}

	public void setList_filename(String list_filename) {
		this.list_filename = list_filename;
	}

}
