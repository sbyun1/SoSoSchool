package group;

import java.util.Date;

public class groupDto {
    private int gboard_no;
    private String gboard_title;
    private String gboard_subtitle;
    private String gboard_content;
    private String gboard_img;
    private Date regdate;
    private String gboard_region;

    public groupDto() {
    }

    public groupDto(int gboard_no, String gboard_title, String gboard_subtitle, String gboard_content, String gboard_img, Date regdate, String gboard_region) {
        this.gboard_no = gboard_no;
        this.gboard_title = gboard_title;
        this.gboard_subtitle = gboard_subtitle;
        this.gboard_content = gboard_content;
        this.gboard_img = gboard_img;
        this.regdate = regdate;
        this.gboard_region = gboard_region;
    }

    public int getGboard_no() {
        return gboard_no;
    }

    public void setGboard_no(int gboard_no) {
        this.gboard_no = gboard_no;
    }

    public String getGboard_title() {
        return gboard_title;
    }

    public void setGboard_title(String gboard_title) {
        this.gboard_title = gboard_title;
    }

    public String getGboard_subtitle() {
        return gboard_subtitle;
    }

    public void setGboard_subtitle(String gboard_subtitle) {
        this.gboard_subtitle = gboard_subtitle;
    }

    public String getGboard_content() {
        return gboard_content;
    }

    public void setGboard_content(String gboard_content) {
        this.gboard_content = gboard_content;
    }

    public String getGboard_img() {
        return gboard_img;
    }

    public void setGboard_img(String gboard_img) {
        this.gboard_img = gboard_img;
    }

    public Date getRegdate() {
        return regdate;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }

    public String getGboard_region() {
        return gboard_region;
    }

    public void setGboard_region(String gboard_region) {
        this.gboard_region = gboard_region;
    }
}
