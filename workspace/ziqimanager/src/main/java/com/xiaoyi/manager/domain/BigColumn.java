package com.xiaoyi.manager.domain;

import java.util.Date;

public class BigColumn {
    private String bigColumnId;

    private String bigColumnName;

    private Byte bigColumnType;

    private String bigColumnLink;

    private Date createTime;

    private Date updateTime;

    private Byte status;

    public String getBigColumnId() {
        return bigColumnId;
    }

    public void setBigColumnId(String bigColumnId) {
        this.bigColumnId = bigColumnId == null ? null : bigColumnId.trim();
    }

    public String getBigColumnName() {
        return bigColumnName;
    }

    public void setBigColumnName(String bigColumnName) {
        this.bigColumnName = bigColumnName == null ? null : bigColumnName.trim();
    }

    public Byte getBigColumnType() {
        return bigColumnType;
    }

    public void setBigColumnType(Byte bigColumnType) {
        this.bigColumnType = bigColumnType;
    }

    public String getBigColumnLink() {
        return bigColumnLink;
    }

    public void setBigColumnLink(String bigColumnLink) {
        this.bigColumnLink = bigColumnLink == null ? null : bigColumnLink.trim();
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

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }
}