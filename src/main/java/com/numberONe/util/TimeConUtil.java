package com.numberONe.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.numberONe.annotation.SystemLog;
import com.numberONe.entity.CheckMonthFormMap;
import com.numberONe.entity.CheckOptionFormMap;
import com.numberONe.entity.CheckRelationFormMap;
import com.numberONe.entity.CheckResultFormMap;
import com.numberONe.entity.CheckTaskAssignmentFormMap;
import com.numberONe.entity.ParameterFormMap;
import com.numberONe.entity.UserInfoFormMap;
import com.numberONe.mapper.CheckMonthMapper;
import com.numberONe.mapper.CheckOptionMapper;
import com.numberONe.mapper.CheckRelationMapper;
import com.numberONe.mapper.CheckResultMapper;
import com.numberONe.mapper.CheckTaskAssignmentMapper;
import com.numberONe.mapper.ParameterMapper;
import com.numberONe.mapper.UserInfoMapper;

@Component
public class TimeConUtil {
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
    @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="任务分配",methods="分配评价人")//凡需要处理业务逻辑的.都需要记录操作日志
    @Scheduled(cron = "0 0 2 1 * ?")   //每个月1号凌晨两点执行一次
    public void findUserInfoList() throws Exception {
        try {
            UserInfoFormMap userInfoFormMap = new UserInfoFormMap();
            CheckMonthFormMap checkMonthFormMap = new CheckMonthFormMap();
            CheckOptionFormMap checkOptionFormMap = new CheckOptionFormMap();
            CheckRelationFormMap checkRelationFormMap = new CheckRelationFormMap();
            ParameterFormMap parameterFormMap = new ParameterFormMap();
            CheckResultFormMap checkResultFormMap = null;
            CheckTaskAssignmentFormMap checkTaskAssignmentFormMap = null;
            // 获取当前月的上个月 yyyyMM
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");//save into check_month month
            DateFormat df = new SimpleDateFormat("yyyy年M月");// save into check_month description
            Date date = new Date();
            Calendar cal = Calendar.getInstance();
            cal.setTime(date);
            cal.add(Calendar.MONTH, -1);      //当前月的上个月  （-1改为1的话，为取当前月
            String preMonth = sdf.format( cal.getTime());// 当前月的上个月
            String disPreMonth = df.format( cal.getTime());// 当前月的上个月 显示为:xxxx年x月
            checkMonthFormMap.set("month", preMonth);
            checkMonthFormMap.set("description", disPreMonth);
            checkMonthMapper.addEntity(checkMonthFormMap);// 新增月份
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
            /*else{
            	return "该月份已经分配任务！！";
            }*/
           
        } catch (Exception e) {
            e.printStackTrace();
          //  return "任务分配失败！";
        }
       // return "任务分配成功！";
    }
    
}
