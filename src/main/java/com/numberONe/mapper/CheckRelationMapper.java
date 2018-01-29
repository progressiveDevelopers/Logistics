package com.numberONe.mapper;

import java.util.List;

import com.numberONe.entity.CheckRelationFormMap;
import com.numberONe.mapper.base.BaseMapper;


public interface CheckRelationMapper extends BaseMapper{

	public List<CheckRelationFormMap> findUserRelationPage(CheckRelationFormMap map) throws Exception;
}
