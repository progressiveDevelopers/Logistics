package com.numberONe.mapper;

import java.util.List;

import com.numberONe.entity.CheckResultFormMap;
import com.numberONe.mapper.base.BaseMapper;


public interface CheckResultMapper extends BaseMapper{

	public void addCheckResultList(List<CheckResultFormMap> checkResultFormMapList) throws Exception;
}
