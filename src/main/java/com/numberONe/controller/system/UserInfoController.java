package com.numberONe.controller.system;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.numberONe.annotation.SystemLog;
import com.numberONe.controller.index.BaseController;
import com.numberONe.entity.CheckMonthFormMap;
import com.numberONe.entity.CheckOptionFormMap;
import com.numberONe.entity.CheckRelationFormMap;
import com.numberONe.entity.CheckResultFormMap;
import com.numberONe.entity.CheckTaskAssignmentFormMap;
import com.numberONe.entity.ParameterFormMap;
import com.numberONe.entity.UserFormMap;
import com.numberONe.entity.UserInfoFormMap;
import com.numberONe.entity.UserInfoView;
import com.numberONe.mapper.CheckMonthMapper;
import com.numberONe.mapper.CheckOptionMapper;
import com.numberONe.mapper.CheckRelationMapper;
import com.numberONe.mapper.CheckResultMapper;
import com.numberONe.mapper.CheckTaskAssignmentMapper;
import com.numberONe.mapper.ParameterMapper;
import com.numberONe.mapper.UserInfoMapper;
import com.numberONe.util.Common;
import com.numberONe.util.LayTableUtils;
import com.numberONe.util.UserRelativeTreeUtil;

@Controller
@RequestMapping("userInfo")
public class UserInfoController extends BaseController {

    @Inject
    private UserInfoMapper userInfoMapper;

    @Inject
    private CheckTaskAssignmentMapper checkTaskAssignmentMapper;
    @Inject
    private CheckMonthMapper checkMonthMapper;
    @Inject
    private CheckOptionMapper checkOptionMapper;
    @Inject
    private CheckRelationMapper checkRelationMapper;
    @Inject
    private CheckResultMapper checkResultMapper;
    @Inject
    private ParameterMapper parameterMapper;
    
