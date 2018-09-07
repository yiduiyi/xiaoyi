package com.xiaoyi.teacher.domain;

import java.util.Date;

public class TeacherResumeRelation {
    private String teacherResumeRId;

    private String teacherid;

    private String teacherResumeId;

    private Date createTime;

    private Date updateTime;

    private Integer isDefault;

    private Integer status;

    public String getTeacherResumeRId() {
        return teacherResumeRId;
    }

    public void setTeacherResumeRId(String teacherResumeRId) {
        this.teacherResumeRId = teacherResumeRId == null ? null : teacherResumeRId.trim();
    }

    public String getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(String teacherid) {
        this.teacherid = teacherid == null ? null : teacherid.trim();
    }

    public String getTeacherResumeId() {
        return teacherResumeId;
    }

    public void setTeacherResumeId(String teacherResumeId) {
        this.teacherResumeId = teacherResumeId == null ? null : teacherResumeId.trim();
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

    public Integer getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(Integer isDefault) {
        this.isDefault = isDefault;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}