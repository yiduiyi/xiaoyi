package com.xiaoyi.manager.domain;

public class User extends UserKey {
    private String username;

    private String password;

    private Byte usertype;

    private Byte userprivilege;

    private Boolean loginstatus;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Byte getUsertype() {
        return usertype;
    }

    public void setUsertype(Byte usertype) {
        this.usertype = usertype;
    }

    public Byte getUserprivilege() {
        return userprivilege;
    }

    public void setUserprivilege(Byte userprivilege) {
        this.userprivilege = userprivilege;
    }

    public Boolean getLoginstatus() {
        return loginstatus;
    }

    public void setLoginstatus(Boolean loginstatus) {
        this.loginstatus = loginstatus;
    }
}