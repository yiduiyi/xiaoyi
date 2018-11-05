package com.xiaoyi.teacher.domain;

public class TeachingDaulOrderKey {
    private String innerOrderId;

    private String teacherId;

    private String teachingId;

    public String getInnerOrderId() {
        return innerOrderId;
    }

    public void setInnerOrderId(String innerOrderId) {
        this.innerOrderId = innerOrderId == null ? null : innerOrderId.trim();
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId == null ? null : teacherId.trim();
    }

    public String getTeachingId() {
        return teachingId;
    }

    public void setTeachingId(String teachingId) {
        this.teachingId = teachingId == null ? null : teachingId.trim();
    }
}