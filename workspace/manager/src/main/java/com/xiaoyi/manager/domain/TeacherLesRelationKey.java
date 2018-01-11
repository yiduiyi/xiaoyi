package com.xiaoyi.manager.domain;

public class TeacherLesRelationKey {
    private Integer lessontype;

    private String teacherid;

    private String teachingid;

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

    public String getTeachingid() {
        return teachingid;
    }

    public void setTeachingid(String teachingid) {
        this.teachingid = teachingid == null ? null : teachingid.trim();
    }
}