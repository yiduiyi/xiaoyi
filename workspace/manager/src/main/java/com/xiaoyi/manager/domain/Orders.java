package com.xiaoyi.manager.domain;

import java.util.Date;

public class Orders extends OrdersKey {
    private Date createtime;

    private Float purchasenum;

    private int orderType;
    
    private Short hasBook;
    
    /**
     * ==================  added 2018-04-25 ==========
     */
    private Float singleLessonPrice;
    private Float totalLessonPrice;

	private Float actualPay;
    private Short orderStatus;
    
    /**
     * ++++++++++++++++++++   added by 2018-12-04  ================
     */
    private String orderComesFrom;
    
    public String getOrderComesFrom() {
		return orderComesFrom;
	}

	public void setOrderComesFrom(String orderComesFrom) {
		this.orderComesFrom = orderComesFrom;
	}

	public Float getSingleLessonPrice() {
		return singleLessonPrice;
	}

	public void setSingleLessonPrice(Float singleLessonPrice) {
		this.singleLessonPrice = singleLessonPrice;
	}

	public Float getTotalLessonPrice() {
		return totalLessonPrice;
	}

	public void setTotalLessonPrice(Float totalLessonPrice) {
		this.totalLessonPrice = totalLessonPrice;
	}

	public Float getActualPay() {
		return actualPay;
	}

	public void setActualPay(Float actualPay) {
		this.actualPay = actualPay;
	}

	public Short getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Short orderStatus) {
		this.orderStatus = orderStatus;
	}

	public Short getHasBook() {
		return hasBook;
	}
    
    /**
     * ===================  end  =================
     */

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