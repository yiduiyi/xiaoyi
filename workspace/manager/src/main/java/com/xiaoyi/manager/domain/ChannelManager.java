package com.xiaoyi.manager.domain;

import java.util.Date;

public class ChannelManager {
    private String channelManagerId;

    private String channelManagerGroupId;

    private String channelManagerName;

    private Integer intendedNumber;

    private String roleIds;

    private Date createTime;

    private String telephone;

    private String openId;

    private Short status;

    public String getChannelManagerId() {
        return channelManagerId;
    }

    public void setChannelManagerId(String channelManagerId) {
        this.channelManagerId = channelManagerId == null ? null : channelManagerId.trim();
    }

    public String getChannelManagerGroupId() {
        return channelManagerGroupId;
    }

    public void setChannelManagerGroupId(String channelManagerGroupId) {
        this.channelManagerGroupId = channelManagerGroupId == null ? null : channelManagerGroupId.trim();
    }

    public String getChannelManagerName() {
        return channelManagerName;
    }

    public void setChannelManagerName(String channelManagerName) {
        this.channelManagerName = channelManagerName == null ? null : channelManagerName.trim();
    }

    public Integer getIntendedNumber() {
        return intendedNumber;
    }

    public void setIntendedNumber(Integer intendedNumber) {
        this.intendedNumber = intendedNumber;
    }

    public String getRoleIds() {
        return roleIds;
    }

    public void setRoleIds(String roleIds) {
        this.roleIds = roleIds == null ? null : roleIds.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId == null ? null : openId.trim();
    }

    public Short getStatus() {
        return status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }
}