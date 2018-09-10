package com.xiaoyi.teacher.domain;

import java.util.Date;

public class TeacherSpaceSet {
    private String teacherSpaceSetId;

    private String teacherid;

    private Integer isRemind;

    private Date createTime;

    private Date updateTime;

    private Integer status;

    public String getTeacherSpaceSetId() {
        return teacherSpaceSetId;
    }

    public void setTeacherSpaceSetId(String teacherSpaceSetId) {
        this.teacherSpaceSetId = teacherSpaceSetId == null ? null : teacherSpaceSetId.trim();
    }

    public String getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(String teacherid) {
        this.teacherid = teacherid == null ? null : teacherid.trim();
    }

    public Integer getIsRemind() {
        return isRemind;
    }

    public void setIsRemind(Integer isRemind) {
        this.isRemind = isRemind;
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