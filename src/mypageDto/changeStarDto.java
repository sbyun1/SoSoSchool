package mypageDto;

public class changeStarDto {
    private int gi_no;
    private String gi_title;
    private int gi_prize;
    private int gi_stock;
    private String gi_img;

    public changeStarDto() {
    }

    public changeStarDto(int gi_no, String gi_title, int gi_prize, int gi_stock, String gi_img) {
        this.gi_no = gi_no;
        this.gi_title = gi_title;
        this.gi_prize = gi_prize;
        this.gi_stock = gi_stock;
        this.gi_img = gi_img;
    }

    public int getGi_no() {
        return gi_no;
    }

    public void setGi_no(int gi_no) {
        this.gi_no = gi_no;
    }

    public String getGi_title() {
        return gi_title;
    }

    public void setGi_title(String gi_title) {
        this.gi_title = gi_title;
    }

    public int getGi_prize() {
        return gi_prize;
    }

    public void setGi_prize(int gi_prize) {
        this.gi_prize = gi_prize;
    }

    public int getGi_stock() {
        return gi_stock;
    }

    public void setGi_stock(int gi_stock) {
        this.gi_stock = gi_stock;
    }

    public String getGi_img() {
        return gi_img;
    }

    public void setGi_img(String gi_img) {
        this.gi_img = gi_img;
    }
}
