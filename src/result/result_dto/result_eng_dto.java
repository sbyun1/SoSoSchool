package result.result_dto;

public class result_eng_dto {
    private String user_id;
    private int month;
    private int day;
    private int eng;

    public result_eng_dto() {
    }

    public result_eng_dto(String user_id, int month, int day, int eng) {
        this.user_id = user_id;
        this.month = month;
        this.day = day;
        this.eng = eng;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public int getEng() {
        return eng;
    }

    public void setEng(int eng) {
        this.eng = eng;
    }
}
