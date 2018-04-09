package com.xiaoyi.manager.domain;

import java.util.Date;

public class OrderSum extends OrderSumKey {
    private Date purchasetime;

    private Float totallessonnum;

    private Float lessonleftnum;

    private String teachingids;

    public Date getPurchasetime() {
        return purchasetime;
    }

    public void setPurchasetime(Date purchasetime) {
        this.purchasetime = purchasetime;
    }

    public Float getTotallessonnum() {
        return totallessonnum;
    }

    public void setTotallessonnum(Float totallessonnum) {
        this.totallessonnum = totallessonnum;
    }

    public Float getLessonleftnum() {
        return lessonleftnum;
    }

    public void setLessonleftnum(Float lessonleftnum) {
        this.lessonleftnum = lessonleftnum;
    }

    public String getTeachingids() {
        return teachingids;
    }

    public void setTeachingids(String teachingids) {
        this.teachingids = teachingids == null ? null : teachingids.trim();
    }
}