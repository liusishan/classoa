package cn.king.pojo;

import java.util.ArrayList;
import java.util.List;

/**
 * @Title:
 * @CreateTime: 2018/12/28 16:02
 * @Author: king
 * @Description:
 */
public class Permission {
    private Integer id;
    private String permissionName;
    private Integer pid;
    private String url;
    private String type;
    private String icon;
    private String remark;

    //子结点
    private List<Permission> children = new ArrayList<>();

    @Override
    public String toString() {
        return "Permission{" +
                "id=" + id +
                ", permissionName='" + permissionName + '\'' +
                ", pid=" + pid +
                ", url='" + url + '\'' +
                ", type='" + type + '\'' +
                ", icon='" + icon + '\'' +
                ", remark='" + remark + '\'' +
                ", children=" + children +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPermissionName() {
        return permissionName;
    }

    public void setPermissionName(String permissionName) {
        this.permissionName = permissionName;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public List<Permission> getChildren() {
        return children;
    }

    public void setChildren(List<Permission> children) {
        this.children = children;
    }
}
