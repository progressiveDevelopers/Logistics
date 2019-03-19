package com.numberONe.util;

import com.numberONe.annotation.SystemLog;
import com.numberONe.constant.EmailConstant;
import com.numberONe.entity.*;
import com.numberONe.mapper.*;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;


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
    @Inject
    private CheckFinalScoreResultMapper checkFinalScoreResultMapper;
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
    @Scheduled(cron = "0 49 10 ? * *")   //每个月29号早晨9点执行
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
            cal.add(Calendar.MONTH, 0);      //0则取当前月
            String preMonth = sdf.format( cal.getTime());// 当前月的上个月
            String disPreMonth = df.format( cal.getTime());// 当前月的上个月 显示为:xxxx年x月
            checkMonthFormMap.set("month", preMonth);
            checkMonthFormMap.set("description", disPreMonth);

            //判断上月的month表数据是否已生成，避免重复数据初始化
            CheckMonthFormMap  checkMonthFormTempMap = checkMonthMapper.getCurrentMonth();
            if(checkMonthFormTempMap.get("month").equals(checkMonthFormMap.get("month"))){
                return;
            }
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
            //最终结果表数据
            List<CheckTaskAssignmentFormMap> checkFinalResultList = null;
            // 对应的result表的具体细节
            List<CheckResultFormMap> checkResultFormMapList = null;
            // 获取最新一个月的月份
            checkMonthFormMap = checkMonthMapper.getCurrentMonth();
            // 判断当前月份是否已经分配任务
            checkTaskAssignmentFormMap = new CheckTaskAssignmentFormMap();
            checkTaskAssignmentFormMap.set("monthId", checkMonthFormMap.get("id"));// 最新月份的id
            checkTaskAssignmentFormMap.set("month", checkMonthFormMap.get("month"));// 最新月份 
            checkTaskAssignmentList = new ArrayList<>();
            checkFinalResultList= new ArrayList<>();
            checkTaskAssignmentList = checkTaskAssignmentMapper.findByPage(checkTaskAssignmentFormMap);
            if(checkTaskAssignmentList.isEmpty()){
            	 
                // 获取所有的评分选项
                checkOptionFormMap.set("deletestatus", "0");
                checkOptionFromMapList = checkOptionMapper.findByWhere(checkOptionFormMap);
                // 查询所有中后台人员
               //userInfoFormMap.set("roleid", 7);   20190311注释掉  新增了角色 为了保证之前逻辑查出所有中后台人员的准确性
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
            findUserInfoListForNew();
        } catch (Exception e) {
            e.printStackTrace();
          //  return "任务分配失败！";
        }
       // return "任务分配成功！";
        
    }






  /*  @Transactional(readOnly=false)//需要事务操作必须加入此注解
    @SystemLog(module="任务分配2",methods="分配评价人-作用于组长和团队长")//凡需要处理业务逻辑的.都需要记录操作日志
    @Scheduled(cron = "0 53 16 ? * *")   //每个月29号早晨9点执行*/
    public void findUserInfoListForNew() throws Exception {
        try {
            UserInfoFormMap userInfoFormMap = new UserInfoFormMap();
            CheckMonthFormMap checkMonthFormMap = new CheckMonthFormMap();

            CheckOptionFormMap checkOptionFormMap = new CheckOptionFormMap();
            CheckRelationFormMap checkRelationFormMap = new CheckRelationFormMap();
            ParameterFormMap parameterFormMap = new ParameterFormMap();
            CheckResultFormMap checkResultFormMap = null;
            CheckFinalScoreResultMap  checkFinalresultMap = null;
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
            //最终结果表数据
            List<CheckTaskAssignmentFormMap> checkFinalResultList = null;
            // 对应的result表的具体细节
            List<CheckResultFormMap> checkResultFormMapList = null;
            // 获取最新一个月的月份
            checkMonthFormMap = checkMonthMapper.getCurrentMonth();
            // 判断当前月份是否已经分配任务
            checkTaskAssignmentFormMap = new CheckTaskAssignmentFormMap();
            checkTaskAssignmentFormMap.set("monthId", checkMonthFormMap.get("id"));// 最新月份的id
            checkTaskAssignmentFormMap.set("month", checkMonthFormMap.get("month"));// 最新月份
            checkTaskAssignmentList = new ArrayList<>();
            checkFinalResultList= new ArrayList<>();
            checkTaskAssignmentList = checkTaskAssignmentMapper.findByPage(checkTaskAssignmentFormMap);
            //if(checkTaskAssignmentList.isEmpty()){

                // 获取所有的评分选项
                checkOptionFormMap.set("deletestatus", "0");
                checkOptionFromMapList = checkOptionMapper.findByWhere(checkOptionFormMap);


                // 查询所有中后台人员
                //userInfoFormMap.set("roleid", 7);   20190311注释掉  新增了角色 为了保证之前逻辑查出所有中后台人员的准确性
                userInfoFormMap.set("level", 5);
                userInfoFormMap.set("deletestatus", '0');
                List<UserInfoFormMap> zhtUserInfoList = userInfoMapper.findByPage(userInfoFormMap);

                // 查询所有组长
                userInfoFormMap.set("roleid", 8);
                userInfoFormMap.set("level", 9);
                userInfoFormMap.set("deletestatus", '0');
                List<UserInfoFormMap> mgeUserInfoList = userInfoMapper.findByPage(userInfoFormMap);

                // 查询所有团队长 --为需要打分的团队长新增了两个角色，需要分别查出
                userInfoFormMap.set("roleid", 17);
                userInfoFormMap.set("level", 10);
                userInfoFormMap.set("deletestatus", '0');
                List<UserInfoFormMap> leaderUserInfoList = userInfoMapper.findByPage(userInfoFormMap);
                userInfoFormMap.set("roleid", 18);
                leaderUserInfoList.add(userInfoMapper.findByPage(userInfoFormMap).get(0));

                //业务支持团队逻辑
                for(UserInfoFormMap uifMap: mgeUserInfoList){

                    for(int i = 0 ; zhtUserInfoList.size() > i ; i++){
                        checkTaskAssignmentList = new ArrayList<>();
                        checkResultFormMapList = new ArrayList<>();

                        if((uifMap.get("subGroupId")!=null&&uifMap.get("subGroupId").equals(zhtUserInfoList.get(i).get("subGroupId")))){
                            //插入组长的待数据
                            checkTaskAssignmentFormMap = new CheckTaskAssignmentFormMap();
                            checkTaskAssignmentFormMap.set("monthId", checkMonthFormMap.get("id"));// 最新月份的id
                            checkTaskAssignmentFormMap.set("month", checkMonthFormMap.get("month"));// 最新月份
                            checkTaskAssignmentFormMap.set("evaluatorId", uifMap.get("userId"));// 评价人id
                            checkTaskAssignmentFormMap.set("evaluator", uifMap.get("userName"));// 评价人名字
                            checkTaskAssignmentFormMap.set("operationPostId", zhtUserInfoList.get(i).get("userId"));// 被评价人id
                            checkTaskAssignmentFormMap.set("operationPost", zhtUserInfoList.get(i).get("userName"));// 被评价人名字
                            checkTaskAssignmentFormMap.set("ifLike",0);// 不是中后台自己推荐的五个人中的某一个
                            checkTaskAssignmentList.add(checkTaskAssignmentFormMap);

                            //循环两个团队长，插入团队长的待评数据
                            for(UserInfoFormMap leaderMap:leaderUserInfoList){
                                checkTaskAssignmentFormMap = new CheckTaskAssignmentFormMap();
                                checkTaskAssignmentFormMap.set("monthId", checkMonthFormMap.get("id"));// 最新月份的id
                                checkTaskAssignmentFormMap.set("month", checkMonthFormMap.get("month"));// 最新月份
                                checkTaskAssignmentFormMap.set("evaluatorId", leaderMap.get("userId"));// 评价人id
                                checkTaskAssignmentFormMap.set("evaluator", leaderMap.get("userName"));// 评价人名字
                                checkTaskAssignmentFormMap.set("operationPostId", zhtUserInfoList.get(i).get("userId"));// 被评价人id
                                checkTaskAssignmentFormMap.set("operationPost", zhtUserInfoList.get(i).get("userName"));// 被评价人名字
                                checkTaskAssignmentFormMap.set("ifLike",0);// 不是中后台自己推荐的五个人中的某一个
                                checkTaskAssignmentList.add(checkTaskAssignmentFormMap);


                            }


                            // 获取所有待评价的选项（包括组长和团队长，将对应的数据x所有评分项存储结果表）
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

                           //初始化最终结果表，插入一条待更新数据
                            checkFinalresultMap = new CheckFinalScoreResultMap();
                            checkFinalresultMap.set("month", checkMonthFormMap.get("month"));// 最新月份
                            checkFinalresultMap.set("accountNumber", zhtUserInfoList.get(i).get("userId"));// 被评价人id
                            checkFinalresultMap.set("postCoefficient", zhtUserInfoList.get(i).get("postCoefficient"));
                            checkFinalresultMap.set("roleId", zhtUserInfoList.get(i).get("roleId")); //评价人id
                            checkFinalresultMap.set("isGroupLeaderFlag", 0);

                            // 批量增加评分人员
                            checkTaskAssignmentMapper.addTaskAssignList(checkTaskAssignmentList);
                            // 批量增加评分人员对应的评分选项result表
                            checkResultMapper.addCheckResultList(checkResultFormMapList);
                            //增加最终结果表数据
                            checkFinalScoreResultMapper.addEntity(checkFinalresultMap);
                        }
                    }
                }

                //信贷团队逻辑
                for(int i = 0 ; zhtUserInfoList.size() > i ; i++){
                    checkTaskAssignmentList = new ArrayList<>();
                    checkResultFormMapList = new ArrayList<>();
                    if(zhtUserInfoList.get(i).get("groupId").equals(2)){
                        //插入团队长的待数据（信贷团队不需要组长评分）
                        for(UserInfoFormMap leaderMap:leaderUserInfoList){
                            checkTaskAssignmentFormMap = new CheckTaskAssignmentFormMap();
                            checkTaskAssignmentFormMap.set("monthId", checkMonthFormMap.get("id"));// 最新月份的id
                            checkTaskAssignmentFormMap.set("month", checkMonthFormMap.get("month"));// 最新月份
                            checkTaskAssignmentFormMap.set("evaluatorId", leaderMap.get("userId"));// 评价人id
                            checkTaskAssignmentFormMap.set("evaluator", leaderMap.get("userName"));// 评价人名字
                            checkTaskAssignmentFormMap.set("operationPostId", zhtUserInfoList.get(i).get("userId"));// 被评价人id
                            checkTaskAssignmentFormMap.set("operationPost", zhtUserInfoList.get(i).get("userName"));// 被评价人名字
                            checkTaskAssignmentFormMap.set("ifLike",0);// 不是中后台自己推荐的五个人中的某一个
                            checkTaskAssignmentList.add(checkTaskAssignmentFormMap);
                        }

                        // 获取所有待评价的选项（包括组长和团队长，将对应的数据x所有评分项存储结果表）
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

                        //初始化最终结果表，插入一条待更新数据
                        checkFinalresultMap = new CheckFinalScoreResultMap();
                        checkFinalresultMap.set("month", checkMonthFormMap.get("month"));// 最新月份
                        checkFinalresultMap.set("accountNumber", zhtUserInfoList.get(i).get("userId"));// 被评价人id
                        checkFinalresultMap.set("postCoefficient", zhtUserInfoList.get(i).get("postCoefficient"));
                        checkFinalresultMap.set("roleId", zhtUserInfoList.get(i).get("roleId")); //评价人id
                        checkFinalresultMap.set("isGroupLeaderFlag", 0);

                        // 批量增加评分人员
                        checkTaskAssignmentMapper.addTaskAssignList(checkTaskAssignmentList);
                        // 批量增加评分人员对应的评分选项result表
                        checkResultMapper.addCheckResultList(checkResultFormMapList);
                        //增加最终结果表数据
                        checkFinalScoreResultMapper.addEntity(checkFinalresultMap);
                    }
                }
            //}

        } catch (Exception e) {
            e.printStackTrace();
            //  return "任务分配失败！";
        }
        // return "任务分配成功！";

    }



    
    @SystemLog(module="邮件发送",methods="评分数据已生成邮件提醒")
    @Scheduled(cron = "0 30 9 29 * ?")    //每个月29号早晨9:30执行
    //@Scheduled(cron = "30 * * * * ?")   
    public void sendEmailForStartRate() throws Exception {
        UserInfoFormMap userInfoFormMap = new UserInfoFormMap();
        userInfoFormMap.put("where", "where `level` = 8 AND deletestatus = 0");
        // 得到所有客户经理信息
        List<UserInfoFormMap> users = userInfoMapper.findByWhere(userInfoFormMap);
        // 得到邮件模板
        String template = EmailUtils.getEmailTemplate(EmailConstant.TEMP_START_RATE);
        // 替换访问地址
        template = template.replace("${LogisticsAddress}", 
                EmailUtils.getProperty(EmailConstant.LOGISTICS_ADDRESS));
        
        try {
            for (UserInfoFormMap x : users) {
                String content = template.replace("${name}", x.getStr("userName"));
                
                // 发送邮件
                EmailUtils.sendHtmlMail(x.getStr("email"), 
                        EmailUtils.getProperty(EmailConstant.EMAIL_TITLE_START_RATE),
                        content);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 
            
        
    }
    
    
    
    @SystemLog(module="邮件发送",methods="评分催促")
    @Scheduled(cron = "0 0 9 5 * ?")    //每个月5号早晨9点执行
    //@Scheduled(cron = "0 * * * * ?")   
    public void sendEmailForUnRate() throws Exception {
        Map<String,Object> param = new HashMap<String,Object>();
        param.put("monthId", checkMonthMapper.getCurrentMonth().get("id"));
        
        // 得到未完成评分的客户经理名称和email
        List<Map<String, Object>> users  = 
                checkTaskAssignmentMapper.notCompletedRateForAll(param);
        
        
        // 邮件模板
        String template = EmailUtils.getEmailTemplate(EmailConstant.TEMP_UNRATE);
        
        // 因为都要替换访问地址，所以先提前替换
        template = template.replace("${LogisticsAddress}", 
                EmailUtils.getProperty(EmailConstant.LOGISTICS_ADDRESS));
        
        
     // 得到抄送人邮箱
        String cc = EmailUtils.getProperty(EmailConstant.EMAIL_CC);
        
        try {
            for (Map<String, Object> x : users) {
                String targetContent = template.replace("${name}", (String)x.get("evaluator"));
                
                Map<String,Object> master = userInfoMapper.findTeamMaster(x);
                
                String ccs = cc+","+master.get("email");
                
                EmailUtils.sendHtmlMailAndBc((String)x.get("email"), 
                            EmailUtils.getProperty(EmailConstant.EMAIL_TITLE_UNRATE), 
                            targetContent,ccs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
    
    
}
