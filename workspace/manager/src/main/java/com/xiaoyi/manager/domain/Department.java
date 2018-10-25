package com.xiaoyi.manager.domain;

import java.util.Date;

public class Department {
    private String departmentId;

    private Short departmentType;

    private String departmentDesc;

    private Short menuCode;

    private Short parentMenuCode;

    private Date createTime;

    private Date updateTime;

    public String getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId == null ? null : departmentId.trim();
    }

    public Short getDepartmentType() {
        return departmentType;
    }

    public void setDepartmentType(Short departmentType) {
        this.departmentType = departmentType;
    }

    public String getDepartmentDesc() {
        return departmentDesc;
    }

    public void setDepartmentDesc(String departmentDesc) {
        this.departmentDesc = departmentDesc == null ? null : departmentDesc.trim();
    }

    public Short getMenuCode() {
        return menuCode;
    }

    public void setMenuCode(Short menuCode) {
        this.menuCode = menuCode;
    }

    public Short getParentMenuCode() {
        return parentMenuCode;
    }

    public void setParentMenuCode(Short parentMenuCode) {
        this.parentMenuCode = parentMenuCode;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}