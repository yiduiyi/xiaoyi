package com.xiaoyi.teacher.domain;

public class TeacherBalanceDailyProfitsKey {
    private String profitId;

    private String teacherid;

    public String getProfitId() {
        return profitId;
    }

    public void setProfitId(String profitId) {
        this.profitId = profitId == null ? null : profitId.trim();
    }

    public String getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(String teacherid) {
        this.teacherid = teacherid == null ? null : teacherid.trim();
    }
}