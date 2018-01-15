package com.ncbank.mapper;

import java.util.List;

import com.ncbank.entity.RoleFormMap;
import com.ncbank.mapper.base.BaseMapper;

public interface RoleMapper extends BaseMapper{
	public List<RoleFormMap> seletUserRole(RoleFormMap map);
	
	public void deleteById(RoleFormMap map);
}
