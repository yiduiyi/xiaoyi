package com.xiaoyi.manager.domain;

import java.util.Date;

public class Orders extends OrdersKey {
    private Date createtime;

    private Short purchasenum;

    private int orderType;
    
    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Short getPurchasenum() {
        return purchasenum;
    }

    public void setPurchasenum(Short purchasenum) {
        this.purchasenum = purchasenum;
    }

	public int getOrderType() {
		return orderType;
	}

	public void setOrderType(int orderType) {
		this.orderType = orderType;
	}
}