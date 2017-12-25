package com.xiaoyi.manager.domain;

public class Student {
    private String memberid;

    private String name;

    private String classid;

    private String gradeid;

    private String schoolid;

    private String picid;

    private Boolean isstarmember;

    private Boolean gentle;

    private String telnum;

    public String getMemberid() {
        return memberid;
    }

    public void setMemberid(String memberid) {
        this.memberid = memberid == null ? null : memberid.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getClassid() {
        return classid;
    }

    public void setClassid(String classid) {
        this.classid = classid == null ? null : classid.trim();
    }

    public String getGradeid() {
        return gradeid;
    }

    public void setGradeid(String gradeid) {
        this.gradeid = gradeid == null ? null : gradeid.trim();
    }

    public String getSchoolid() {
        return schoolid;
    }

    public void setSchoolid(String schoolid) {
        this.schoolid = schoolid == null ? null : schoolid.trim();
    }

    public String getPicid() {
        return picid;
    }

    public void setPicid(String picid) {
        this.picid = picid == null ? null : picid.trim();
    }

    public Boolean getIsstarmember() {
        return isstarmember;
    }

    public void setIsstarmember(Boolean isstarmember) {
        this.isstarmember = isstarmember;
    }

    public Boolean getGentle() {
        return gentle;
    }

    public void setGentle(Boolean gentle) {
        this.gentle = gentle;
    }

    public String getTelnum() {
        return telnum;
    }

    public void setTelnum(String telnum) {
        this.telnum = telnum == null ? null : telnum.trim();
    }
}