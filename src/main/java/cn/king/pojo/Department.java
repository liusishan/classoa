package cn.king.pojo;

/**
 * @Title:
 * @CreateTime: 2018/12/28 15:35
 * @Author: king
 * @Description:
 */
public class Department {
    private Integer id;
    private String departmentName;
    private String departmentAdmin;//院系负责人
    private String telephone;//负责人联系方式
    private String remark;//备注

    @Override
    public String toString() {
        return "Department{" +
                "id=" + id +
                ", departmentName='" + departmentName + '\'' +
                ", departmentAdmin='" + departmentAdmin + '\'' +
                ", telephone='" + telephone + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getDepartmentAdmin() {
        return departmentAdmin;
    }

    public void setDepartmentAdmin(String departmentAdmin) {
        this.departmentAdmin = departmentAdmin;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
