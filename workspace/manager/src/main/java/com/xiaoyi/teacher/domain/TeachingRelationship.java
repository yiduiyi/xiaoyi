package com.xiaoyi.teacher.domain;

import java.util.Date;

public class TeachingRelationship {
    private String teachingId;

    private String teacherId;

    private String studentId;

    private Short gradeId;

    private Short courseId;

    private Short lessonType;

    private Date createTime;

    private Date updateTime;

    private Short status;

    public String getTeachingId() {
        return teachingId;
    }

    public void setTeachingId(String teachingId) {
        this.teachingId = teachingId == null ? null : teachingId.trim();
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId == null ? null : teacherId.trim();
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId == null ? null : studentId.trim();
    }

    public Short getGradeId() {
        return gradeId;
    }

    public void setGradeId(Short gradeId) {
        this.gradeId = gradeId;
    }

    public Short getCourseId() {
        return courseId;
    }

    public void setCourseId(Short courseId) {
        this.courseId = courseId;
    }

    public Short getLessonType() {
        return lessonType;
    }

    public void setLessonType(Short lessonType) {
        this.lessonType = lessonType;
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

    public Short getStatus() {
        return status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }
}