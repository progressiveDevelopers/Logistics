package com.numberONe.mapper;

import java.util.List;
import java.util.Map;

import com.numberONe.entity.CheckResultFormMap;
import com.numberONe.mapper.base.BaseMapper;


public interface CheckResultMapper extends BaseMapper{

	public void addCheckResultList(List<CheckResultFormMap> checkResultFormMapList) throws Exception;

    /**
     * 查看用户指定月份的评分项
     * 
     * @param userId 用户的id
     * @param monthId 月份id
     * @param optionId 评分项id
     * @return
     */
    Map<String,Object> findUserRate(Integer userId,Integer monthId,Integer optionId);
    
    /**
     * 用户评分的选项的id
     * @param userId 用户的id
     * @param monthId 月份id
     * @return
     */
    List<Integer> findUserRateOption(Integer userId,Integer monthId);
    
    /**
     * 离职人员自动评分
     * @param checkResultFormMap
     */
    void autoRate(CheckResultFormMap checkResultFormMap);
    
}

