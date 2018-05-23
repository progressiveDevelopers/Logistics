package com.numberONe.mapper;

import java.util.List;
import java.util.Map;

import com.numberONe.entity.CheckTaskAssignmentFormMap;
import com.numberONe.mapper.base.BaseMapper;


public interface CheckTaskAssignmentMapper extends BaseMapper{

	void addTaskAssignList(List<CheckTaskAssignmentFormMap> checkTaskAssignmentList) throws Exception;
	
	
	/**
	 * 查询已完成评分的客户经理人数
	 * @param param  包含月份Id和中后台人员Id
	 * @return
	 * @throws Exception
	 */
	Integer countCompleteRate(Map<String,Object> param) throws Exception;
	
	/**
     * 查询此中后台人员当月一共应该有几个人对其评分
     * 
     * 目前规定的是10个人，但是防止员工离职等情况的出现
     * 
     * 
     * @param param  包含月份Id和中后台人员Id
     * @return
     * @throws Exception
     */
    Integer countSumRate(Map<String,Object> param) throws Exception;
    
	/**
	 * 查询此中后台人员还有哪些客户经理没有对其评价
	 * @param param 包含月份Id和中后台人员Id
	 * @return
	 * @throws Exception
	 */
	List<String> notCompletedRate(Map<String,Object> param) throws Exception;

	/**
	 * 查询最近月份还未完成评分工作的客户经理名称
	 * @param param 包含月份Id
	 * @return
	 * @throws Exception
	 */
	List<Map<String,Object>> notCompletedRateForAll(Map<String,Object> param) throws Exception;
	
	
	
	/**
	 * 更改评分状态
	 * @param checkTaskAssignmentFormMap
	 * @throws Exception
	 */
	void updateRateStatus(CheckTaskAssignmentFormMap checkTaskAssignmentFormMap)throws Exception;
	
	
	
	
}
