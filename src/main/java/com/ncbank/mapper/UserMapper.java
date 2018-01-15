package com.ncbank.mapper;

import java.util.List;

import com.ncbank.entity.UserFormMap;
import com.ncbank.mapper.base.BaseMapper;


public interface UserMapper extends BaseMapper{

	public List<UserFormMap> findUserPage(UserFormMap userFormMap);
	
}
