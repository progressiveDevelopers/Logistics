package com.numberONe.mapper;

import com.numberONe.entity.ParameterFormMap;
import com.numberONe.mapper.base.BaseMapper;


public interface ParameterMapper extends BaseMapper{

	public ParameterFormMap getByKey(ParameterFormMap parameterFormMap) throws Exception;
}
