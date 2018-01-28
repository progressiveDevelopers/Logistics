package com.numberONe.mapper;

import java.util.List;

import com.numberONe.entity.UserInfoView;
import com.numberONe.mapper.base.BaseMapper;
import com.numberONe.util.UserRelativeTreeUtil;

public interface UserInfoMapper extends BaseMapper {
    
    /**
     * 得到所有组信息
     * @return
     */
    List<UserRelativeTreeUtil> findAllGroup();

    /**
     * 得到指定组的角色信息
     * @param id 组id
     * @return
     */
    List<UserRelativeTreeUtil> findTargetRole(Integer id);

    /**
     * 得到指定组制定角色的用户信息
     * @param groupId 组id
     * @param roleId 角色id
     * @return
     */
    List<UserRelativeTreeUtil> findTargetUser(Integer groupId,Integer roleId);
    
    /**
     * 根据用户id查询全量信息
     * @param id  用户id
     * @return
     */
    UserInfoView findById(Integer id);
    
    /**
     * 根据当前用户信息查询其下属
     * 在同一个组
     * 但是等级又比当前用户低
     * @param userInfoView 当前用户信息
     * @return
     */
    List<UserInfoView> findSubordinate(UserInfoView userInfoView);
    
}
