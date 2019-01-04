package cn.king.pojo;

/**
 * @Title:
 * @CreateTime: 2018/12/28 15:52
 * @Author: king
 * @Description:
 */
public class Group {
    private Integer id;
    private String groupName;

    private Task task;//小组进行的任务
    private Course course;//小组所属课程id
    private Integer classId;//小组所属班级id

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public Task getTask() {
        return task;
    }

    public void setTask(Task task) {
        this.task = task;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }
}
