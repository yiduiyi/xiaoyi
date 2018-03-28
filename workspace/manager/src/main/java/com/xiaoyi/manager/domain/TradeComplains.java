package com.xiaoyi.manager.domain;

import java.util.Date;

public class TradeComplains {
    private String lessontradeid;

    private String complainContent;

    private Date complainTime;

    private String teacherid;

    public String getLessontradeid() {
        return lessontradeid;
    }

    public void setLessontradeid(String lessontradeid) {
        this.lessontradeid = lessontradeid == null ? null : lessontradeid.trim();
    }

    public String getComplainContent() {
        return complainContent;
    }

    public void setComplainContent(String complainContent) {
        this.complainContent = complainContent == null ? null : complainContent.trim();
    }

    public Date getComplainTime() {
        return complainTime;
    }

    public void setComplainTime(Date complainTime) {
        this.complainTime = complainTime;
    }

    public String getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(String teacherid) {
        this.teacherid = teacherid == null ? null : teacherid.trim();
    }
}