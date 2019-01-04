package cn.king.pojo;

/**
 * @Title:
 * @CreateTime: 2018/12/28 15:52
 * @Author: king
 * @Description:
 */
public class Task {
    private Integer id;
    private String title;//标题
    private String type;//学习任务类型
    private String endTime;//作业截止时间
    private String file;//附件路径
    private String remark;//描述
    private User teacher;//发布学习任务的教师的id
    private Integer classId;//班级

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file;
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

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }
}
