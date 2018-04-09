package com.xiaoyi.manager.domain;

import java.util.Date;

public class Orders extends OrdersKey {
    private Date createtime;

    private Float purchasenum;

    private int orderType;
    
    private Short hasBook;
    
    public Short isHasBook() {
		return hasBook;
	}

	public void setHasBook(Short hasBook) {
		this.hasBook = hasBook;
	}

	public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Float getPurchasenum() {
        return purchasenum;
    }

    public void setPurchasenum(Float purchasenum) {
        this.purchasenum = purchasenum;
    }

	public int getOrderType() {
		return orderType;
	}

	public void setOrderType(int orderType) {
		this.orderType = orderType;
	}
}