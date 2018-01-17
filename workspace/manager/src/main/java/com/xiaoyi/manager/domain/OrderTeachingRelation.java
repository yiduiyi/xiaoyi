package com.xiaoyi.manager.domain;

public class OrderTeachingRelation {
    private String teachingId;

    private int lessonType;

    private String orderId;

    private String parentId;
    
    private String memberId;
    
    private String teacherId;

	public String getTeachingId() {
		return teachingId;
	}

	public void setTeachingId(String teachingId) {
		this.teachingId = teachingId;
	}

	public int getLessonType() {
		return lessonType;
	}

	public void setLessonType(int lessonType) {
		this.lessonType = lessonType;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

}