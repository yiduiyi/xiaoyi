package com.xiaoyi.teacher.domain;

import java.util.Date;

public class TeacherBalanceWithdraw {
    private String teacherid;

    private String withdrawId;

    private Date applyDate;

    private Float withdraw;

    private Float balanceLeft;

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

    public Date getApplyDate() {
        return applyDate;
    }

    public void setApplyDate(Date applyDate) {
        this.applyDate = applyDate;
    }

    public Float getWithdraw() {
        return withdraw;
    }

    public void setWithdraw(Float withdraw) {
        this.withdraw = withdraw;
    }

    public Float getBalanceLeft() {
        return balanceLeft;
    }

    public void setBalanceLeft(Float balanceLeft) {
        this.balanceLeft = balanceLeft;
    }
}