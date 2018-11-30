package com.xiaoyi.manager.domain;

public class ChannelManagerGroup {
    private String channelManagerGroupId;

    private String channelManagerGroupName;

    private String channelManagerId;

    private String roleIds;

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

    public String getRoleIds() {
        return roleIds;
    }

    public void setRoleIds(String roleIds) {
        this.roleIds = roleIds == null ? null : roleIds.trim();
    }
}