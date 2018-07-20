package com.xiaoyi.teacher.domain;

public class TeacherBalance {
    private String teacherid;

    private Float balanceAccount;

    private Float totalBalanceProfit;

    private String balanceFrom;

    private Float balanceProfitLeft;

    public String getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(String teacherid) {
        this.teacherid = teacherid == null ? null : teacherid.trim();
    }

    public Float getBalanceAccount() {
        return balanceAccount;
    }

    public void setBalanceAccount(Float balanceAccount) {
        this.balanceAccount = balanceAccount;
    }

    public Float getTotalBalanceProfit() {
        return totalBalanceProfit;
    }

    public void setTotalBalanceProfit(Float totalBalanceProfit) {
        this.totalBalanceProfit = totalBalanceProfit;
    }

    public String getBalanceFrom() {
        return balanceFrom;
    }

    public void setBalanceFrom(String balanceFrom) {
        this.balanceFrom = balanceFrom == null ? null : balanceFrom.trim();
    }

    public Float getBalanceProfitLeft() {
        return balanceProfitLeft;
    }

    public void setBalanceProfitLeft(Float balanceProfitLeft) {
        this.balanceProfitLeft = balanceProfitLeft;
    }
}