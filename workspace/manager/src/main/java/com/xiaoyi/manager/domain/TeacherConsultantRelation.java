package com.xiaoyi.manager.domain;

import java.util.Date;

public class TeacherConsultantRelation {
    private String teacherConsultantId;

    private String teacherid;

    private String consultantId;

    private Date createTime;

    private Date updateTime;

    private Integer status;

    public String getTeacherConsultantId() {
        return teacherConsultantId;
    }

    public void setTeacherConsultantId(String teacherConsultantId) {
        this.teacherConsultantId = teacherConsultantId == null ? null : teacherConsultantId.trim();
    }

    public String getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(String teacherid) {
        this.teacherid = teacherid == null ? null : teacherid.trim();
    }

    public String getConsultantId() {
        return consultantId;
    }

    public void setConsultantId(String consultantId) {
        this.consultantId = consultantId == null ? null : consultantId.trim();
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}