    /**
     * 
     * @param count
     *            需要评价的客户经理的总人数(比如总共选10个客户经理，Count就为10)
     * @param priorityCount
     *            设置优先备选的人数(比如5选2，2就是priorityCount)
     * @param request
     * @return
     * @throws Exception
     */
    @ResponseBody
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @RequestMapping("findUserInfoList")
    @SystemLog(module="任务分配",methods="分配评价人")//凡需要处理业务逻辑的.都需要记录操作日志
    public String findUserInfoList() throws Exception {
        try {
            UserInfoFormMap userInfoFormMap = new UserInfoFormMap();
            CheckMonthFormMap checkMonthFormMap = new CheckMonthFormMap();
            CheckOptionFormMap checkOptionFormMap = new CheckOptionFormMap();
            CheckRelationFormMap checkRelationFormMap = new CheckRelationFormMap();
            ParameterFormMap parameterFormMap = new ParameterFormMap();
            CheckResultFormMap checkResultFormMap = null;
            CheckTaskAssignmentFormMap checkTaskAssignmentFormMap = null;
            parameterFormMap.set("key", "count");
            parameterFormMap.set("deletestatus", 0);
            parameterFormMap = (ParameterFormMap) parameterMapper.getByKey(parameterFormMap);
            int count = Integer.parseInt((String) parameterFormMap.get("value"));
            parameterFormMap = new ParameterFormMap();
            parameterFormMap.set("key", "priorityCount");
            parameterFormMap.set("deletestatus", "0");
            parameterFormMap = (ParameterFormMap) parameterMapper.getByKey(parameterFormMap);
            int priorityCount = 0 ;
            // 待评价的选项集合
            List<CheckOptionFormMap> checkOptionFromMapList = new ArrayList<>();
            // 一个中后台对应的多个评价人集合
            List<CheckTaskAssignmentFormMap> checkTaskAssignmentList = null;
            // 对应的result表的具体细节
            List<CheckResultFormMap> checkResultFormMapList = null;
            // 获取最新一个月的月份
            checkMonthFormMap = checkMonthMapper.getCurrentMonth();
            // 判断当前月份是否已经分配任务
            checkTaskAssignmentFormMap = new CheckTaskAssignmentFormMap();
            checkTaskAssignmentFormMap.set("monthId", checkMonthFormMap.get("id"));// 最新月份的id
            checkTaskAssignmentFormMap.set("month", checkMonthFormMap.get("month"));// 最新月份 
            checkTaskAssignmentList = new ArrayList<>();
            checkTaskAssignmentList = checkTaskAssignmentMapper.findByPage(checkTaskAssignmentFormMap);
            if(checkTaskAssignmentList.isEmpty()){
            	 
                // 获取所有的评分选项
                checkOptionFormMap.set("deletestatus", "0");
                checkOptionFromMapList = checkOptionMapper.findByWhere(checkOptionFormMap);
                // 查询所有中后台人员
                userInfoFormMap.set("roleid", 7);
                userInfoFormMap.set("level", 5);
                userInfoFormMap.set("deletestatus", '0');
                List<UserInfoFormMap> zhtUserInfoList = userInfoMapper.findByPage(userInfoFormMap);
                for(int i = 0 ; zhtUserInfoList.size() > i ; i++){
                	// 针对每个中后台的优先级人数
                	priorityCount = Integer.parseInt((String) parameterFormMap.get("value"));
                	checkTaskAssignmentList = new ArrayList<>();
                	checkResultFormMapList = new ArrayList<>();
                	int alreadyCount = 0;// 记录选取的数量
                    checkRelationFormMap.set("relationUserId", zhtUserInfoList.get(i).get("userId"));
//                  checkRelationFormMap.set("relationUserId", 9);//测试
                    // 中后台选取的具有优先级的客户经理集合
                    List<CheckRelationFormMap> priorityCheckRelationList = checkRelationMapper
                            .findUserRelationPage(checkRelationFormMap);
                    // 开始随机选取优先的客户经理
                    Set<String> set = new HashSet<String>();
                    if(priorityCheckRelationList != null){ //说明中后台人员选取了五位客户经理
                        // 先取优先的客户经理
                        while (alreadyCount < priorityCount) {
                            int size = priorityCheckRelationList.size(); // 保证List执行remove方法没问题
                            // 随机数
                            int random = (int) (Math.random() * size);
                            checkTaskAssignmentFormMap = new CheckTaskAssignmentFormMap();
                            checkTaskAssignmentFormMap.set("monthId", checkMonthFormMap.get("id"));// 最新月份的id
                            checkTaskAssignmentFormMap.set("month", checkMonthFormMap.get("month"));// 最新月份 
                            checkTaskAssignmentFormMap.set("evaluatorId", priorityCheckRelationList.get(random).get("userId"));// 评价人id
                            checkTaskAssignmentFormMap.set("evaluator", priorityCheckRelationList.get(random).get("user"));// 评价人名字
                            checkTaskAssignmentFormMap.set("operationPostId",priorityCheckRelationList.get(random).get("relationUserId"));// 被评价人id
                            checkTaskAssignmentFormMap.set("operationPost",priorityCheckRelationList.get(random).get("relationUser"));// 被评价人名字
                            checkTaskAssignmentFormMap.set("ifLike",1);// 是中后台自己推荐的五个人中的某一个
                            checkTaskAssignmentList.add(checkTaskAssignmentFormMap);
                            
                            set.add((String) priorityCheckRelationList.get(random).get("userId"));
                            priorityCheckRelationList.remove(random);
                            alreadyCount ++;
                        }
                    }
                    
                    System.out.println("获取的set为 ：" + set.toString());
                    // 查询所有客户经理
                    userInfoFormMap.set("roleid", 6);
                    userInfoFormMap.set("level", 8);
                    userInfoFormMap.set("deletestatus", '0');
                    List<UserInfoFormMap> mgeUserInfoList = userInfoMapper.findByPage(userInfoFormMap);
                    // 开始随机选取普通客户经理
                    while (alreadyCount < count) {
                        int random = (int) (Math.random() * mgeUserInfoList.size());
                        // 先获取第一个随机的客户经理 看其是否已经被选 set无序
                        System.out.println("获取的========" + mgeUserInfoList.get(random).get("userId"));
                        set.add(String.valueOf(mgeUserInfoList.get(random).get("userId")));
                        if (set.size() > priorityCount) { //
                            checkTaskAssignmentFormMap = new CheckTaskAssignmentFormMap();
                            checkTaskAssignmentFormMap.set("monthId", checkMonthFormMap.get("id"));// 最新月份的id
                            checkTaskAssignmentFormMap.set("month", checkMonthFormMap.get("month"));// 最新月份 
                            checkTaskAssignmentFormMap.set("evaluatorId", mgeUserInfoList.get(random).get("userId"));// 评价人id
                            checkTaskAssignmentFormMap.set("evaluator", mgeUserInfoList.get(random).get("userName"));// 评价人名字
                            checkTaskAssignmentFormMap.set("operationPostId", zhtUserInfoList.get(i).get("userId"));// 被评价人id
                            checkTaskAssignmentFormMap.set("operationPost", zhtUserInfoList.get(i).get("userName"));// 被评价人名字
//                          checkTaskAssignmentFormMap.set("operationPostId", 9);// 被评价人id  测试
//                          checkTaskAssignmentFormMap.set("operationPost", "刘松");// 被评价人名字
                            checkTaskAssignmentFormMap.set("ifLike",0);// 不是中后台自己推荐的五个人中的某一个
                            checkTaskAssignmentList.add(checkTaskAssignmentFormMap);
                            mgeUserInfoList.remove(random);
                            alreadyCount++;
                            priorityCount++;
                        } else {
                            // 说明取得是已经取到的 可以移除
                            mgeUserInfoList.remove(random);
                        }
                    }
                    // 获取所有待评价的选项
                    for (CheckTaskAssignmentFormMap checkTaskAssignment : checkTaskAssignmentList) {
                        for (CheckOptionFormMap checkOptionForm : checkOptionFromMapList) {
                            checkResultFormMap = new CheckResultFormMap();
                            checkResultFormMap.set("monthId", checkTaskAssignment.get("monthId"));// 最新月份的id
                            checkResultFormMap.set("month", checkTaskAssignment.get("month"));// 最新月份 
                            checkResultFormMap.set("evaluatorId", checkTaskAssignment.get("evaluatorId"));// 评价人id
                            checkResultFormMap.set("evaluator", checkTaskAssignment.get("evaluator"));// 评价人名字
                            checkResultFormMap.set("operationPostId", checkTaskAssignment.get("operationPostId"));// 被评价人id
                            checkResultFormMap.set("operationPost", checkTaskAssignment.get("operationPost"));// 被评价人名字
                            checkResultFormMap.set("checkOptionId", checkOptionForm.get("id")); // 评价选项id
                            checkResultFormMap.set("checkOption", checkOptionForm.get("checkOption")); // 评价选项描述
                            checkResultFormMapList.add(checkResultFormMap);
                        }
                    }
                    
                    // 批量增加评分人员
                    checkTaskAssignmentMapper.addTaskAssignList(checkTaskAssignmentList);
                    // 批量增加评分人员对应的评分选项result表
                    checkResultMapper.addCheckResultList(checkResultFormMapList);
                }
            }
            else{
            	return "该月份已经分配任务！！";
            }
           
        } catch (Exception e) {
            e.printStackTrace();
            return "任务分配失败！";
        }
        return "任务分配成功！";
    }
    
    
    
