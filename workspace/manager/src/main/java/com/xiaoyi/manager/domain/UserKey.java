package com.xiaoyi.manager.domain;

public class UserKey {
    private String useraccountid;

    private String userid;

    public String getUseraccountid() {
        return useraccountid;
    }

    public void setUseraccountid(String useraccountid) {
        this.useraccountid = useraccountid == null ? null : useraccountid.trim();
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }
}