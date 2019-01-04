package cn.king.pojo;

/**
 * @Title:
 * @CreateTime: 2018/12/28 15:49
 * @Author: king
 * @Description:
 */
public class Course {
    private Integer id;
    private String courseName;
    private Float aFloat;
    private String remark;//课程描述
    private Major major;//课程所属专业
    private Integer departmentId;//课程所属院系

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public Float getaFloat() {
        return aFloat;
    }

    public void setaFloat(Float aFloat) {
        this.aFloat = aFloat;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Major getMajor() {
        return major;
    }

    public void setMajor(Major major) {
        this.major = major;
    }

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }
}