    @RequestMapping(value = "userRelativeTree")
    @ResponseBody
    public UserRelativeTreeUtil getUserRelativeTree() throws Exception  {
        UserRelativeTreeUtil urt = new UserRelativeTreeUtil();

        urt.setName("物流与商业金融部");

        List<UserRelativeTreeUtil> urtsLevel1 = null; // 组
        List<UserRelativeTreeUtil> urtsLevel2 = null; // 角色
        List<UserRelativeTreeUtil> urtsLevel3 = null; // 用户

        urtsLevel1 = userInfoMapper.findAllGroup();

        urt.setChildren(urtsLevel1);

        // 用组数据获取角色信息
        for (UserRelativeTreeUtil userRelativeTreeUtil1 : urtsLevel1) {
            urtsLevel2 = new ArrayList<UserRelativeTreeUtil>();
            urtsLevel2 = userInfoMapper.findTargetRole(userRelativeTreeUtil1.getIds());
            userRelativeTreeUtil1.setChildren(urtsLevel2);

            // 用组合角色数据获取用户信息
            for (UserRelativeTreeUtil userRelativeTreeUtil2 : urtsLevel2) {
                urtsLevel3 = new ArrayList<UserRelativeTreeUtil>();
                urtsLevel3 = userInfoMapper.findTargetUser(userRelativeTreeUtil1.getIds(),
                        userRelativeTreeUtil2.getIds());
                userRelativeTreeUtil2.setChildren(urtsLevel3);
            }
        }

        return urt;
    }

