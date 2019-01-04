package cn.king.pojo;

/**
 * @Title:
 * @CreateTime: 2018/12/28 15:31
 * @Author: king
 * @Description: 学生 教师 管理员
 */
public class User {
    private Integer id;
    private String account;//工号 学号
    private String password;//加密后的密码
    private String salt;//盐

    private String name;//姓名
    private String gender;//性别
    private String telephone;
    private String email;
    private String qq;
    private String hiredate;//入职时间
    private String birthday;//生日
    private String idcard;//身份证
    private String remark;//备注信息
    private Integer departmentId;//部门

    //教师字段
    private String almamater;//母校
    private String mainMajor;//主修专业
    private String highestEducation;//最高学历

    //学生字段
    private String fName;//父亲姓名
    private String mName;//母亲姓名
    private String homeTelephone;//家庭联系电话
    private String householdType;//户口性质

    private Integer majorId;//专业编号
    private Integer classId;//班级

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", account='" + account + '\'' +
                ", password='" + password + '\'' +
                ", salt='" + salt + '\'' +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", telephone='" + telephone + '\'' +
                ", email='" + email + '\'' +
                ", qq='" + qq + '\'' +
                ", hiredate='" + hiredate + '\'' +
                ", birthday='" + birthday + '\'' +
                ", idcard='" + idcard + '\'' +
                ", remark='" + remark + '\'' +
                ", departmentId=" + departmentId +
                ", almamater='" + almamater + '\'' +
                ", mainMajor='" + mainMajor + '\'' +
                ", highestEducation='" + highestEducation + '\'' +
                ", fName='" + fName + '\'' +
                ", mName='" + mName + '\'' +
                ", homeTelephone='" + homeTelephone + '\'' +
                ", householdType='" + householdType + '\'' +
                ", majorId=" + majorId +
                ", classId=" + classId +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getHiredate() {
        return hiredate;
    }

    public void setHiredate(String hiredate) {
        this.hiredate = hiredate;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    public String getAlmamater() {
        return almamater;
    }

    public void setAlmamater(String almamater) {
        this.almamater = almamater;
    }

    public String getMainMajor() {
        return mainMajor;
    }

    public void setMainMajor(String mainMajor) {
        this.mainMajor = mainMajor;
    }

    public String getHighestEducation() {
        return highestEducation;
    }

    public void setHighestEducation(String highestEducation) {
        this.highestEducation = highestEducation;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getmName() {
        return mName;
    }

    public void setmName(String mName) {
        this.mName = mName;
    }

    public String getHomeTelephone() {
        return homeTelephone;
    }

    public void setHomeTelephone(String homeTelephone) {
        this.homeTelephone = homeTelephone;
    }

    public String getHouseholdType() {
        return householdType;
    }

    public void setHouseholdType(String householdType) {
        this.householdType = householdType;
    }

    public Integer getMajorId() {
        return majorId;
    }

    public void setMajorId(Integer majorId) {
        this.majorId = majorId;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }
}
