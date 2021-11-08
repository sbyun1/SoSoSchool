package com.soso.login.Dto;

public class UserDto {
	private int user_no;
	private String user_pr;
	private String user_name;
	private String user_id;
	private String user_pw;
	private int grade;
	private String postcode;
	private String roadAddr;
	private String detailAddr;
	private String phone;
	private String email;
	private int user_point	;
	private String sub_yn;
	private String enabled_yn;
	private String user_type;
	private String region;		//임의로 추가함
	private int user_star;	//임의로 추가함(user_point는 랭킹용 user_star는 교환용)

	public UserDto() {
	}
	
	//닉네임 제거 및 주소 추가한 생성자

	

	public int getUser_no() {
		return user_no;
	}


	public UserDto(int user_no, String user_pr, String user_name, String user_id, String user_pw, int grade,
			String postcode, String roadAddr, String detailAddr, String phone, String email, int user_point,
			String sub_yn, String enabled_yn, String user_type, String region, int user_star) {
		super();
		this.user_no = user_no;
		this.user_pr = user_pr;
		this.user_name = user_name;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.grade = grade;
		this.postcode = postcode;
		this.roadAddr = roadAddr;
		this.detailAddr = detailAddr;
		this.phone = phone;
		this.email = email;
		this.user_point = user_point;
		this.sub_yn = sub_yn;
		this.enabled_yn = enabled_yn;
		this.user_type = user_type;
		this.region = region;
		this.user_star = user_star;
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

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getRoadAddr() {
		return roadAddr;
	}

	public void setRoadAddr(String roadAddr) {
		this.roadAddr = roadAddr;
	}

	public String getDetailAddr() {
		return detailAddr;
	}

	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
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

	public String getRegion(){
		return region;
	}

	public void setRegion(String region){
		this.region = region;
	}

	public int getUser_star() {
		return user_star;
	}

	public void setUser_star(int user_star) {
		this.user_star = user_star;
	}
}
