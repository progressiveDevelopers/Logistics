package com.numberONe.mapper;

import java.util.List;

import com.numberONe.entity.UserData;
import com.numberONe.mapper.base.BaseMapper;
import com.numberONe.util.UserRelativeTreeUtil;

public interface UserDataMapper extends BaseMapper {

    List<UserData> findAll();

    List<UserRelativeTreeUtil> findAllGroup();

    List<UserRelativeTreeUtil> findTargetRole(Integer id);

    List<UserRelativeTreeUtil> findTargetUser(Integer groupId,Integer roleId);

}
