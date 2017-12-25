package com.xiaoyi.manager.domain;

public class Picture {
    private String picid;

    private String picurl;

    private String picname;

    private Byte pictype;

    public String getPicid() {
        return picid;
    }

    public void setPicid(String picid) {
        this.picid = picid == null ? null : picid.trim();
    }

    public String getPicurl() {
        return picurl;
    }

    public void setPicurl(String picurl) {
        this.picurl = picurl == null ? null : picurl.trim();
    }

    public String getPicname() {
        return picname;
    }

    public void setPicname(String picname) {
        this.picname = picname == null ? null : picname.trim();
    }

    public Byte getPictype() {
        return pictype;
    }

    public void setPictype(Byte pictype) {
        this.pictype = pictype;
    }
}