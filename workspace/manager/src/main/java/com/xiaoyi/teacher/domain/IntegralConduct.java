package com.xiaoyi.teacher.domain;

import java.util.Date;

public class IntegralConduct {
    private String integralConductId;

    private String integralConductName;

    private Float integralConductValue;

    private Integer integralConductType;

    private Date createTime;

    private Date updateTime;

    private Integer status;

    private String integralConductDesc;

    public String getIntegralConductId() {
        return integralConductId;
    }

    public void setIntegralConductId(String integralConductId) {
        this.integralConductId = integralConductId == null ? null : integralConductId.trim();
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

    public String getIntegralConductDesc() {
        return integralConductDesc;
    }

    public void setIntegralConductDesc(String integralConductDesc) {
        this.integralConductDesc = integralConductDesc == null ? null : integralConductDesc.trim();
    }
}