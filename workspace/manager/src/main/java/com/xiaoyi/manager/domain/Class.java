package com.xiaoyi.manager.domain;

public class Class extends ClassKey {
    private String classname;

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname == null ? null : classname.trim();
    }
}