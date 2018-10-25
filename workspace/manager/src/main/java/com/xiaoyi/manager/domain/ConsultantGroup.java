package com.xiaoyi.manager.domain;

public class ConsultantGroup {
    private String consultantGroupId;

    private String consultantGroupName;

    private String consultantId;

    private String roleId;

    public String getConsultantGroupId() {
        return consultantGroupId;
    }

    public void setConsultantGroupId(String consultantGroupId) {
        this.consultantGroupId = consultantGroupId == null ? null : consultantGroupId.trim();
    }

    public String getConsultantGroupName() {
        return consultantGroupName;
    }

    public void setConsultantGroupName(String consultantGroupName) {
        this.consultantGroupName = consultantGroupName == null ? null : consultantGroupName.trim();
    }

    public String getConsultantId() {
        return consultantId;
    }

    public void setConsultantId(String consultantId) {
        this.consultantId = consultantId == null ? null : consultantId.trim();
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }
}