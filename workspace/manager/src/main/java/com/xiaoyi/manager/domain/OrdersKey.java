package com.xiaoyi.manager.domain;

public class OrdersKey {
    private Integer lessontype;

    private String orderid;

    private String parentid;

    private String teacherid;

    public Integer getLessontype() {
        return lessontype;
    }

    public void setLessontype(Integer lessontype) {
        this.lessontype = lessontype;
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid == null ? null : orderid.trim();
    }

    public String getParentid() {
        return parentid;
    }

    public void setParentid(String parentid) {
        this.parentid = parentid == null ? null : parentid.trim();
    }

    public String getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(String teacherid) {
        this.teacherid = teacherid == null ? null : teacherid.trim();
    }
}