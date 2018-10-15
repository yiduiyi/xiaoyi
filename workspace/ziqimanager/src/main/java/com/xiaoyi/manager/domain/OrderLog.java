package com.xiaoyi.manager.domain;

public class OrderLog {
    private String orderLogId;

    private String wxOpenid;

    private String xiaoeResourceId;

    private String xiaoeOrderId;

    private String xiaoeUserId;

    private Float price;

    private String title;

    private Integer orderState;

    private Integer paymentType;

    private Integer resourceType;

    private String createdAt;

    public String getOrderLogId() {
        return orderLogId;
    }

    public void setOrderLogId(String orderLogId) {
        this.orderLogId = orderLogId == null ? null : orderLogId.trim();
    }

    public String getWxOpenid() {
        return wxOpenid;
    }

    public void setWxOpenid(String wxOpenid) {
        this.wxOpenid = wxOpenid == null ? null : wxOpenid.trim();
    }

    public String getXiaoeResourceId() {
        return xiaoeResourceId;
    }

    public void setXiaoeResourceId(String xiaoeResourceId) {
        this.xiaoeResourceId = xiaoeResourceId == null ? null : xiaoeResourceId.trim();
    }

    public String getXiaoeOrderId() {
        return xiaoeOrderId;
    }

    public void setXiaoeOrderId(String xiaoeOrderId) {
        this.xiaoeOrderId = xiaoeOrderId == null ? null : xiaoeOrderId.trim();
    }

    public String getXiaoeUserId() {
        return xiaoeUserId;
    }

    public void setXiaoeUserId(String xiaoeUserId) {
        this.xiaoeUserId = xiaoeUserId == null ? null : xiaoeUserId.trim();
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Integer getOrderState() {
        return orderState;
    }

    public void setOrderState(Integer orderState) {
        this.orderState = orderState;
    }

    public Integer getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(Integer paymentType) {
        this.paymentType = paymentType;
    }

    public Integer getResourceType() {
        return resourceType;
    }

    public void setResourceType(Integer resourceType) {
        this.resourceType = resourceType;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt == null ? null : createdAt.trim();
    }
}