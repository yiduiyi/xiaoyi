package com.xiaoyi.teacher.domain;

import java.sql.Time;
import java.util.Date;

public class TeachingRecord {
    private String recordid;

    private String teachingid;

    private String orderid;

    private String teacherid;

    private String starttime;

    private String endtime;

    private Float teachingnum;

    private Date teachingdate;
    
    private String lessonTradeId;

    public String getRecordid() {
        return recordid;
    }

    public void setRecordid(String recordid) {
        this.recordid = recordid == null ? null : recordid.trim();
    }

    public String getTeachingid() {
        return teachingid;
    }

    public void setTeachingid(String teachingid) {
        this.teachingid = teachingid == null ? null : teachingid.trim();
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid == null ? null : orderid.trim();
    }

    public String getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(String teacherid) {
        this.teacherid = teacherid == null ? null : teacherid.trim();
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    public Float getTeachingnum() {
        return teachingnum;
    }

    public void setTeachingnum(Float teachingnum) {
        this.teachingnum = teachingnum;
    }

    public Date getTeachingdate() {
        return teachingdate;
    }

    public void setTeachingdate(Date teachingdate) {
        this.teachingdate = teachingdate;
    }

	public String getLessonTradeId() {
		return lessonTradeId;
	}

	public void setLessonTradeId(String lessonTradeId) {
		this.lessonTradeId = lessonTradeId;
	}
}