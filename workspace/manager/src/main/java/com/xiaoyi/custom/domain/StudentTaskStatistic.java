package com.xiaoyi.custom.domain;

import java.util.Date;

public class StudentTaskStatistic extends StudentTaskStatisticKey {

    private Short finishCount;

    private Short unfinishCount;

    private Short totalTasks;

    private Short accomplishRate;

    private Short gradeId;

    private Byte courseId;

    private Date createTime;

    private Date updateTime;

    public Short getFinishCount() {
        return finishCount;
    }

    public void setFinishCount(Short finishCount) {
        this.finishCount = finishCount;
    }

    public Short getUnfinishCount() {
        return unfinishCount;
    }

    public void setUnfinishCount(Short unfinishCount) {
        this.unfinishCount = unfinishCount;
    }

    public Short getTotalTasks() {
        return totalTasks;
    }

    public void setTotalTasks(Short totalTasks) {
        this.totalTasks = totalTasks;
    }

    public Short getAccomplishRate() {
        return accomplishRate;
    }

    public void setAccomplishRate(Short accomplishRate) {
        this.accomplishRate = accomplishRate;

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