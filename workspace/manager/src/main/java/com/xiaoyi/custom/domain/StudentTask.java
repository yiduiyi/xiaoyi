package com.xiaoyi.custom.domain;

import java.util.Date;

public class StudentTask extends StudentTaskKey {
    private String teacherId;

    private String studentId;

    private Byte taskType;

    private Date createTime;

    private Byte taskStatus;

    private String notes;

    private Date updateTime;
    
    private Short gradeId;
    
    private Short courseId;
    
    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId == null ? null : teacherId.trim();
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId == null ? null : studentId.trim();
    }

    public Byte getTaskType() {
        return taskType;
    }

    public void setTaskType(Byte taskType) {
        this.taskType = taskType;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Byte getTaskStatus() {
        return taskStatus;
    }

    public void setTaskStatus(Byte taskStatus) {
        this.taskStatus = taskStatus;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes == null ? null : notes.trim();
    }

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Short getGradeId() {
		return gradeId;
	}

	public void setGradeId(Short gradeId) {
		this.gradeId = gradeId;
	}

	public Short getCourseId() {
		return courseId;
	}

	public void setCourseId(Short courseId) {
		this.courseId = courseId;
	}

}