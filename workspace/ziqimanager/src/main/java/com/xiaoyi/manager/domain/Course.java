package com.xiaoyi.manager.domain;

import java.util.Date;

public class Course {
    private String courseId;

    private String bigColumnId;

    private String courseName;

    private Byte courseType;

    private Integer talkNumber;

    private Integer gradeId;

    private String subjectsId;

    private Integer semester;

    private String h5Link;

    private Date createTime;

    private Date updateTime;

    private Byte status;

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId == null ? null : courseId.trim();
    }

    public String getBigColumnId() {
        return bigColumnId;
    }

    public void setBigColumnId(String bigColumnId) {
        this.bigColumnId = bigColumnId == null ? null : bigColumnId.trim();
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName == null ? null : courseName.trim();
    }

    public Byte getCourseType() {
        return courseType;
    }

    public void setCourseType(Byte courseType) {
        this.courseType = courseType;
    }

    public Integer getTalkNumber() {
        return talkNumber;
    }

    public void setTalkNumber(Integer talkNumber) {
        this.talkNumber = talkNumber;
    }

    public Integer getGradeId() {
        return gradeId;
    }

    public void setGradeId(Integer gradeId) {
        this.gradeId = gradeId;
    }

    public String getSubjectsId() {
        return subjectsId;
    }

    public void setSubjectsId(String subjectsId) {
        this.subjectsId = subjectsId == null ? null : subjectsId.trim();
    }

    public Integer getSemester() {
        return semester;
    }

    public void setSemester(Integer semester) {
        this.semester = semester;
    }

    public String getH5Link() {
        return h5Link;
    }

    public void setH5Link(String h5Link) {
        this.h5Link = h5Link == null ? null : h5Link.trim();
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

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }
}