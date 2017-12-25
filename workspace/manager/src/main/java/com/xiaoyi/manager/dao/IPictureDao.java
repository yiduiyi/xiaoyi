package com.xiaoyi.manager.dao;

import com.xiaoyi.manager.domain.Picture;

public interface IPictureDao {
    int deleteByPrimaryKey(String picid);

    int insert(Picture record);

    int insertSelective(Picture record);

    Picture selectByPrimaryKey(String picid);

    int updateByPrimaryKeySelective(Picture record);

    int updateByPrimaryKey(Picture record);
}