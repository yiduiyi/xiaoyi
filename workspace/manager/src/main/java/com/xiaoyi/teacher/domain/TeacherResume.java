package com.xiaoyi.teacher.domain;

import java.util.Date;

public class TeacherResume {
    private String teacherResumeId;

    private String taughtSubject;

    private Date createTime;

    private Date updateTime;

    private Integer status;

    private String introduce;

    public String getTeacherResumeId() {
        return teacherResumeId;
    }

    public void setTeacherResumeId(String teacherResumeId) {
        this.teacherResumeId = teacherResumeId == null ? null : teacherResumeId.trim();
    }

    public String getTaughtSubject() {
        return taughtSubject;
    }

    public void setTaughtSubject(String taughtSubject) {
        this.taughtSubject = taughtSubject == null ? null : taughtSubject.trim();
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

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce == null ? null : introduce.trim();
    }
}