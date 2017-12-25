package com.xiaoyi.manager.domain;

public class School {
    private String schoolid;

    private String schoolname;

    private String schooladdress;

    private String terminfo;

    public String getSchoolid() {
        return schoolid;
    }

    public void setSchoolid(String schoolid) {
        this.schoolid = schoolid == null ? null : schoolid.trim();
    }

    public String getSchoolname() {
        return schoolname;
    }

    public void setSchoolname(String schoolname) {
        this.schoolname = schoolname == null ? null : schoolname.trim();
    }

    public String getSchooladdress() {
        return schooladdress;
    }

    public void setSchooladdress(String schooladdress) {
        this.schooladdress = schooladdress == null ? null : schooladdress.trim();
    }

    public String getTerminfo() {
        return terminfo;
    }

    public void setTerminfo(String terminfo) {
        this.terminfo = terminfo == null ? null : terminfo.trim();
    }
}