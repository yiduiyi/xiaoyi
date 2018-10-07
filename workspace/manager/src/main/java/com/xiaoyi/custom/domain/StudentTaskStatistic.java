package com.xiaoyi.custom.domain;

import java.util.Date;

public class StudentTaskStatistic extends StudentTaskStatisticKey {
    private Short accomplishedCount;

    private Short unfinishedCount;

    private Short totalAssignedTask;

    private Short accomplishedRate;

    private Short gradeId;

    private Byte courseId;

    private Date createTime;

    private Date updateTime;

    public Short getAccomplishedCount() {
        return accomplishedCount;
    }

    public void setAccomplishedCount(Short accomplishedCount) {
        this.accomplishedCount = accomplishedCount;
    }

    public Short getUnfinishedCount() {
        return unfinishedCount;
    }

    public void setUnfinishedCount(Short unfinishedCount) {
        this.unfinishedCount = unfinishedCount;
    }

    public Short getTotalAssignedTask() {
        return totalAssignedTask;
    }

    public void setTotalAssignedTask(Short totalAssignedTask) {
        this.totalAssignedTask = totalAssignedTask;
    }

    public Short getAccomplishedRate() {
        return accomplishedRate;
    }

    public void setAccomplishedRate(Short accomplishedRate) {
        this.accomplishedRate = accomplishedRate;
    }

    public Short getGradeId() {
        return gradeId;
    }

    public void setGradeId(Short gradeId) {
        this.gradeId = gradeId;
    }

    public Byte getCourseId() {
        return courseId;
    }

    public void setCourseId(Byte courseId) {
        this.courseId = courseId;
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
}