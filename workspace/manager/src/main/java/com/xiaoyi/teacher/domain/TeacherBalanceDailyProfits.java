package com.xiaoyi.teacher.domain;

import java.util.Date;

public class TeacherBalanceDailyProfits extends TeacherBalanceDailyProfitsKey {
    private Date generateDate;

    private Float balanceProfit;

    private Float profitRate;

    private Float balanceLeft;

    public Date getGenerateDate() {
        return generateDate;
    }

    public void setGenerateDate(Date generateDate) {
        this.generateDate = generateDate;
    }

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

    public Float getBalanceLeft() {
        return balanceLeft;
    }

    public void setBalanceLeft(Float balanceLeft) {
        this.balanceLeft = balanceLeft;
    }
}