package com.xiaoyi.custom.domain;

public class StudentTaskKey {
    private String studentTaskId;

    private String videoCourseId;

    public String getStudentTaskId() {
        return studentTaskId;
    }

    public void setStudentTaskId(String studentTaskId) {
        this.studentTaskId = studentTaskId == null ? null : studentTaskId.trim();
    }

    public String getVideoCourseId() {
        return videoCourseId;
    }

    public void setVideoCourseId(String videoCourseId) {
        this.videoCourseId = videoCourseId == null ? null : videoCourseId.trim();
    }
}