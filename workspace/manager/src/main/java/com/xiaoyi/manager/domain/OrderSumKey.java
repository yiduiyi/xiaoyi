package com.xiaoyi.manager.domain;

public class OrderSumKey {
    private Integer lessontype;

    private String memberid;

    private String orderid;

    private String parentid;
    
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
    
    public Integer getLessontype() {
        return lessontype;
    }

    public void setLessontype(Integer lessontype) {
        this.lessontype = lessontype;
    }

    public String getMemberid() {
        return memberid;
    }

    public void setMemberid(String memberid) {
        this.memberid = memberid == null ? null : memberid.trim();
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid == null ? null : orderid.trim();
    }

    public String getParentid() {
        return parentid;
    }

    public void setParentid(String parentid) {
        this.parentid = parentid == null ? null : parentid.trim();
    }
}