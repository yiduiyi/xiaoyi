package com.xiaoyi.teacher.domain;

import java.util.Date;

public class TeachingDaulOrder extends TeachingDaulOrderKey {
    private String xiaoeOrderId;

    private Date genDate;

    private Date updateTime;

    private Short orderStatus;

    private String parentId;

    private String studentId;

    private Short gradeId;

    private Short courseId;

    private Byte semaster;

    private String videoCourseId;

    public String getXiaoeOrderId() {
        return xiaoeOrderId;
    }

    public void setXiaoeOrderId(String xiaoeOrderId) {
        this.xiaoeOrderId = xiaoeOrderId == null ? null : xiaoeOrderId.trim();
    }

    public Date getGenDate() {
        return genDate;
    }

    public void setGenDate(Date genDate) {
        this.genDate = genDate;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Short getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Short orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId == null ? null : parentId.trim();
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

    public Byte getSemaster() {
        return semaster;
    }

    public void setSemaster(Byte semaster) {
        this.semaster = semaster;
    }

    public String getVideoCourseId() {
        return videoCourseId;
    }

    public void setVideoCourseId(String videoCourseId) {
        this.videoCourseId = videoCourseId == null ? null : videoCourseId.trim();
    }
}