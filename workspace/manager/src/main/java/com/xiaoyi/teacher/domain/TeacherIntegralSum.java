package com.xiaoyi.teacher.domain;

import java.util.Date;

public class TeacherIntegralSum {
    private String teacherid;

    private Float integralCount;

    private Date createTime;

    private Integer status;

    public String getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(String teacherid) {
        this.teacherid = teacherid == null ? null : teacherid.trim();
    }

    public Float getIntegralCount() {
        return integralCount;
    }

    public void setIntegralCount(Float integralCount) {
        this.integralCount = integralCount;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}