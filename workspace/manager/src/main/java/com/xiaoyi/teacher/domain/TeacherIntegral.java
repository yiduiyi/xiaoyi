package com.xiaoyi.teacher.domain;

import java.util.Date;

public class TeacherIntegral {
    private String teacherIntegralId;

    private String teacherid;

    private String integralConductName;

    private Float integralConductValue;

    private Integer integralConductType;

    private Date createTime;

    private String integralConductDesc;

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

    public String getIntegralConductName() {
        return integralConductName;
    }

    public void setIntegralConductName(String integralConductName) {
        this.integralConductName = integralConductName == null ? null : integralConductName.trim();
    }

    public Float getIntegralConductValue() {
        return integralConductValue;
    }

    public void setIntegralConductValue(Float integralConductValue) {
        this.integralConductValue = integralConductValue;
    }

    public Integer getIntegralConductType() {
        return integralConductType;
    }

    public void setIntegralConductType(Integer integralConductType) {
        this.integralConductType = integralConductType;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getIntegralConductDesc() {
        return integralConductDesc;
    }

    public void setIntegralConductDesc(String integralConductDesc) {
        this.integralConductDesc = integralConductDesc == null ? null : integralConductDesc.trim();
    }
}