package com.xiaoyi.ma.domain;

public class Account {
    private String accountid;

    private Byte accounttype;

    private String accountnumber;

    private Byte status;

    public String getAccountid() {
        return accountid;
    }

    public void setAccountid(String accountid) {
        this.accountid = accountid == null ? null : accountid.trim();
    }

    public Byte getAccounttype() {
        return accounttype;
    }

    public void setAccounttype(Byte accounttype) {
        this.accounttype = accounttype;
    }

    public String getAccountnumber() {
        return accountnumber;
    }

    public void setAccountnumber(String accountnumber) {
        this.accountnumber = accountnumber == null ? null : accountnumber.trim();
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }
}