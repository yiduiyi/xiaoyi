package com.xiaoyi.manager.dao;

import com.xiaoyi.manager.domain.ConsultantGroup;

public interface IConsultantGroupDao {
    int deleteByPrimaryKey(String consultantGroupId);

    int insert(ConsultantGroup record);

    int insertSelective(ConsultantGroup record);

    ConsultantGroup selectByPrimaryKey(String consultantGroupId);

    int updateByPrimaryKeySelective(ConsultantGroup record);

    int updateByPrimaryKey(ConsultantGroup record);
}