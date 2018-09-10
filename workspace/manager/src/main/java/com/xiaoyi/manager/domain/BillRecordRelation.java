package com.xiaoyi.manager.domain;

import java.util.Date;

public class BillRecordRelation {
    private String billRecordId;

    private String billId;

    private String teacherid;

    private String teacherResumeRId;

    private Date createTime;

    private Date updateTime;

    private Integer status;

    public String getBillRecordId() {
        return billRecordId;
    }

    public void setBillRecordId(String billRecordId) {
        this.billRecordId = billRecordId == null ? null : billRecordId.trim();
    }

    public String getBillId() {
        return billId;
    }

    public void setBillId(String billId) {
        this.billId = billId == null ? null : billId.trim();
    }

    public String getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(String teacherid) {
        this.teacherid = teacherid == null ? null : teacherid.trim();
    }

    public String getTeacherResumeRId() {
        return teacherResumeRId;
    }

    public void setTeacherResumeRId(String teacherResumeRId) {
        this.teacherResumeRId = teacherResumeRId == null ? null : teacherResumeRId.trim();
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