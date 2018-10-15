package com.xiaoyi.custom.domain;

import java.util.Date;

public class DaulVideoOrder {
    private String daulOrderId;

    private String parentId;

    private String studentId;

    private Short orderComesFrom;

    private String videoCourseId;

    private Date createTime;

    private Short gradeId;

    private Short semaster;

    private Short videoCourseType;

    public String getDaulOrderId() {
        return daulOrderId;
    }

    public void setDaulOrderId(String daulOrderId) {
        this.daulOrderId = daulOrderId == null ? null : daulOrderId.trim();
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId == null ? null : parentId.trim();
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId == null ? null : studentId.trim();
    }

    public Short getOrderComesFrom() {
        return orderComesFrom;
    }

    public void setOrderComesFrom(Short orderComesFrom) {
        this.orderComesFrom = orderComesFrom;
    }

    public String getVideoCourseId() {
        return videoCourseId;
    }

    public void setVideoCourseId(String videoCourseId) {
        this.videoCourseId = videoCourseId == null ? null : videoCourseId.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Short getGradeId() {
        return gradeId;
    }

    public void setGradeId(Short gradeId) {
        this.gradeId = gradeId;
    }

    public Short getSemaster() {
        return semaster;
    }

    public void setSemaster(Short semaster) {
        this.semaster = semaster;
    }

    public Short getVideoCourseType() {
        return videoCourseType;
    }

    public void setVideoCourseType(Short videoCourseType) {
        this.videoCourseType = videoCourseType;
    }
}