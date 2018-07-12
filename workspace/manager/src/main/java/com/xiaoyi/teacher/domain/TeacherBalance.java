package com.xiaoyi.teacher.domain;

public class TeacherBalance {
    private String teacherid;

    private Float balancingAccount;

    private Float totalLessonProfit;

    public String getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(String teacherid) {
        this.teacherid = teacherid == null ? null : teacherid.trim();
    }

    public Float getBalancingAccount() {
        return balancingAccount;
    }

    public void setBalancingAccount(Float balancingAccount) {
        this.balancingAccount = balancingAccount;
    }

    public Float getTotalLessonProfit() {
        return totalLessonProfit;
    }

    public void setTotalLessonProfit(Float totalLessonProfit) {
        this.totalLessonProfit = totalLessonProfit;
    }
}