    @RequestMapping("userRelativeTreeView")
    public String userRelativeTreeView() {
        return Common.BACKGROUND_PATH + "/system/userInfo/userRelativeTreeView";
    }

    /**
     * 下属信息页面
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("subordinateRateView")
    public ModelAndView getSubordinateView(ModelAndView mv) throws Exception {
        List<CheckMonthFormMap> listCheckMonth = checkMonthMapper.getAllMonthByDesc();
        mv.addObject("listCheckMonth", listCheckMonth);
        mv.addObject("month", checkMonthMapper.getCurrentMonth());
        mv.setViewName(Common.BACKGROUND_PATH + "/system/userInfo/SubordinateView");
        return mv;
    }

    /**
     * 人员信息
     * 得到当前人员下属的信息
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("subordinateRate")
    @ResponseBody
    public LayTableUtils<UserInfoView> getSubordinate(HttpServletRequest request) throws Exception {

        LayTableUtils<UserInfoView> layTableUtils = new LayTableUtils<UserInfoView>();

        layTableUtils.setCode(0);
        layTableUtils.setCount(1000);

        // 当验证都通过后，把用户信息放在session里
        UserFormMap userFormMap = getFormMap(UserFormMap.class);

        userFormMap = (UserFormMap) Common.findUserSession(request);

        // 当前用户的全量信息
        UserInfoView userInfoView = userInfoMapper.findById((Integer) userFormMap.get("id"));
        
        
        List<UserInfoView> listUserInfoView = null;
        
        // 如果是管理层则可以查看两个团队的人员信息
        // 下属的信息全量
        if(userInfoView.getLevel() >  10) {
            listUserInfoView = userInfoMapper.findSubordinateForMge();
        } else {
            listUserInfoView = userInfoMapper.findSubordinate(userInfoView);
        }

        layTableUtils.setData(listUserInfoView);

        return layTableUtils;
    }
    
    /**
     * 个人考评结果页面
     * @param mv
     * @return
     * @throws Exception
     */
    @RequestMapping("rateInfo")
    public ModelAndView rateInfo(ModelAndView mv) throws Exception {
//        List<CheckMonthFormMap> listCheckMonth = checkMonthMapper.getAllMonthByDesc();
//        mv.addObject("listCheckMonth", listCheckMonth);
        mv.addObject("month", checkMonthMapper.getCurrentMonth());
        mv.setViewName(Common.BACKGROUND_PATH + "/system/userInfo/rateInfo");
       
        return mv;
    }
    
