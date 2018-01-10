package com.xiaoyi.manager.domain;

import java.util.Date;

public class OrderSum extends OrderSumKey {
    private Date purchasetime;

    private Short totallessonnum;

    private Short lessonleftnum;

    private String teacherids;

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

    public String getTeacherids() {
        return teacherids;
    }

    public void setTeacherids(String teacherids) {
        this.teacherids = teacherids == null ? null : teacherids.trim();
    }
}