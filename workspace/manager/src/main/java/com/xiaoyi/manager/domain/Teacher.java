package com.xiaoyi.manager.domain;

import java.util.Date;

public class Teacher {
    private String teacherid;

    private String teachername;

    private String picid;

    private String schoolid;

    private String gradeid;

    private Boolean sex;

    private Byte education;

    private String telnumber;

    private Byte teachinglevel;

    private Date regdate;

    private String notes;

    public String getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(String teacherid) {
        this.teacherid = teacherid == null ? null : teacherid.trim();
    }

    public String getTeachername() {
        return teachername;
    }

    public void setTeachername(String teachername) {
        this.teachername = teachername == null ? null : teachername.trim();
    }

    public String getPicid() {
        return picid;
    }

    public void setPicid(String picid) {
        this.picid = picid == null ? null : picid.trim();
    }

    public String getSchoolid() {
        return schoolid;
    }

    public void setSchoolid(String schoolid) {
        this.schoolid = schoolid == null ? null : schoolid.trim();
    }

    public String getGradeid() {
        return gradeid;
    }

    public void setGradeid(String gradeid) {
        this.gradeid = gradeid == null ? null : gradeid.trim();
    }

    public Boolean getSex() {
        return sex;
    }

    public void setSex(Boolean sex) {
        this.sex = sex;
    }

    public Byte getEducation() {
        return education;
    }

    public void setEducation(Byte education) {
        this.education = education;
    }

    public String getTelnumber() {
        return telnumber;
    }

    public void setTelnumber(String telnumber) {
        this.telnumber = telnumber == null ? null : telnumber.trim();
    }

    public Byte getTeachinglevel() {
        return teachinglevel;
    }

    public void setTeachinglevel(Byte teachinglevel) {
        this.teachinglevel = teachinglevel;
    }

    public Date getRegdate() {
        return regdate;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes == null ? null : notes.trim();
    }
}