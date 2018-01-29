package com.numberONe.mapper;

import java.util.List;

import com.numberONe.entity.CheckTaskAssignmentFormMap;
import com.numberONe.mapper.base.BaseMapper;


public interface CheckTaskAssignmentMapper extends BaseMapper{

	public void addTaskAssignList(List<CheckTaskAssignmentFormMap> checkTaskAssignmentList) throws Exception;
}
