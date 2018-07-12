package com.xiaoyi.teacher.domain;

import java.util.Date;

public class TeacherBalanceWithdraw extends TeacherBalanceWithdrawKey {
    private Date applyDate;

    private Float withdraw;

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
}