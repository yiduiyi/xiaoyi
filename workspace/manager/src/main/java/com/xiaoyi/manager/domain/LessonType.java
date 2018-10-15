package com.xiaoyi.manager.domain;

public class LessonType extends LessonTypeKey {
    //private Byte teachingway;

    private Short gradeid;

    private Float lessonprice;

    private String lessonname;

    private String gradename;

    private Boolean needbook;

    private Float discountprice;

    private Byte isholiday;

    private Float singlecourseprice;

    
    /**
     * ==================  added 2018-10-10 (daul teacher version)==========
     */
    private Short semaster;
    
    private Short daulCourseCount;
    
    
    public Short getDaulCourseCount() {
		return daulCourseCount;
	}

	public void setDaulCourseCount(Short daulCourseCount) {
		this.daulCourseCount = daulCourseCount;
	}

	public Short getSemaster() {
		return semaster;
	}

	public void setSemaster(Short semaster) {
		this.semaster = semaster;
	}

	/*public Byte getTeachingway() {
        return teachingway;
    }

    public void setTeachingway(Byte teachingway) {
        this.teachingway = teachingway;
    }*/

    public Short getGradeid() {
        return gradeid;
    }

    public void setGradeid(Short gradeid) {
        this.gradeid = gradeid;
    }

    public Float getLessonprice() {
        return lessonprice;
    }

    public void setLessonprice(Float lessonprice) {
        this.lessonprice = lessonprice;
    }

    public String getLessonname() {
        return lessonname;
    }

    public void setLessonname(String lessonname) {
        this.lessonname = lessonname == null ? null : lessonname.trim();
    }

    public String getGradename() {
        return gradename;
    }

    public void setGradename(String gradename) {
        this.gradename = gradename == null ? null : gradename.trim();
    }

    public Boolean getNeedbook() {
        return needbook;
    }

    public void setNeedbook(Boolean needbook) {
        this.needbook = needbook;
    }

    public Float getDiscountprice() {
        return discountprice;
    }

    public void setDiscountprice(Float discountprice) {
        this.discountprice = discountprice;
    }

    public Byte getIsholiday() {
        return isholiday;
    }

    public void setIsholiday(Byte isholiday) {
        this.isholiday = isholiday;
    }

    public Float getSinglecourseprice() {
        return singlecourseprice;
    }

    public void setSinglecourseprice(Float singlecourseprice) {
        this.singlecourseprice = singlecourseprice;
    }
}