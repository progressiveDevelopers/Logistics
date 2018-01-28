package com.numberONe.mapper;

import java.util.List;

import com.numberONe.entity.CheckMonthFormMap;
import com.numberONe.mapper.base.BaseMapper;


public interface CheckMonthMapper extends BaseMapper{

	public CheckMonthFormMap getCurrentMonth();
	
	/**
	 * 倒序查找所有月份信息
	 * @return
	 */
	public List<CheckMonthFormMap> getAllMonthByDesc();
	
}
