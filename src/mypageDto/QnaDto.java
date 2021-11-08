package mypageDto;

import java.util.Date;



public class QnaDto {
	
	private int qna_no;
	private int qna_gno;
	private int qna_gsq;
	private int qna_tab;
	private String qna_title;
	private String qna_writer;
	private String qna_content;
	private Date qna_regdate;
	
	public QnaDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QnaDto(int qna_no, int qna_gno, int qna_gsq, int qna_tab, String qna_title, String qna_writer,
			String qna_content, Date qna_regdate) {
		super();
		this.qna_no = qna_no;
		this.qna_gno = qna_gno;
		this.qna_gsq = qna_gsq;
		this.qna_tab = qna_tab;
		this.qna_title = qna_title;
		this.qna_writer = qna_writer;
		this.qna_content = qna_content;
		this.qna_regdate = qna_regdate;
	}
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public int getQna_gno() {
		return qna_gno;
	}
	public void setQna_gno(int qna_gno) {
		this.qna_gno = qna_gno;
	}
	public int getQna_gsq() {
		return qna_gsq;
	}
	public void setQna_gsq(int qna_gso) {
		this.qna_gsq = qna_gso;
	}
	public int getQna_tab() {
		return qna_tab;
	}
	public void setQna_tab(int qna_tab) {
		this.qna_tab = qna_tab;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_writer() {
		return qna_writer;
	}
	public void setQna_writer(String qna_writer) {
		this.qna_writer = qna_writer;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public Date getQna_regdate() {
		return qna_regdate;
	}
	public void setQna_regdate(Date qna_regdate) {
		this.qna_regdate = qna_regdate;
	}
	
	
}
