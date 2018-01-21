package com.xiaoyi.teacher.domain;

public class LessonTradeSum {
    private String teacherid;

    private Short checkedlessonnum;

    private Short withdrawlessonnum;

    private Short frozenlessonnum;

    private Short totallessonnum;

    private Double totalincome;

    public String getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(String teacherid) {
        this.teacherid = teacherid == null ? null : teacherid.trim();
    }

    public Short getCheckedlessonnum() {
        return checkedlessonnum;
    }

    public void setCheckedlessonnum(Short checkedlessonnum) {
        this.checkedlessonnum = checkedlessonnum;
    }

    public Short getWithdrawlessonnum() {
        return withdrawlessonnum;
    }

    public void setWithdrawlessonnum(Short withdrawlessonnum) {
        this.withdrawlessonnum = withdrawlessonnum;
    }

    public Short getFrozenlessonnum() {
        return frozenlessonnum;
    }

    public void setFrozenlessonnum(Short frozenlessonnum) {
        this.frozenlessonnum = frozenlessonnum;
    }

    public Short getTotallessonnum() {
        return totallessonnum;
    }

    public void setTotallessonnum(Short totallessonnum) {
        this.totallessonnum = totallessonnum;
    }

    public Double getTotalincome() {
        return totalincome;
    }

    public void setTotalincome(Double totalincome) {
        this.totalincome = totalincome;
    }
}