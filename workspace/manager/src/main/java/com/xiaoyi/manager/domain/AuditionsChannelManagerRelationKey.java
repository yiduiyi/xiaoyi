package com.xiaoyi.manager.domain;

public class AuditionsChannelManagerRelationKey {
    private String auditionId;

    private String channelManagerId;

    public String getAuditionId() {
        return auditionId;
    }

    public void setAuditionId(String auditionId) {
        this.auditionId = auditionId == null ? null : auditionId.trim();
    }

    public String getChannelManagerId() {
        return channelManagerId;
    }

    public void setChannelManagerId(String channelManagerId) {
        this.channelManagerId = channelManagerId == null ? null : channelManagerId.trim();
    }
}