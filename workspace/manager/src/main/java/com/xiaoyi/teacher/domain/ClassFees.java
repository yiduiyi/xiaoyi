package com.xiaoyi.teacher.domain;

import java.util.Date;

public class ClassFees {
    private String classFeeId;

    private String gradeId;

    private Integer teachingType;

    private Byte teachingLevel;

    private String feedback;

    private Float classCost;

    private Date createTime;

    private Date updateTime;

    private Integer status;

    public String getClassFeeId() {
        return classFeeId;
    }

    public void setClassFeeId(String classFeeId) {
        this.classFeeId = classFeeId == null ? null : classFeeId.trim();
    }

    public String getGradeId() {
        return gradeId;
    }

    public void setGradeId(String gradeId) {
        this.gradeId = gradeId == null ? null : gradeId.trim();
    }

    public Integer getTeachingType() {
        return teachingType;
    }

    public void setTeachingType(Integer teachingType) {
        this.teachingType = teachingType;
    }

    public Byte getTeachingLevel() {
        return teachingLevel;
    }

    public void setTeachingLevel(Byte teachingLevel) {
        this.teachingLevel = teachingLevel;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback == null ? null : feedback.trim();
    }

    public Float getClassCost() {
        return classCost;
    }

    public void setClassCost(Float classCost) {
        this.classCost = classCost;
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