package com.xiaoyi.custom.dao;

import com.xiaoyi.custom.domain.StudentTaskStatistic;
import com.xiaoyi.custom.domain.StudentTaskStatisticKey;

public interface IStudentTaskStatisticDao {
    int deleteByPrimaryKey(StudentTaskStatisticKey key);

    int insert(StudentTaskStatistic record);

    int insertSelective(StudentTaskStatistic record);

    StudentTaskStatistic selectByPrimaryKey(StudentTaskStatisticKey key);

    int updateByPrimaryKeySelective(StudentTaskStatistic record);

    int updateByPrimaryKey(StudentTaskStatistic record);
}