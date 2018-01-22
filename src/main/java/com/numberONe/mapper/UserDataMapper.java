package com.numberONe.mapper;

import java.util.List;

import com.numberONe.entity.UserData;
import com.numberONe.mapper.base.BaseMapper;

public interface UserDataMapper extends BaseMapper {
    
    
    List<UserData> findAll();
    
}
