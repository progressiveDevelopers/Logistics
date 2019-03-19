package com.numberONe.mapper;

import com.numberONe.entity.CheckAvgResultFormMap;


import java.util.List;
import java.util.Map;

public interface CheckAvgResultMapper {

    //根据条件查询最终结果表数据
    public List<CheckAvgResultFormMap> findCheckAvgResultList(Map map);
}
