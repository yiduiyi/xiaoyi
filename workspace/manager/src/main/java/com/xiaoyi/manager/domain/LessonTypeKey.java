package com.xiaoyi.manager.domain;

public class LessonTypeKey {
    private String lessonId;
	
	private Short coursecnt;

    private Integer lessontype;

    private Short teachingWay;
    
    public Short getTeachingWay() {
		return teachingWay;
	}

	public void setTeachingWay(Short teachingWay) {
		this.teachingWay = teachingWay;
	}

	public Short getCoursecnt() {
        return coursecnt;
    }

    public void setCoursecnt(Short coursecnt) {
        this.coursecnt = coursecnt;
    }

    public Integer getLessontype() {
        return lessontype;
    }

    public void setLessontype(Integer lessontype) {
        this.lessontype = lessontype;
    }

	public String getLessonId() {
		return lessonId;
	}

	public void setLessonId(String lessonId) {
		this.lessonId = lessonId;
	}
}