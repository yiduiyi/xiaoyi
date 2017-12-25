package com.xiaoyi.manager.domain;

public class Grade extends GradeKey {
    private String gradename;

    public String getGradename() {
        return gradename;
    }

    public void setGradename(String gradename) {
        this.gradename = gradename == null ? null : gradename.trim();
    }
}