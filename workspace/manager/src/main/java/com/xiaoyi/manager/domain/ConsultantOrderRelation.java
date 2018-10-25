package com.xiaoyi.manager.domain;

import java.util.Date;

public class ConsultantOrderRelation extends ConsultantOrderRelationKey {
    private Date createTime;

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}