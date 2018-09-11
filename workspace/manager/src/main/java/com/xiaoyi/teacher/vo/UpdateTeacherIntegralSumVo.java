package com.xiaoyi.teacher.vo;

public class UpdateTeacherIntegralSumVo {
	private String teacherid;

	private Float oldIntegralCount;
	
	private Float updateIntegralValue;

	public String getTeacherid() {
		return teacherid;
	}

	public void setTeacherid(String teacherid) {
		this.teacherid = teacherid;
	}

	public Float getOldIntegralCount() {
		return oldIntegralCount;
	}

	public void setOldIntegralCount(Float oldIntegralCount) {
		this.oldIntegralCount = oldIntegralCount;
	}

	public Float getUpdateIntegralValue() {
		return updateIntegralValue;
	}

	public void setUpdateIntegralValue(Float updateIntegralValue) {
		this.updateIntegralValue = updateIntegralValue;
	}
	
}
