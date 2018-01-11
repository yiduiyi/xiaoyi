package com.xiaoyi.manager.domain;

import java.util.Date;

public class OrderSum extends OrderSumKey {
    private Date purchasetime;

    private Short totallessonnum;

    private Short lessonleftnum;

    private String teachingids;

    public Date getPurchasetime() {
        return purchasetime;
    }

    public void setPurchasetime(Date purchasetime) {
        this.purchasetime = purchasetime;
    }

    public Short getTotallessonnum() {
        return totallessonnum;
    }

    public void setTotallessonnum(Short totallessonnum) {
        this.totallessonnum = totallessonnum;
    }

    public Short getLessonleftnum() {
        return lessonleftnum;
    }

    public void setLessonleftnum(Short lessonleftnum) {
        this.lessonleftnum = lessonleftnum;
    }

    public String getTeachingids() {
        return teachingids;
    }

    public void setTeachingids(String teachingids) {
        this.teachingids = teachingids == null ? null : teachingids.trim();
    }
}