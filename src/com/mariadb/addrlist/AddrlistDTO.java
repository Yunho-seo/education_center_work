package com.mariadb.addrlist;

public class AddrlistDTO {
	private int num;
	private String name;
	private String phone;
	private String addr;
	private String email;

	public AddrlistDTO() {
		
	}

	public AddrlistDTO(int num, String name, String phone, String addr, String email) {
		this.num = num;
		this.name = name;
		this.phone = phone;
		this.addr = addr;
		this.email = email;
	}

	public String toString() {
		return "이름: " + name + "전화번호: " + phone + "주소: " + addr + "이메일: " + email;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
