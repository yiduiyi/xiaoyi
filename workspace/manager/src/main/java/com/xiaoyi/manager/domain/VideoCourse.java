package com.xiaoyi.manager.domain;

import java.util.Date;

public class VideoCourse {
    private String videoCourseId;

    private String videoCourseName;

    private Short gradeId;

    private Byte semaster;

    private Short courseId;

    private Byte videoCourseType;

    private String h5VideoLink;

    private Byte status;

    private String chapterId;

    private Date uploadTime;

    private Date updateTime;

    public String getVideoCourseId() {
        return videoCourseId;
    }

    public void setVideoCourseId(String videoCourseId) {
        this.videoCourseId = videoCourseId == null ? null : videoCourseId.trim();
    }

    public String getVideoCourseName() {
        return videoCourseName;
    }

    public void setVideoCourseName(String videoCourseName) {
        this.videoCourseName = videoCourseName == null ? null : videoCourseName.trim();
    }

    public Short getGradeId() {
        return gradeId;
    }

    public void setGradeId(Short gradeId) {
        this.gradeId = gradeId;
    }

    public Byte getSemaster() {
        return semaster;
    }

    public void setSemaster(Byte semaster) {
        this.semaster = semaster;
    }

    public Short getCourseId() {
        return courseId;
    }

    public void setCourseId(Short courseId) {
        this.courseId = courseId;
    }

    public Byte getVideoCourseType() {
        return videoCourseType;
    }

    public void setVideoCourseType(Byte videoCourseType) {
        this.videoCourseType = videoCourseType;
    }

    public String getH5VideoLink() {
        return h5VideoLink;
    }

    public void setH5VideoLink(String h5VideoLink) {
        this.h5VideoLink = h5VideoLink == null ? null : h5VideoLink.trim();
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public String getChapterId() {
        return chapterId;
    }

    public void setChapterId(String chapterId) {
        this.chapterId = chapterId == null ? null : chapterId.trim();
    }

    public Date getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Date uploadTime) {
        this.uploadTime = uploadTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}