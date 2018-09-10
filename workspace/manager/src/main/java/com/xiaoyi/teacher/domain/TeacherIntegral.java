package com.xiaoyi.teacher.domain;

import java.util.Date;

public class TeacherIntegral {
    private String teacherIntegralId;

    private String teacherid;

    private Float integralNum;

    private Integer operationType;

    private String operationDescription;

    private Date createTime;

    public String getTeacherIntegralId() {
        return teacherIntegralId;
    }

    public void setTeacherIntegralId(String teacherIntegralId) {
        this.teacherIntegralId = teacherIntegralId == null ? null : teacherIntegralId.trim();
    }

    public String getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(String teacherid) {
        this.teacherid = teacherid == null ? null : teacherid.trim();
    }

    public Float getIntegralNum() {
        return integralNum;
    }

    public void setIntegralNum(Float integralNum) {
        this.integralNum = integralNum;
    }

    public Integer getOperationType() {
        return operationType;
    }

    public void setOperationType(Integer operationType) {
        this.operationType = operationType;
    }

    public String getOperationDescription() {
        return operationDescription;
    }

    public void setOperationDescription(String operationDescription) {
        this.operationDescription = operationDescription == null ? null : operationDescription.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}