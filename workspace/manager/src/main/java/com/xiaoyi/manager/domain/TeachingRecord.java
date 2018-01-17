package com.xiaoyi.manager.domain;

public class TeachingRecord {
    private String teachingId;

    private String orderId;

    private String recordId;
    
    private String startTime;
    
    private String endTime;
    
    private int teachingNum;

    private String teachingDate;
    
	public String getTeachingDate() {
		return teachingDate;
	}

	public void setTeachingDate(String teachingDate) {
		this.teachingDate = teachingDate;
	}

	public String getTeachingId() {
		return teachingId;
	}

	public void setTeachingId(String teachingId) {
		this.teachingId = teachingId;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getRecordId() {
		return recordId;
	}

	public void setRecordId(String recordId) {
		this.recordId = recordId;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public int getTeachingNum() {
		return teachingNum;
	}

	public void setTeachingNum(int teachingNum) {
		this.teachingNum = teachingNum;
	}

}