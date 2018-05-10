package com.numberONe.mapper;

import java.util.List;

import com.numberONe.entity.RoleFormMap;
import com.numberONe.mapper.base.BaseMapper;

public interface RoleMapper extends BaseMapper{
	List<RoleFormMap> seletUserRole(RoleFormMap map);
	
	/**
	 * 查询所有角色
	 * @return
	 */
	List<RoleFormMap> findAll();
	
	void deleteById(RoleFormMap map);
	
	
	
}
