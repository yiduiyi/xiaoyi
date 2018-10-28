package com.xiaoyi.manager.domain;

public class Role {
    private String roleId;

    private String roleName;

    private Short roleCode;

    private String departmentId;

    private Short parentRoleCode;

    private Short menuCode;

    private Short grantMenuType;

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public Short getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(Short roleCode) {
        this.roleCode = roleCode;
    }

    public String getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId == null ? null : departmentId.trim();
    }

    public Short getParentRoleCode() {
        return parentRoleCode;
    }

    public void setParentRoleCode(Short parentRoleCode) {
        this.parentRoleCode = parentRoleCode;
    }

    public Short getMenuCode() {
        return menuCode;
    }

    public void setMenuCode(Short menuCode) {
        this.menuCode = menuCode;
    }

    public Short getGrantMenuType() {
        return grantMenuType;
    }

    public void setGrantMenuType(Short grantMenuType) {
        this.grantMenuType = grantMenuType;
    }
}