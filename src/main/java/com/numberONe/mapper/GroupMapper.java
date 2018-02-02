package com.numberONe.mapper;

import java.util.List;

import com.numberONe.entity.GroupFormMap;
import com.numberONe.mapper.base.BaseMapper;

public interface GroupMapper extends BaseMapper{
    
    /**
     * 查询所有组信息
     * @return
     */
    List<GroupFormMap> finall();
    
}
