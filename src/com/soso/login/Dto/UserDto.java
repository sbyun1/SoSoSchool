package com.soso.login.Dto;

public class UserDto {
	private int user_no;
	private String user_pr;
	private String user_name;
	private String user_id;
	private String user_pw;
	private String user_nn;
	private int grade;
	private String addr;
	private int phone;
	private String email;
	private int user_point;
	private String sub_yn;
	private String enabled_yn;
	private String user_type;

	public UserDto() {
	}

	public UserDto(int user_no, String user_pr, String user_name, String user_id, String user_pw, String user_nn,
			int grade, String addr, int phone, String email, int user_point, String sub_yn, String enabled_yn,
			String user_type) {
		super();
		this.user_no = user_no;
		this.user_pr = user_pr;
		this.user_name = user_name;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_nn = user_nn;
		this.grade = grade;
		this.addr = addr;
		this.phone = phone;
		this.email = email;
		this.user_point = user_point;
		this.sub_yn = sub_yn;
		this.enabled_yn = enabled_yn;
		this.user_type = user_type;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_pr() {
		return user_pr;
	}

	public void setUser_pr(String user_pr) {
		this.user_pr = user_pr;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_nn() {
		return user_nn;
	}

	public void setUser_nn(String user_nn) {
		this.user_nn = user_nn;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getUser_point() {
		return user_point;
	}

	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}

	public String getSub_yn() {
		return sub_yn;
	}

	public void setSub_yn(String sub_yn) {
		this.sub_yn = sub_yn;
	}

	public String getEnabled_yn() {
		return enabled_yn;
	}

	public void setEnabled_yn(String enabled_yn) {
		this.enabled_yn = enabled_yn;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	
	
}
