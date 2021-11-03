package result.result_dto;

public class result_dto {
    private String user_id;
    private int month;
    private int kor;
    private int math;
    private int eng;

    public result_dto() {
    }

    public result_dto(String user_id, int month, int kor, int math, int eng) {
        this.user_id = user_id;
        this.month = month;
        this.kor = kor;
        this.math = math;
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

    public int getKor() {
        return kor;
    }

    public void setKor(int kor) {
        this.kor = kor;
    }

    public int getMath() {
        return math;
    }

    public void setMath(int math) {
        this.math = math;
    }

    public int getEng() {
        return eng;
    }

    public void setEng(int eng) {
        this.eng = eng;
    }
}
