package com.xiaoyi.manager.domain;

public class LessonType {
    private Integer lessontype;

    private Float lessonprice;

    private String lessonname;

    private String coursename;

    private Boolean needbook;

    private Float discountprice;

    private Byte teachingway;

    private Byte isholiday;

    private Short coursecnt;

    public Integer getLessontype() {
        return lessontype;
    }

    public void setLessontype(Integer lessontype) {
        this.lessontype = lessontype;
    }

    public Float getLessonprice() {
        return lessonprice;
    }

    public void setLessonprice(Float lessonprice) {
        this.lessonprice = lessonprice;
    }

    public String getLessonname() {
        return lessonname;
    }

    public void setLessonname(String lessonname) {
        this.lessonname = lessonname == null ? null : lessonname.trim();
    }

    public String getCoursename() {
        return coursename;
    }

    public void setCoursename(String coursename) {
        this.coursename = coursename == null ? null : coursename.trim();
    }

    public Boolean getNeedbook() {
        return needbook;
    }

    public void setNeedbook(Boolean needbook) {
        this.needbook = needbook;
    }

    public Float getDiscountprice() {
        return discountprice;
    }

    public void setDiscountprice(Float discountprice) {
        this.discountprice = discountprice;
    }

    public Byte getTeachingway() {
        return teachingway;
    }

    public void setTeachingway(Byte teachingway) {
        this.teachingway = teachingway;
    }

    public Byte getIsholiday() {
        return isholiday;
    }

    public void setIsholiday(Byte isholiday) {
        this.isholiday = isholiday;
    }

    public Short getCoursecnt() {
        return coursecnt;
    }

    public void setCoursecnt(Short coursecnt) {
        this.coursecnt = coursecnt;
    }
}