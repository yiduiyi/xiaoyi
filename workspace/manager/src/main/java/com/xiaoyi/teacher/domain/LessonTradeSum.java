package com.xiaoyi.teacher.domain;

public class LessonTradeSum {
    private String teacherid;

    private Float checkedlessonnum;

    private Float withdrawlessonnum;

    private Float frozenlessonnum;

    private Float totallessonnum;

    private Double totalincome;

    public String getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(String teacherid) {
        this.teacherid = teacherid == null ? null : teacherid.trim();
    }

    public Float getCheckedlessonnum() {
        return checkedlessonnum;
    }

    public void setCheckedlessonnum(Float checkedlessonnum) {
        this.checkedlessonnum = checkedlessonnum;
    }

    public Float getWithdrawlessonnum() {
        return withdrawlessonnum;
    }

    public void setWithdrawlessonnum(Float withdrawlessonnum) {
        this.withdrawlessonnum = withdrawlessonnum;
    }

    public Float getFrozenlessonnum() {
        return frozenlessonnum;
    }

    public void setFrozenlessonnum(Float frozenlessonnum) {
        this.frozenlessonnum = frozenlessonnum;
    }

    public Float getTotallessonnum() {
        return totallessonnum;
    }

    public void setTotallessonnum(Float totallessonnum) {
        this.totallessonnum = totallessonnum;
    }

    public Double getTotalincome() {
        return totalincome;
    }

    public void setTotalincome(Double totalincome) {
        this.totalincome = totalincome;
    }
}