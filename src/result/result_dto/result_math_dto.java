package result.result_dto;

public class result_math_dto {
    private String user_id;
    private int month;
    private int day;
    private int math;

    public result_math_dto() {
    }

    public result_math_dto(String user_id, int month, int day, int math) {
        this.user_id = user_id;
        this.month = month;
        this.day = day;
        this.math = math;
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

    public int getMath() {
        return math;
    }

    public void setMath(int math) {
        this.math = math;
    }
}
