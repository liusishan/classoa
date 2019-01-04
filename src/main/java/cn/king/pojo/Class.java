package cn.king.pojo;

/**
 * @Title:
 * @CreateTime: 2018/12/28 15:41
 * @Author: king
 * @Description:
 */
public class Class {
    private Integer id;
    private String className;
    private String remark;
    private User teacher;//班主任id
    private Major major;//班级所属专业id
    private Integer departmentId;//班级所属院系id

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public User getTeacher() {
        return teacher;
    }

    public void setTeacher(User teacher) {
        this.teacher = teacher;
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