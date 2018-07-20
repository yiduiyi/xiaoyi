package com.xiaoyi.teacher.domain;

public class TeacherBalanceFromKey {
    private String lessontradeid;

    private String teacherid;

    public String getLessontradeid() {
        return lessontradeid;
    }

    public void setLessontradeid(String lessontradeid) {
        this.lessontradeid = lessontradeid == null ? null : lessontradeid.trim();
    }

    public String getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(String teacherid) {
        this.teacherid = teacherid == null ? null : teacherid.trim();
    }
}