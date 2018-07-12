package com.xiaoyi.teacher.domain;

public class TeacherBalanceProfits extends TeacherBalanceProfitsKey {
    private Float balanceProfit;

    private Float profitRate;

    private Float actualpay;

    private Float balanceLeft;

    public Float getBalanceProfit() {
        return balanceProfit;
    }

    public void setBalanceProfit(Float balanceProfit) {
        this.balanceProfit = balanceProfit;
    }

    public Float getProfitRate() {
        return profitRate;
    }

    public void setProfitRate(Float profitRate) {
        this.profitRate = profitRate;
    }

    public Float getActualpay() {
        return actualpay;
    }

    public void setActualpay(Float actualpay) {
        this.actualpay = actualpay;
    }

    public Float getBalanceLeft() {
        return balanceLeft;
    }

    public void setBalanceLeft(Float balanceLeft) {
        this.balanceLeft = balanceLeft;
    }
}