package com.xiaoyi.manager.domain;

public class ChannelManagerGroup {
    private String channelManagerGroupId;

    private String channelManagerGroupName;

    private String channelManagerId;

    private String roleId;

    public String getChannelManagerGroupId() {
        return channelManagerGroupId;
    }

    public void setChannelManagerGroupId(String channelManagerGroupId) {
        this.channelManagerGroupId = channelManagerGroupId == null ? null : channelManagerGroupId.trim();
    }

    public String getChannelManagerGroupName() {
        return channelManagerGroupName;
    }

    public void setChannelManagerGroupName(String channelManagerGroupName) {
        this.channelManagerGroupName = channelManagerGroupName == null ? null : channelManagerGroupName.trim();
    }

    public String getChannelManagerId() {
        return channelManagerId;
    }

    public void setChannelManagerId(String channelManagerId) {
        this.channelManagerId = channelManagerId == null ? null : channelManagerId.trim();
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }
}