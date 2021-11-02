package com.soso.ref.dto;

import java.sql.Date;

public class referenceDto {
	private int rboard_no;
	private String rboard_title;
	private String rboard_content;
	private Date rboard_regdate;
	private int rboard_grade;
	private String rboard_subject;
	private String rboard_type;
	
	public referenceDto() {
		super();
	}

	public referenceDto(int rboard_no, String rboard_title, String rboard_content, Date rboard_regdate,
			int rboard_grade, String rboard_subject, String rboard_type) {
		super();
		this.rboard_no = rboard_no;
		this.rboard_title = rboard_title;
		this.rboard_content = rboard_content;
		this.rboard_regdate = rboard_regdate;
		this.rboard_grade = rboard_grade;
		this.rboard_subject = rboard_subject;
		this.rboard_type = rboard_type;
	}

	public int getRboard_no() {
		return rboard_no;
	}

	public void setRboard_no(int rboard_no) {
		this.rboard_no = rboard_no;
	}

	public String getRboard_title() {
		return rboard_title;
	}

	public void setRboard_title(String rboard_title) {
		this.rboard_title = rboard_title;
	}

	public String getRboard_content() {
		return rboard_content;
	}

	public void setRboard_content(String rboard_content) {
		this.rboard_content = rboard_content;
	}

	public Date getRboard_regdate() {
		return rboard_regdate;
	}

	public void setRboard_regdate(Date rboard_regdate) {
		this.rboard_regdate = rboard_regdate;
	}

	public int getRboard_grade() {
		return rboard_grade;
	}

	public void setRboard_grade(int rboard_grade) {
		this.rboard_grade = rboard_grade;
	}

	public String getRboard_subject() {
		return rboard_subject;
	}

	public void setRboard_subject(String rboard_subject) {
		this.rboard_subject = rboard_subject;
	}

	public String getRboard_type() {
		return rboard_type;
	}

	public void setRboard_type(String rboard_type) {
		this.rboard_type = rboard_type;
	}
	
	
}
