package com.numberONe.mapper;

import java.util.List;
import java.util.Map;

import com.numberONe.entity.CheckTaskAssignmentFormMap;
import com.numberONe.mapper.base.BaseMapper;


public interface CheckTaskAssignmentMapper extends BaseMapper{

	public void addTaskAssignList(List<CheckTaskAssignmentFormMap> checkTaskAssignmentList) throws Exception;
	
	
	/**
	 * 查询已完成评分的客户经理人数
	 * @param param  包含月份Id和中后台人员Id
	 * @return
	 * @throws Exception
	 */
	public Integer countCompleteRate(Map<String,Object> param) throws Exception;
	
	/**
	 * 查询此中后台人员还有哪些客户经理没有对其评价
	 * @param param 包含月份Id和中后台人员Id
	 * @return
	 * @throws Exception
	 */
	public List<String> notCompletedRate(Map<String,Object> param) throws Exception;

	/**
	 * 查询最近月份还未完成评分工作的客户经理名称
	 * @param param 包含月份Id
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> notCompletedRateForAll(Map<String,Object> param) throws Exception;
	
}
