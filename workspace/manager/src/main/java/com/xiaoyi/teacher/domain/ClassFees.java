package com.xiaoyi.teacher.domain;

import java.util.Date;

public class ClassFees {
    private String classFeeId;

    private String gradeId;

    private Integer teachingType;

    private Float generalClassFee;

    private Float silverClassFee;

    private Float goldClassFee;

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

    public Float getGeneralClassFee() {
        return generalClassFee;
    }

    public void setGeneralClassFee(Float generalClassFee) {
        this.generalClassFee = generalClassFee;
    }

    public Float getSilverClassFee() {
        return silverClassFee;
    }

    public void setSilverClassFee(Float silverClassFee) {
        this.silverClassFee = silverClassFee;
    }

    public Float getGoldClassFee() {
        return goldClassFee;
    }

    public void setGoldClassFee(Float goldClassFee) {
        this.goldClassFee = goldClassFee;
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