    /**
     * 管理层查看中后台员工考评结果页面（考评结果弹窗）
     * @param mv
     * @param userId
     * @param userName
     * @return
     * @throws Exception
     */
    @RequestMapping("rateInfoMge")
    public ModelAndView rateInfoMge(ModelAndView mv,Integer userId,String userName,Integer monthId) throws Exception {
//        List<CheckMonthFormMap> listCheckMonth = checkMonthMapper.getAllMonthByDesc();
//        mv.addObject("listCheckMonth", listCheckMonth);
        mv.addObject("userId", userId);
        mv.addObject("userName", userName);
        mv.addObject("month", checkMonthMapper.findbyFrist("id", monthId.toString(), CheckMonthFormMap.class));
        mv.setViewName(Common.BACKGROUND_PATH + "/system/userInfo/alertRateInfo");
        return mv;
    }
    
    /**
     * 考评结果 柱状图数据
     * @param userId
     * @param monthId
     * @return
     */
    @RequestMapping("rateInfoDataTargetMonth")
    @ResponseBody
    public List<Map<String, Object>> rateInfoDataTargetMonth(Integer userId, Integer monthId) throws Exception {
        return userInfoMapper.getRateByMonthAndUser(userId, monthId);
    }
    
    /**
     * 考评结果走势图数据
     * @param userId
     * @return
     */
    @RequestMapping("rateInfoDataAllMonth")
    @ResponseBody
    public Map<String, Object> rateInfoDataAllMonth(Integer userId) throws Exception  {
        List<Map<String, Object>> listData = userInfoMapper.rateInfoDataAllMonth(userId);

        Map<String, Object> returnMap = new HashMap<String, Object>();
        List<Map<String, Object>> returnList = null;
        /*
         * month evaluatorId evaluator total 
         * 2018年2月 4 骆敬忠 59 0 
         * 2018年2月 5 郭雪山 41 1 
         * 2018年2月 6 范毛毛 70 1 
         * 2018年2月 7 王维 58 0 
         * 2018年2月 8 王林飞 60 0 
         * 2018年3月 4 骆敬忠 59 0 
         * 2018年3月 5 郭雪山 41 1 
         * 2018年3月 6 范毛毛 70 1
         * 2018年3月 7 王维 58 0
         * 2018年3月 8 王林飞 60 0
         */
        String month = null;
            for (Map<String, Object> map : listData) {
                String tmpMonth = (String) map.get("month");
                if (!returnMap.containsKey(tmpMonth)) {
                    if (returnMap.size() == 0) { // 第一个
                        returnMap.put(tmpMonth, null);
                        month = tmpMonth;
                        if (returnList != null) {
                            returnMap.put(month, returnList);
                        }
                    } else { //  中间
                        returnMap.put(tmpMonth, null);
                        if (returnList != null) {
                            returnMap.put(month, returnList);
                        }
                    }
                    returnList = new ArrayList<Map<String, Object>>();
                    returnList.add(map);
                } else {
                    returnList.add(map);
                }

                month = tmpMonth;
            }
            
            // 最后一个
            returnMap.put(month, null);
            if (returnList != null) {
                returnMap.put(month, returnList);
            }
            
        return returnMap;
    }
    
    /**
     * 考评结果 饼状图数据
     * @param userId
     * @param monthId
     * @return
     */
    @RequestMapping("getUserRate")
    @ResponseBody
    public Map<String,BigDecimal> getUserRate(Integer userId,Integer monthId) throws Exception {
        
        Map<String,BigDecimal> returnMap = new HashMap<String,BigDecimal>();
        
        List<Integer> optionIds = checkResultMapper.findUserRateOption(userId, monthId);
        
        Map<String,Object> rateMap = null;
        
        for (int i = 0,size = optionIds.size() ; i < size; i++) {
            rateMap = checkResultMapper.findUserRate(userId, monthId, optionIds.get(i));
            returnMap.put((String)rateMap.get("checkOption"), (BigDecimal)rateMap.get("avg"));
        }
        
        
        return returnMap;
    }
    
    
}