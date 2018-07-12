package com.xiaoyi.teacher.domain;

public class TeacherBalanceWithdrawKey {
    private String lessontradeid;

    private String teacherid;

    private String withdrawId;

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

    public String getWithdrawId() {
        return withdrawId;
    }

    public void setWithdrawId(String withdrawId) {
        this.withdrawId = withdrawId == null ? null : withdrawId.trim();
    }
}