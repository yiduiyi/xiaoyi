package com.xiaoyi.teacher.domain;

import java.util.Date;

public class LessonTrade {
    private String lessontradeid;

    private Integer lessontype;

    private String teacherid;

    private String memberid;

    private String parentid;

    private String notes;

    private Byte status;

    private Float applylessons;

    private String feedback;

    private Date applytime;
    
    private Float frozenLessons;
    
    private Float actualPay;
    
    private Float withdrawed;

    /**
     * ==================  added 2018-10-10 (daul teacher version)==========
     */
    private Short teachingWay;
    
    public Short getTeachingWay() {
		return teachingWay;
	}

	public void setTeachingWay(Short teachingWay) {
		this.teachingWay = teachingWay;
	}

	public String getLessontradeid() {
        return lessontradeid;
    }

    public void setLessontradeid(String lessontradeid) {
        this.lessontradeid = lessontradeid == null ? null : lessontradeid.trim();
    }

    public Integer getLessontype() {
        return lessontype;
    }

    public void setLessontype(Integer lessontype) {
        this.lessontype = lessontype;
    }

    public String getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(String teacherid) {
        this.teacherid = teacherid == null ? null : teacherid.trim();
    }

    public String getMemberid() {
        return memberid;
    }

    public void setMemberid(String memberid) {
        this.memberid = memberid == null ? null : memberid.trim();
    }

    public String getParentid() {
        return parentid;
    }

    public void setParentid(String parentid) {
        this.parentid = parentid == null ? null : parentid.trim();
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes == null ? null : notes.trim();
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public Float getApplylessons() {
        return applylessons;
    }

    public void setApplylessons(Float applylessons) {
        this.applylessons = applylessons;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback == null ? null : feedback.trim();
    }

    public Date getApplytime() {
        return applytime;
    }

    public void setApplytime(Date applytime) {
        this.applytime = applytime;
    }

	public Float getFrozenLessons() {
		return frozenLessons;
	}

	public void setFrozenLessons(Float frozenLessons) {
		this.frozenLessons = frozenLessons;
	}

	public Float getActualPay() {
		return actualPay;
	}

	public void setActualPay(Float actualPay) {
		this.actualPay = actualPay;
	}

	public Float getWithdrawed() {
		return withdrawed;
	}

	public void setWithdrawed(Float withdrawed) {
		this.withdrawed = withdrawed;
	}
}