package com.xiaoyi.manager.domain;

import java.util.Date;

public class Menu {
    private String menuId;

    private String menuName;

    private Short menuCode;

    private Date createTime;

    private Short parentMenuCode;

    public String getMenuId() {
        return menuId;
    }

    public void setMenuId(String menuId) {
        this.menuId = menuId == null ? null : menuId.trim();
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName == null ? null : menuName.trim();
    }

    public Short getMenuCode() {
        return menuCode;
    }

    public void setMenuCode(Short menuCode) {
        this.menuCode = menuCode;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Short getParentMenuCode() {
        return parentMenuCode;
    }

    public void setParentMenuCode(Short parentMenuCode) {
        this.parentMenuCode = parentMenuCode;
    }
}