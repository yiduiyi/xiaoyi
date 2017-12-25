package com.xiaoyi.manager.domain;

public class Account {
    private String accountid;

    private int accounttype;

    private String accountnumber;

    private int status;

    public String getAccountid() {
        return accountid;
    }

    public void setAccountid(String accountid) {
        this.accountid = accountid == null ? null : accountid.trim();
    }

    public int getAccounttype() {
        return accounttype;
    }

    public void setAccounttype(int i) {
        this.accounttype = i;
    }

    public String getAccountnumber() {
        return accountnumber;
    }

    public void setAccountnumber(String accountnumber) {
        this.accountnumber = accountnumber == null ? null : accountnumber.trim();
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}