package com.xiaoyi.custom.dao;

import java.util.List;

import com.xiaoyi.custom.domain.DaulVideoOrder;

public interface IDaulVideoOrderDao{
    int deleteByPrimaryKey(String daulOrderId);

    int insert(DaulVideoOrder record);

    int insertSelective(DaulVideoOrder record);

    int insertDaulOrderList(List<DaulVideoOrder> recordList);
    
    DaulVideoOrder selectByPrimaryKey(String daulOrderId);

    int updateByPrimaryKeySelective(DaulVideoOrder record);

    int updateByPrimaryKey(DaulVideoOrder record);
}