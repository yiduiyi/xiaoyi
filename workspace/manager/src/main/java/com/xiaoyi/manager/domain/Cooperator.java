package com.xiaoyi.manager.domain;

import java.util.Date;

public class Cooperator {
    private String cooperatorId;

    private String cooperatorName;

    private String telephone;

    private String contanctor;

    private String address;

    private Date createTime;

    private Date updateTime;

    private String channelManagerId;

    public String getCooperatorId() {
        return cooperatorId;
    }

    public void setCooperatorId(String cooperatorId) {
        this.cooperatorId = cooperatorId == null ? null : cooperatorId.trim();
    }

    public String getCooperatorName() {
        return cooperatorName;
    }

    public void setCooperatorName(String cooperatorName) {
        this.cooperatorName = cooperatorName == null ? null : cooperatorName.trim();
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public String getContanctor() {
        return contanctor;
    }

    public void setContanctor(String contanctor) {
        this.contanctor = contanctor == null ? null : contanctor.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
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

    public String getChannelManagerId() {
        return channelManagerId;
    }

    public void setChannelManagerId(String channelManagerId) {
        this.channelManagerId = channelManagerId == null ? null : channelManagerId.trim();
    }
}