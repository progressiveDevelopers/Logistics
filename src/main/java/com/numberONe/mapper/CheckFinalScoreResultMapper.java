package com.numberONe.mapper;

import java.util.List;
import java.util.Map;

import com.numberONe.entity.CheckFinalScoreResultMap;
import com.numberONe.mapper.base.BaseMapper;

public interface CheckFinalScoreResultMapper extends BaseMapper {
    //更新最终结果表
    public void updateCheckFinalResult(Map map);
    //根据条件查询最终结果表数据
    public CheckFinalScoreResultMap findCheckFinalResult(Map map);

    //根据条件查询最终结果表数据
    public List<CheckFinalScoreResultMap> findCheckFinalResultList(Map map);
}
