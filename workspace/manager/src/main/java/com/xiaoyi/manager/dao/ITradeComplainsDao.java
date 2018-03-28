package com.xiaoyi.manager.dao;

import com.xiaoyi.manager.domain.TradeComplains;

public interface ITradeComplainsDao{
    int insert(TradeComplains record);

    int insertSelective(TradeComplains record);
}