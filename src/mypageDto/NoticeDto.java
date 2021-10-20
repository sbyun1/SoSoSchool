package mypageDto;

import java.util.Date;

public class NoticeDto {
	private int noti_no;
	private int noti_gno;
	private int noti_gsq;
	private int noti_tab;
	private String noti_title;
	private String noti_writer;
	private String noti_content;
	private Date noti_regdate;
	public NoticeDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticeDto(int noti_no, int noti_gno, int noti_gsq, int noti_tab, String noti_title, String noti_writer,
			String noti_content, Date noti_regdate) {
		super();
		this.noti_no = noti_no;
		this.noti_gno = noti_gno;
		this.noti_gsq = noti_gsq;
		this.noti_tab = noti_tab;
		this.noti_title = noti_title;
		this.noti_writer = noti_writer;
		this.noti_content = noti_content;
		this.noti_regdate = noti_regdate;
	}
	public int getNoti_no() {
		return noti_no;
	}
	public void setNoti_no(int noti_no) {
		this.noti_no = noti_no;
	}
	public int getNoti_gno() {
		return noti_gno;
	}
	public void setNoti_gno(int noti_gno) {
		this.noti_gno = noti_gno;
	}
	public int getNoti_gsq() {
		return noti_gsq;
	}
	public void setNoti_gsq(int noti_gsq) {
		this.noti_gsq = noti_gsq;
	}
	public int getNoti_tab() {
		return noti_tab;
	}
	public void setNoti_tab(int noti_tab) {
		this.noti_tab = noti_tab;
	}
	public String getNoti_title() {
		return noti_title;
	}
	public void setNoti_title(String noti_title) {
		this.noti_title = noti_title;
	}
	public String getNoti_writer() {
		return noti_writer;
	}
	public void setNoti_writer(String noti_writer) {
		this.noti_writer = noti_writer;
	}
	public String getNoti_content() {
		return noti_content;
	}
	public void setNoti_content(String noti_content) {
		this.noti_content = noti_content;
	}
	public Date getNoti_regdate() {
		return noti_regdate;
	}
	public void setNoti_regdate(Date noti_regdate) {
		this.noti_regdate = noti_regdate;
	}
	
	

}
