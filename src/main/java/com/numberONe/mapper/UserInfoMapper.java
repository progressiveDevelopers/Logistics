package com.numberONe.mapper;

import java.util.List;
import java.util.Map;

import com.numberONe.entity.UserInfoView;
import com.numberONe.mapper.base.BaseMapper;
import com.numberONe.util.UserRelativeTreeUtil;

public interface UserInfoMapper extends BaseMapper {

    /**
     * 得到所有组信息
     * @return
     */
    List<UserRelativeTreeUtil> findAllGroup() throws Exception;

    /**
     * 得到指定组的角色信息
     * @param id 组id
     * @return
     */
    List<UserRelativeTreeUtil> findTargetRole(Integer id) throws Exception;

    /**
     * 得到指定组制定角色的用户信息
     * @param groupId 组id
     * @param roleId 角色id
     * @return
     */
    List<UserRelativeTreeUtil> findTargetUser(Integer groupId, Integer roleId) throws Exception;

    /**
     * 根据用户id查询全量信息
     * @param id  用户id
     * @return
     */
    UserInfoView findById(Integer id)  throws Exception;

    /**
     * 根据月份和用的id查看评分
     * @param userId 用户id
     * @param MonthId 月份id
     * @return
     */
    List<Map<String, Object>> getRateByMonthAndUser(Integer userId, Integer MonthId) throws Exception;

    /**
     * 得到个人月平均分走势图
     * @param userId
     * @return
     */
    List<Map<String, Object>> rateInfoForLine(Integer userId) throws Exception;

    /**
     * 根据当前用户信息查询其下属
     * 在同一个组,但是等级又比当前用户低
     * 在layui table 中展示
     * 在xml文件中调用  ${0} = userInfoView ${1} = monthId
     * @param userInfoView 当前用户信息
     * @return
     */
    List<Map<String, Object>> findSubordinateRate(UserInfoView userInfoView, Integer monthId) throws Exception;

    /**
     * 管理层可以查看两个团队的人员信息和平均分
     * 
     * @return
     */
    List<Map<String, Object>> findSubordinateRateForMge(Integer mongthId);
    
    /**
     *  指定月份的平均分
     * @param userId 用户的id
     * @param monthId 月份id
     * @return
     * @throws Exception
     */
    Double targetMonthAvgScore(Integer userId,Integer monthId) throws Exception;
    
    /**
     * 导出两个团队的人员信息和平均分
     * @param param 包含 开始月份和结束月份 id
     * @return
     */
    List<Map<String, Object>> exportSubordinateRateForMge(Map<String, Object> param);
    
    /**
     * 根据当前用户信息导出查询其下属的信息和平均分
     * 在同一个组,但是等级又比当前用户低
     * @param param 包含当前用户信息，开始月份和结束月份 id
     * @return
     */
    List<Map<String, Object>> exportSubordinateRate(Map<String, Object> param);
    
    /**
     * 通过Integer数组查询用户信息 包含姓名和邮箱
     * @param ids id
     * @return
     */
    List<Map<String, Object>> findByIds(List<Integer> ids);
    
    /**
     * 得到此人员的团队长信息
     * @param param 人员信息
     * @return
     */
    Map<String, Object> findTeamMaster(Map<String, Object> param);
    
}
