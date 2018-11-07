package com.xiaoyi.manager.domain;

import java.util.Date;

public class Auditions {
    private String auditionId;

    private String studentId;

    private String parentId;

    private Short gradeId;

    private Short subjectId;

    private Short comeFrom;

    private String cooperatorId;

    private Short status;

    private String orderId;

    private String notes;

    private String consultantGroupId;

    private String consultantId;

    private Date createTime;

    private Date updateTime;

    private Short teachingway;

    public String getAuditionId() {
        return auditionId;
    }

    public void setAuditionId(String auditionId) {
        this.auditionId = auditionId == null ? null : auditionId.trim();
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId == null ? null : studentId.trim();
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId == null ? null : parentId.trim();
    }

    public Short getGradeId() {
        return gradeId;
    }

    public void setGradeId(Short gradeId) {
        this.gradeId = gradeId;
    }

    public Short getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Short subjectId) {
        this.subjectId = subjectId;
    }

    public Short getComeFrom() {
        return comeFrom;
    }

    public void setComeFrom(Short comeFrom) {
        this.comeFrom = comeFrom;
    }

    public String getCooperatorId() {
        return cooperatorId;
    }

    public void setCooperatorId(String cooperatorId) {
        this.cooperatorId = cooperatorId == null ? null : cooperatorId.trim();
    }

    public Short getStatus() {
        return status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes == null ? null : notes.trim();
    }

    public String getConsultantGroupId() {
        return consultantGroupId;
    }

    public void setConsultantGroupId(String consultantGroupId) {
        this.consultantGroupId = consultantGroupId == null ? null : consultantGroupId.trim();
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

    public Short getTeachingway() {
        return teachingway;
    }

    public void setTeachingway(Short teachingway) {
        this.teachingway = teachingway;
    }
}