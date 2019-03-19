/** 
 * @ClassName: CheckController 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 * @author  
 * @date 2018年1月18日 下午3:16:12  
 */
package com.numberONe.controller.system;

import com.numberONe.annotation.SystemLog;
import com.numberONe.controller.index.BaseController;
import com.numberONe.entity.*;
import com.numberONe.mapper.*;
import com.numberONe.plugin.PageView;
import com.numberONe.util.CalculationUtil;
import com.numberONe.util.Common;
import com.numberONe.util.LayTableUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.*;

/**
 * @ClassName: CheckController
 * @Description: 部门考核模块控制器
 * @author: 
 * @email: 18516523981@163.com
 * @date: 2018年1月18日 下午3:24:02
 */

@Controller
@RequestMapping("/check/")
public class CheckController extends BaseController {

	@Inject
	private CheckMapper checkMapper;
	@Inject
	private UserMapper userMapper;
	@Inject
	private CheckMonthMapper checkMonthMapper;
	@Inject
	private CheckResultMapper checkResultMapper;
	@Inject
	private UserInfoMapper userInfoMapper;
	@Inject
	private CheckTaskAssignmentMapper checkTaskAssignmentMapper;
	@Inject
	private CheckFinalScoreResultMapper checkFinalScoreResultMapper;
	@Inject
	private CheckAvgResultMapper  checkAvgResultMapper;

	@RequestMapping("list")
	public String listUI(Model model) throws Exception {

		CheckTaskAssignmentFormMap checkTaskAssignmentFormMap = getFormMap(CheckTaskAssignmentFormMap.class);
		 //获取当前月份
        CheckMonthFormMap checkMonthFormMap =  checkMonthMapper.getCurrentMonth();
        String month = (String) checkMonthFormMap.get("month");
        
        model.addAttribute("month", month);
		return Common.BACKGROUND_PATH + "/function/check/list";
	}

	@ResponseBody
	@RequestMapping("findByPage")
	public LayTableUtils<CheckTaskAssignmentFormMap> findByPage(String page,
			String limit, HttpServletRequest req) throws Exception {
		CheckTaskAssignmentFormMap checkTaskAssignmentFormMap = getFormMap(CheckTaskAssignmentFormMap.class);

		checkTaskAssignmentFormMap = toFormMap(checkTaskAssignmentFormMap,
				page, limit, checkTaskAssignmentFormMap.getStr("orderby"));

		LayTableUtils<CheckTaskAssignmentFormMap> layTableUtils = new LayTableUtils<CheckTaskAssignmentFormMap>();
	
		//获取当前登录人信息
		UserFormMap userFormMap = getFormMap(UserFormMap.class);
        userFormMap     = (UserFormMap)Common.findUserSession(req);
        int evaluatorId = (Integer) userFormMap.get("id");
		checkTaskAssignmentFormMap.put("evaluatorId", evaluatorId);
		// 获取月份  根据月份查询待评价人
		CheckMonthFormMap monthForm  = checkMonthMapper.getCurrentMonth();
		String month = (String) monthForm.get("month");
		Map map = new HashMap();
		map.put("evaluatorId", evaluatorId);
		map.put("month", month);
		//获取评论条数
		
		int i = checkMapper.findAssignTaskCount(map);
		
		layTableUtils.setCode(0);
		layTableUtils.setCount(i);
		List<CheckTaskAssignmentFormMap> list = null;
		
		
		try {
			list = checkMapper.findAssignTask(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//layTableUtils.setData(checkMapper.findByPage(checkTaskAssignmentFormMap));
		layTableUtils.setData(list);
		System.out.println(layTableUtils.toString());
		return layTableUtils;
	}

	@RequestMapping("resList")
	public String resListUI(Model model) throws Exception {
		
		
		return Common.BACKGROUND_PATH + "/function/check/resList";
	}

	@ResponseBody
	@RequestMapping("findResByPage")
	public PageView findResByPage(String pageNow, String pageSize)
			throws Exception {
		CheckResultFormMap checkResultFormMap = getFormMap(CheckResultFormMap.class);

		checkResultFormMap = toFormMap(checkResultFormMap, pageNow, pageSize,
				checkResultFormMap.getStr("orderby"));

		pageView.setRecords(checkMapper.findByPage(checkResultFormMap));
		return pageView;
	}

	/** 
	 * @Title: checkHistoryList 
	 * @Description: 客户经理查看自己的评分历史
	 * @author:  
	 * @email: 18516523981@163.com
	 * @date: 2018年2月4日 下午12:04:21 
	 */
	@RequestMapping("checkHistoryList")
	public ModelAndView checkHistoryList(ModelAndView mv) throws Exception {
		//获取所有月份
		List<CheckMonthFormMap> listCheckMonth = checkMonthMapper.getAllMonthByDesc();
        mv.addObject("listCheckMonth", listCheckMonth);
		 //获取当前月份
        mv.addObject("month", checkMonthMapper.getCurrentMonth());
        mv.setViewName(Common.BACKGROUND_PATH + "/function/check/checkHistoryList");
		return mv;
	}

	@ResponseBody
	@RequestMapping("findHistoryListByPage")
	public LayTableUtils<CheckTaskAssignmentFormMap> findHistoryListByPage(String pageNow, String pageSize, HttpServletRequest req)
			throws Exception {
		CheckResultFormMap checkResultFormMap = getFormMap(CheckResultFormMap.class);

/*		checkResultFormMap = toFormMap(checkResultFormMap, pageNow, pageSize,
				checkResultFormMap.getStr("orderby"));*/
		
		//登录客户信息
		UserFormMap userFormMap = getFormMap(UserFormMap.class);
        userFormMap = (UserFormMap)Common.findUserSession(req);
        int evaluatorId = (Integer) userFormMap.get("id");
        checkResultFormMap.put("evaluatorId", evaluatorId);
        
        // 根据页面请求的月份获取数量
        String monthId = req.getParameter("monthId");
        
    	Map map = new HashMap();
		map.put("evaluatorId", evaluatorId);
		
		 //获取当前月份
        /*CheckMonthFormMap checkMonthFormMap =  checkMonthMapper.getCurrentMonth();
        String month = (String) checkMonthFormMap.get("month");*/
		
		map.put("monthId", monthId);
        
		//获取评论条数
		checkResultFormMap.put("monthId", monthId);
 		int count = checkMapper.getCheckHistoryListCount(map);
		
        List  historyList = checkMapper.getCheckHistoryList(checkResultFormMap);
        
      
        LayTableUtils<CheckTaskAssignmentFormMap> layTableUtils = new LayTableUtils<CheckTaskAssignmentFormMap>();
        
        layTableUtils.setCode(0);
		layTableUtils.setCount(count);
		//pageView.setRecords(checkMapper.getCheckHistoryList(checkResultFormMap));
        layTableUtils.setData(historyList);
		System.out.println(layTableUtils.toString());
		return layTableUtils;
	}
	
	
	
	@RequestMapping("checkUI")
	public String addUI(Model model) throws Exception {
		String id = getPara("id");
		String operationPostId = getPara("operationPostId");
		UserFormMap userFormMap = getFormMap(UserFormMap.class);
		userFormMap.put("id",   operationPostId);
	 	UserFormMap userRes  =  null;
		try {
			  userRes  = userMapper.findUserById(userFormMap);
		 
		CheckOptionFormMap checkOptionFormMap = getFormMap(CheckOptionFormMap.class);
		List  res  = checkMapper.findByWhere(checkOptionFormMap);
		model.addAttribute("res",   res);
		model.addAttribute("operationPost", userRes.get("userName").toString());
		model.addAttribute("id", userRes.get("id").toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Common.BACKGROUND_PATH + "/function/check/check";
		
		
	}

	@ResponseBody
	@RequestMapping("findOptByPage")
	public LayTableUtils<CheckOptionFormMap> findOptByPage(String page,
			String limit) throws Exception {
		CheckOptionFormMap checkOptionFormMap = getFormMap(CheckOptionFormMap.class);

		checkOptionFormMap = toFormMap(checkOptionFormMap, page, limit,
				checkOptionFormMap.getStr("orderby"));

		LayTableUtils<CheckOptionFormMap> layTableUtils = new LayTableUtils<CheckOptionFormMap>();

		layTableUtils.setCode(0);
		layTableUtils.setCount(1000);
		layTableUtils.setData(checkMapper.findByPage(checkOptionFormMap));

		System.out.println(layTableUtils.toString());
		return layTableUtils;

	}
	
	
	/**
	 * @param param
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("updateCheckResult")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="部门评价",methods="考核评价-结果暂存")//凡需要处理业务逻辑的.都需要记录操作日志
	public String updateCheckResult(@RequestParam Map<String, Object> param, HttpServletRequest req) throws Exception {
		UserFormMap userFormMap = getFormMap(UserFormMap.class);
		//登录客户信息
        userFormMap = (UserFormMap)Common.findUserSession(req);
        int evaluatorId = (Integer) userFormMap.get("id");
        //建立  平均分
        CheckAvgResultFormMap avgResult =  new CheckAvgResultFormMap();
        //获取当前月份
        CheckMonthFormMap checkMonthFormMap =  checkMonthMapper.getCurrentMonth();
        String month = (String) checkMonthFormMap.get("month");
        // 当前用户的全量信息
        // UserInfoView userInfoView = userInfoMapper.findById((Integer) userFormMap.get("id"));
		
		CheckOptionFormMap checkOptionFormMap = getFormMap(CheckOptionFormMap.class);
		List  res  = checkMapper.findByWhere(checkOptionFormMap);
		int num = res.size();
		Map<String, String> map = new  HashMap<>();
		String[] option = null;
		
		List<Map> list = new ArrayList<Map>();  
		for (int i = 1; i < num + 1; i++) {
			Map<String, Comparable> updateMap  = new  HashMap<String, Comparable>();
			map.put(i + "", (String)param.get(i));
			updateMap.put("checkResult", (String)param.get("option" + i));
			updateMap.put("checkOptionId", i+"");
			updateMap.put("operationPostId", (String)param.get("operationPostId"));
			updateMap.put("evaluatorId", evaluatorId);
			updateMap.put("month", month);
			updateMap.put("status", "1");
			list.add(updateMap);
		}
		//根据两个ID和评分选项进行查找，然后进行批量更新。
	    checkMapper.updateCheckResult(list);
	    
	    Map taskMap = new  HashMap();
	    
		
		taskMap.put("operationPostId", (String)param.get("operationPostId"));
		taskMap.put("evaluatorId", evaluatorId);
		taskMap.put("month", month);
	    
	    checkMapper.updateCheckTaskAssignment(taskMap);
		
	    int j = 0 ; //
	    Map map2 = new HashMap();
		map2.put("operationPostId", (String)param.get("operationPostId"));
		map2.put("month", month);
		map2.put("evaluatorRoleId",6);
		map2.put("deletestatus", 0);
		// 获取被评价人的所有评价人  并遍历判断当前用户是否是最后一位评价者
		List<CheckTaskAssignmentFormMap> taskList = checkMapper.findTaskList(map2);
	    for(CheckTaskAssignmentFormMap taskAssign : taskList){
	    	if(taskAssign.getInt("status") == 0){
	    		j++;
	    		break;//代表当前的登录员不是最后一个评价
	    	}
	    }
	    //判断如果avg表已经有当月平均分数据，则不再重复插入
		avgResult.set("nameid",param.get("operationPostId"));
		avgResult.set("month",month);
	    List<CheckAvgResultFormMap> tempAvgList=checkAvgResultMapper.findCheckAvgResultList(avgResult);
	    if(j == 0&&tempAvgList.isEmpty()){//代表当前是最后一个评价,求该被评价人的平均分  保存到avg表
	    	map2 = new HashMap();
	    	map2.put("operationPostId", (String)param.get("operationPostId"));
			map2.put("month", month);
	    	List resultList = checkMapper.getAllResult(map2);
	    	try {
	    		Collections.sort(resultList); // 对获取的List进行排序
	    		resultList.remove(0); // 去掉最小的数
	    		resultList.remove(resultList.size()-1); // 去掉最大的数
			} catch (Exception e) {
				e.printStackTrace();
			}
	    	int sum = 0;
			for(int i = 0; i<resultList.size() ; i++){
				sum += Integer.parseInt((String) resultList.get(i));
			}
			BigDecimal b = new BigDecimal((double)sum/resultList.size());
			double avg = b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue(); // 四舍五入取一个小数点
			avgResult.set("monthid", checkMonthFormMap.get("id"));//月份
			avgResult.set("month", month);//月
			avgResult.set("nameid", (String)param.get("operationPostId"));//被评价人
			avgResult.set("name",  taskList.get(0).get("operationPost"));
			avgResult.set("allscore", avg);// 平均数
			checkMapper.addEntity(avgResult);
	    }

		//判断单个人的评价是否全部评完、
        map2=new HashMap();
		map2.put("operationPostId", (String)param.get("operationPostId"));
		map2.put("month", month);
		map2.put("deletestatus", 0);
		int pd1=0;
		// 获取被评价人的所有评价人  并遍历判断当前用户是否是最后一位评价者
		taskList = checkMapper.findTaskList(map2);
		for(CheckTaskAssignmentFormMap taskAssign : taskList){
			if(taskAssign.getInt("status") == 0){
				pd1++;
				break;//代表当前的登录员不是最后一个评价
			}
		}


		if(pd1==0){
			Map tempMap=new HashMap();
			tempMap.put("operationPostId",param.get("operationPostId"));
			updateFinalResult2(tempMap);
		}

	    //判断一个月份的批次是不是全都评价完毕,全部评价完毕再更新最终结果表名词
        map2=new HashMap();
		map2.put("month", month);
		map2.put("deletestatus", 0);
		int pd=0;
		// 获取被评价人的所有评价人  并遍历判断当前用户是否是最后一位评价者
		taskList = checkMapper.findTaskList(map2);
		for(CheckTaskAssignmentFormMap taskAssign : taskList){
			if(taskAssign.getInt("status") == 0){
				pd++;
				break;//代表当前的登录员不是最后一个评价
			}
		}
		if(pd==0){
			Map tempMap=new HashMap();
			tempMap.put("month",month);
			updateRank(tempMap);
		}
		return "success";
	}
	
	
	/**
	 * 查询某个中后台人员的评分进度
	 * @param operationPostId 被评价人id
	 * @param monthId
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("rateProgress")
	@ResponseBody
	public Map<String,Integer> rateProgress (Integer operationPostId,Integer monthId) throws Exception {
	    Map<String,Object> param = new HashMap<String,Object>();
	    param.put("operationPostId", operationPostId);
	    param.put("monthId", monthId);
	    Map<String,Integer> result = new HashMap<>();
	    result.put("complete", checkTaskAssignmentMapper.countCompleteRate(param));
	    result.put("sum", checkTaskAssignmentMapper.countSumRate(param));
	   return  result;
	}
	
	
	/**
     * 查询此中后台人员还有谁没有对其评价
     * @param operationPostId 被评价人id
     * @param monthId
     * @return
     * @throws Exception 
     */
    @RequestMapping("notRatePeople")
    @ResponseBody
    public List<String> notCompleted (Integer operationPostId,Integer monthId) throws Exception {
        Map<String,Object> param = new HashMap<String,Object>();
        param.put("operationPostId", operationPostId);
        param.put("monthId", monthId);
       return  checkTaskAssignmentMapper.notCompletedRate(param);
    }
	
    /**
     * 查询还有哪些客户经理没有完成评分任务
     * @return
     * @throws Exception 
     */
    @RequestMapping("rateProgressForAllData")
    @ResponseBody
    public LayTableUtils<Map<String,Object>> rateProgress () throws Exception {
        Map<String,Object> param = new HashMap<String,Object>();
        param.put("monthId", checkMonthMapper.getCurrentMonth().get("id"));
        LayTableUtils<Map<String,Object>> layTableUtils = new LayTableUtils<>();
        
        layTableUtils.setCode(0);
        layTableUtils.setCount(1000);
        layTableUtils.setData(checkTaskAssignmentMapper.notCompletedRateForAll(param));
        
        
       return  layTableUtils;
    }
    
    /** 
     * 评分总进度页面，包含哪些客户经理还未完成评分
     */
    @RequestMapping("rateProgressForAllView")
    public String notRatePeopleForAllView () throws Exception {
        return Common.BACKGROUND_PATH + "/function/check/rateProgress";
    }

	/**
	 * 更新最终评分表
	 * @return 执行结果
	 * @author 栗
	 */
    public String updateFinalResult() {
		UserInfoFormMap userInfoFormMap = new UserInfoFormMap();
		CheckAvgResultFormMap checkAvgResultFormMap=new CheckAvgResultFormMap();
		List<CheckAvgResultFormMap> checkAvgResultFormMapList=null;
		List<UserInfoFormMap> mgeUserInfoList=null;
		List<UserInfoFormMap>  leaderUserInfoList=null;
		List<UserInfoFormMap> zhtUserInfoList =null;
		List<CheckResultFormMap> checkResultList=null;
		List<CheckFinalScoreResultMap>  checkFinalScoreResultlist=null;
		//1.获取外部评分，内部评分，团队长评分数据更新到最终结果表
		try {

			//获取当前月份
			CheckMonthFormMap checkMonthFormMap =  checkMonthMapper.getCurrentMonth();
			String month = (String) checkMonthFormMap.get("month");

			//1.1去avg平均分表取出外部评分
			//根据月份查出所有被评分人员的的外部评分平均分
			checkAvgResultFormMap.put("month",month);
			checkAvgResultFormMapList=checkMapper.findByWhere(checkAvgResultFormMap);


			//1.2循环所有组员外部评分将结果更新到最终结果表
			for (CheckAvgResultFormMap tempMap:
					checkAvgResultFormMapList) {
				//查询中后台人员各个岗位系数
				userInfoFormMap.set("userId", tempMap.get("nameid"));
				zhtUserInfoList = userInfoMapper.findByPage(userInfoFormMap);
				CheckFinalScoreResultMap checkFinalScoreResultMap=new CheckFinalScoreResultMap();   //最终结果实体
				checkFinalScoreResultMap.put("month",month);
				checkFinalScoreResultMap.put("accountNumber",tempMap.get("nameid"));					//用户id
				checkFinalScoreResultMap=checkFinalScoreResultMapper.findCheckFinalResult(checkFinalScoreResultMap);
				checkFinalScoreResultMap.put("externalScore",tempMap.get("allscore"));				//外部评分
				//计算外部评分的百分制得分且存入实体
				double externalPercentileScore =CalculationUtil.getCentesimalSystem(60,Double.valueOf(tempMap.get("allscore").toString())); // 四舍五入取一个小数点
				checkFinalScoreResultMap.put("externalPercentileScore",externalPercentileScore);
				checkFinalScoreResultMap.put("postCoefficient",zhtUserInfoList.get(0).get("postCoefficient"));//user视图的岗位系数
				//更入最终结果表
				checkFinalScoreResultMapper.updateCheckFinalResult(checkFinalScoreResultMap);
			}

			//2.循环插入上级评分(组长评分)
			//2.1 查询所有组长
			userInfoFormMap.set("roleid", 8);
			userInfoFormMap.set("level", 9);
			userInfoFormMap.set("deletestatus", '0');
			mgeUserInfoList = userInfoMapper.findByPage(userInfoFormMap);

			//2.2查询所有中后台人员
			//userInfoFormMap.set("roleid", 7);   20190311注释掉  新增了角色 为了保证之前逻辑查出所有中后台人员的准确性
			userInfoFormMap.set("level", 5);
			userInfoFormMap.set("deletestatus", '0');
			zhtUserInfoList = userInfoMapper.findByPage(userInfoFormMap);

			//2.3遍历组长和组员，将组长对应组员的评分更新到最终结果表
			for (UserInfoFormMap uiMap: mgeUserInfoList) {
				//循环所有组员
				for (UserInfoFormMap personMap:zhtUserInfoList) {
					if(uiMap.get("subGroupId").equals(personMap.get("subGroupId"))){
						//查询所有评分集合,
						CheckResultFormMap crm=new CheckResultFormMap();
						crm.put("evaluatorId",uiMap.get("userId"));
						crm.put("month",month);
						crm.put("operationPostId",personMap.get("userId"));
						//根据评价人id和被评价人id得到每个属于当前组长的6项评分
						checkResultList=checkResultMapper.findCheckResultAllField(crm);
						//循环6项评分相加更新到最终结果表：上级评分和百分制上级评分
						for (CheckResultFormMap cfm:checkResultList) {
							int sum=0;
							sum+=(int)cfm.get("checkResult");
							CheckFinalScoreResultMap checkFinalScoreResultMap=new CheckFinalScoreResultMap();   //最终结果实体
							checkFinalScoreResultMap.put("month",month);										//月份
							checkFinalScoreResultMap.put("accountNumber",personMap.get("userId"));					//用户id
							checkFinalScoreResultMap=checkFinalScoreResultMapper.findCheckFinalResult(checkFinalScoreResultMap);
							checkFinalScoreResultMap.put("superiorScore",sum);										//上级评分
							double superiorPercentileScore =CalculationUtil.getCentesimalSystem(60,Double.valueOf(sum)); // 四舍五入取一个小数点
							checkFinalScoreResultMap.put("superiorPercentileScore",superiorPercentileScore);		//百分制上级评分
							//循环更新所有组员的上级评分(团队2不参与被上级评分
							//更入最终结果表
							checkFinalScoreResultMapper.updateCheckFinalResult(checkFinalScoreResultMap);
						}
					}
				}
			}

			//3.获取所有的团队长评分，将这些数据更新到最终结果表
			// 3.1查询所有团队长 --为需要打分的团队长新增了两个角色，需要分别查出
			userInfoFormMap.set("roleid", 17);
			userInfoFormMap.set("level", 10);
			userInfoFormMap.set("deletestatus", '0');
			leaderUserInfoList = userInfoMapper.findByPage(userInfoFormMap);
			userInfoFormMap.set("roleid", 18);
			leaderUserInfoList.add(userInfoMapper.findByPage(userInfoFormMap).get(0));
			//3.2遍历所有团队长更新数据
			for (UserInfoFormMap personMap:zhtUserInfoList) {
				int sum=0;
				for (UserInfoFormMap uiMap: leaderUserInfoList) {
					if(uiMap.get("roleId").equals(17)||uiMap.get("roleId").equals(18)){
						CheckResultFormMap crm=new CheckResultFormMap();
						crm.put("evaluatorId",uiMap.get("userId"));
						crm.put("month",month);
						crm.put("operationPostId",personMap.get("userId"));
						//根据评价人id和被评价人id得到每个属于当前组长的6项评分
						checkResultList=checkResultMapper.findCheckResultAllField(crm);
						int sumForLeader=0;
						for (CheckResultFormMap cfm:checkResultList) {
							sumForLeader+=(int)cfm.get("checkResult");
						}
						sum+=sumForLeader;

					}
				}
				CheckFinalScoreResultMap checkFinalScoreResultMap=new CheckFinalScoreResultMap();   //最终结果实体
				checkFinalScoreResultMap.put("month",month);										//月份
				checkFinalScoreResultMap.put("accountNumber",personMap.get("userId"));					//用户id
				checkFinalScoreResultMap=checkFinalScoreResultMapper.findCheckFinalResult(checkFinalScoreResultMap);
				checkFinalScoreResultMap.put("superiorScore",sum);										//上级评分
				double superiorPercentileScore =CalculationUtil.getCentesimalSystem(60,Double.valueOf(sum)); // 四舍五入取一个小数点
				checkFinalScoreResultMap.put("superiorPercentileScore",superiorPercentileScore);		//百分制上级评分
				//循环更新所有组员的上级评分(团队2不参与被上级评分
				//更入最终结果表
				checkFinalScoreResultMapper.updateCheckFinalResult(checkFinalScoreResultMap);
			}


			/*for (UserInfoFormMap uiMap: leaderUserInfoList) {
				//循环所有组员
				for (UserInfoFormMap personMap:zhtUserInfoList) {
					//查询团队长本月所有评分集合,
					CheckResultFormMap crm=new CheckResultFormMap();
					crm.put("evaluatorId",uiMap.get("userId"));
					crm.put("month",month);
					crm.put("operationPostId",personMap.get("userId"));
					//根据评价人id和被评价人id得到每个属于当前团队长的6项评分
					checkResultList=checkResultMapper.findCheckResultAllField(crm);
					//循环6项评分相加更新到最终结果表：上级评分和百分制上级评分
					for (CheckResultFormMap cfm:checkResultList) {
						int sum=0;
						sum+=(int)cfm.get("checkResult");
						CheckFinalScoreResultMap checkFinalScoreResultMap=new CheckFinalScoreResultMap();   //最终结果实体
						checkFinalScoreResultMap.put("month",month);										//月份
						checkFinalScoreResultMap.put("accountNumber",personMap.get("userId"));					//用户id
						checkFinalScoreResultMap.put("captainScore",sum);										//上级评分
						double captainPercentileScore =CalculationUtil.getCentesimalSystem(60,(int)sum); // 四舍五入取一个小数点
						checkFinalScoreResultMap.put("captainPercentileScore",captainPercentileScore);		//百分制上级评分
						//循环更新所有组员的团队长评分
						checkFinalScoreResultMap=checkFinalScoreResultMapper.findCheckFinalResult(checkFinalScoreResultMap);
					}
				}
			}*/

			//4.遍历结果表计算每一个组员的百分制总分
			//公式：外部评分 X 岗位系数 X 外部评分权重 + 上级评分 X 上级权重 + 团队长评分 X 团队长权重
			List<CheckFinalScoreResultMap>  cfsrList=checkFinalScoreResultMapper.findByWhere(new CheckFinalScoreResultMap());

			CheckWeightFormMap cwfMap=new CheckWeightFormMap();



			cwfMap.put("role",6);
			cwfMap=checkMapper.getCheckWeight(cwfMap);
			int externalWeightCoefficient=(int)cwfMap.get("weightCoefficient");   //外部权重

			cwfMap.put("role",8);
			cwfMap=checkMapper.getCheckWeight(cwfMap);
			int superiorWeightCoefficient=(int)cwfMap.get("weightCoefficient");	//上级权重

			cwfMap.put("role",17);
			cwfMap=checkMapper.getCheckWeight(cwfMap);
			int leaderWeightCoefficient=(int)cwfMap.get("weightCoefficient"); 	 //团队长权重

			int leaderWeightCoefficient2=leaderWeightCoefficient+superiorWeightCoefficient; //特殊的团队长权重：因为信贷管理团队没有组长评分项，所以将上级的权重加给团队长
			//4.1取得三项权重数据
			for (CheckFinalScoreResultMap cfsrMap: cfsrList) {
				int externalPercentileScore=(int)cfsrMap.get("externalPercentileScore");	//外部评分
				int superiorPercentileScore=(int)cfsrMap.get("superiorPercentileScore");	//上级评分
				int captainPercentileScore=(int)cfsrMap.get("captainPercentileScore");		//团队长评分
				int postCoefficient=(int)cfsrMap.get("postCoefficient");					//岗位系数
				//判断是哪个团队，是否有组长评分
				if(superiorPercentileScore==0){
					//信贷管理团队
					double totalScore=externalPercentileScore*postCoefficient*externalWeightCoefficient+captainPercentileScore*leaderWeightCoefficient2;
				}else{
					//业务支持团队
					double totalScore=externalPercentileScore*postCoefficient*externalWeightCoefficient+superiorPercentileScore*superiorWeightCoefficient+captainPercentileScore*leaderWeightCoefficient;
				}
			}

			//5.更新外部评分，上级评分，团队长评分名次
			//5.1查询当前月份所有组员的最终结果表数据-根据外部评分数据排序
			CheckFinalScoreResultMap checkFinalScoreResultMap=new CheckFinalScoreResultMap();
			checkFinalScoreResultMap.put("month",month);
			checkFinalScoreResultMap.put("judge","1");
			checkFinalScoreResultlist=checkFinalScoreResultMapper.findByWhere(checkFinalScoreResultMap);
			//循环结果表数据-外部评分排名
			for (int i = 0 ; checkFinalScoreResultlist.size() > i ; i++){
				//先根据月份和userid查到组员信息
				checkFinalScoreResultMap.put("month",month);
				checkFinalScoreResultMap.put("accountNumber",checkFinalScoreResultlist.get(i).get("accountNumber"));					//用户id
				checkFinalScoreResultMap=checkFinalScoreResultMapper.findCheckFinalResult(checkFinalScoreResultMap);
				//更新组员信息：更新外部名次信息
				checkFinalScoreResultMap.put("externalScoreGrading",i+1);
				//更新到数据库
				checkFinalScoreResultMapper.updateCheckFinalResult(checkFinalScoreResultMap);
			}

			//5.2查询当前月份所有组员的最终结果表数据-根据上级评分数据排序
			checkFinalScoreResultMap.put("month",month);
			checkFinalScoreResultMap.put("judge","2");
			checkFinalScoreResultMap.put("ignoreNull",1);//忽略组长评分为空的数据
			checkFinalScoreResultlist=checkFinalScoreResultMapper.findByWhere(checkFinalScoreResultMap);
			//循环结果表数据-外部评分排名
			for (int i = 0 ; checkFinalScoreResultlist.size() > i ; i++){
				//先根据月份和userid查到组员信息
				checkFinalScoreResultMap.put("month",month);
				checkFinalScoreResultMap.put("accountNumber",checkFinalScoreResultlist.get(i).get("accountNumber"));					//用户id
				checkFinalScoreResultMap=checkFinalScoreResultMapper.findCheckFinalResult(checkFinalScoreResultMap);
				//更新组员信息：更新组名次信息
				checkFinalScoreResultMap.put("groupGrading",i+1);
				//更新到数据库
				checkFinalScoreResultMapper.updateCheckFinalResult(checkFinalScoreResultMap);
			}
			//5.3查询当前月份所有组员的最终结果表数据-根据团队长评分数据排序
			checkFinalScoreResultMap.put("month",month);
			checkFinalScoreResultMap.put("judge","3");
			checkFinalScoreResultlist=checkFinalScoreResultMapper.findByWhere(checkFinalScoreResultMap);
			//循环结果表数据-外部评分排名
			for (int i = 0 ; checkFinalScoreResultlist.size() > i ; i++){
				//先根据月份和userid查到组员信息
				checkFinalScoreResultMap.put("month",month);
				checkFinalScoreResultMap.put("accountNumber",checkFinalScoreResultlist.get(i).get("accountNumber"));					//用户id
				checkFinalScoreResultMap=checkFinalScoreResultMapper.findCheckFinalResult(checkFinalScoreResultMap);
				//更新组员信息：更新团队长评分名次信息
				checkFinalScoreResultMap.put("captainScoreGrading",i+1);
				//更新到数据库
				checkFinalScoreResultMapper.updateCheckFinalResult(checkFinalScoreResultMap);
			}
			//5.4查询当前月份所有组员的最终结果表数据-根据总分数据排序
			checkFinalScoreResultMap.put("month",month);
			checkFinalScoreResultMap.put("judge","4");
			checkFinalScoreResultlist=checkFinalScoreResultMapper.findByWhere(checkFinalScoreResultMap);
			//循环结果表数据-外部评分排名
			for (int i = 0 ; checkFinalScoreResultlist.size() > i ; i++){
				//先根据月份和userid查到组员信息
				checkFinalScoreResultMap.put("month",month);
				checkFinalScoreResultMap.put("accountNumber",checkFinalScoreResultlist.get(i).get("accountNumber"));					//用户id
				checkFinalScoreResultMap=checkFinalScoreResultMapper.findCheckFinalResult(checkFinalScoreResultMap);
				//更新组员信息：更新总分评分名次信息（最终名次）
				checkFinalScoreResultMap.put("totalScoreGrading",i+1);
				//更新到数据库
				checkFinalScoreResultMapper.updateCheckFinalResult(checkFinalScoreResultMap);
			}

		}catch (Exception e){
			e.printStackTrace();
		}finally {

		}
    	return null;



	}



	/**
	 * 更新最终评分表
	 * @return 执行结果
	 * @author 栗
	 */
	public String updateFinalResult2(Map map){
		UserInfoFormMap userInfoFormMap = new UserInfoFormMap();
		CheckAvgResultFormMap checkAvgResultFormMap=new CheckAvgResultFormMap();
		List<CheckAvgResultFormMap> checkAvgResultFormMapList=null;
		List<UserInfoFormMap> mgeUserInfoList=null;
		List<UserInfoFormMap>  leaderUserInfoList=null;
		List<UserInfoFormMap> zhtUserInfoList =null;
		List<CheckResultFormMap> checkResultList=null;
		List<CheckFinalScoreResultMap>  checkFinalScoreResultlist=null;
		//1.获取外部评分，内部评分，团队长评分数据更新到最终结果表
		try {

			//获取当前月份
			CheckMonthFormMap checkMonthFormMap =  checkMonthMapper.getCurrentMonth();
			String month = (String) checkMonthFormMap.get("month");

			//1.1去avg平均分表取出外部评分
			//根据月份查出所有被评分人员的的外部评分平均分
			checkAvgResultFormMap.put("nameid",map.get("operationPostId"));
			checkAvgResultFormMap.put("month",month);
			checkAvgResultFormMapList=checkAvgResultMapper.findCheckAvgResultList(checkAvgResultFormMap);


			//1.2循环所有组员外部评分将结果更新到最终结果表
			userInfoFormMap.set("userId", checkAvgResultFormMapList.get(0).get("nameid"));
			zhtUserInfoList = userInfoMapper.findByPage(userInfoFormMap);
			CheckFinalScoreResultMap checkFinalScoreResultMap=new CheckFinalScoreResultMap();   //最终结果实体
			checkFinalScoreResultMap.put("month",month);
			checkFinalScoreResultMap.put("accountNumber",checkAvgResultFormMapList.get(0).get("nameid"));					//用户id
			checkFinalScoreResultMap=checkFinalScoreResultMapper.findCheckFinalResult(checkFinalScoreResultMap);
			checkFinalScoreResultMap.put("externalScore",checkAvgResultFormMapList.get(0).get("allscore"));				//外部评分
			//计算外部评分的百分制得分且存入实体
			System.out.println(checkAvgResultFormMapList.get(0).get("allscore").toString());
			Double tempNum=Double.valueOf(checkAvgResultFormMapList.get(0).get("allscore").toString());
			double externalPercentileScore =CalculationUtil.getCentesimalSystem(60,tempNum); // 四舍五入取一个小数点
			checkFinalScoreResultMap.put("externalPercentileScore",externalPercentileScore);
			checkFinalScoreResultMap.put("postCoefficient",zhtUserInfoList.get(0).get("postCoefficient"));//user视图的岗位系数
			//更入最终结果表
			checkFinalScoreResultMapper.updateCheckFinalResult(checkFinalScoreResultMap);



			//2.插入上级评分(组长评分)

			//2.2查询组员
			//userInfoFormMap.set("roleid", 7);   20190311注释掉  新增了角色 为了保证之前逻辑查出所有中后台人员的准确性
			userInfoFormMap=new UserInfoFormMap();
			userInfoFormMap.set("level", 5);
			userInfoFormMap.set("userId", map.get("operationPostId"));
			userInfoFormMap.set("deletestatus", '0');
			zhtUserInfoList = userInfoMapper.findByPage(userInfoFormMap);

			//2.1 查询对应组长
			userInfoFormMap=new UserInfoFormMap();
			userInfoFormMap.set("roleid", 8);
			userInfoFormMap.set("level", 9);
			userInfoFormMap.set("subGroupId", zhtUserInfoList.get(0).get("subGroupId"));
			userInfoFormMap.set("deletestatus", '0');

			mgeUserInfoList = userInfoMapper.findByPage(userInfoFormMap);



			//2.3遍历组长和组员，将组长对应组员的评分更新到最终结果表

			//信贷管理团队没有组长，不参与此项被评
			if(zhtUserInfoList.get(0).get("groupId")!=null&&!zhtUserInfoList.get(0).get("groupId").equals(2)){
				CheckResultFormMap crm = new CheckResultFormMap();
				crm.put("evaluatorId", mgeUserInfoList.get(0).get("userId"));
				crm.put("month", month);
				crm.put("operationPostId", zhtUserInfoList.get(0).get("userId"));
				//根据评价人id和被评价人id得到每个属于当前组长的6项评分
				checkResultList = checkResultMapper.findCheckResultAllField(crm);
				//循环6项评分相加更新到最终结果表：上级评分和百分制上级评分
				int sum = 0;
				for (CheckResultFormMap cfm : checkResultList) {
					sum += (int) cfm.get("checkResult");
				}
				checkFinalScoreResultMap = new CheckFinalScoreResultMap();   //最终结果实体
				checkFinalScoreResultMap.put("month", month);                                        //月份
				checkFinalScoreResultMap.put("accountNumber", zhtUserInfoList.get(0).get("userId"));                    //用户id
				checkFinalScoreResultMap = checkFinalScoreResultMapper.findCheckFinalResult(checkFinalScoreResultMap);
				checkFinalScoreResultMap.put("captainScore", sum);                                        //上级评分
				double superiorPercentileScore = CalculationUtil.getCentesimalSystem(60, Double.valueOf(sum)); // 四舍五入取一个小数点
				checkFinalScoreResultMap.put("captainPercentileScore", superiorPercentileScore);        //百分制上级评分
				//循环更新所有组员的上级评分(团队2不参与被上级评分
				//更入最终结果表
				checkFinalScoreResultMapper.updateCheckFinalResult(checkFinalScoreResultMap);
			}


			//3.获取所有的团队长评分，将这些数据更新到最终结果表
			// 3.1查询所有团队长 --为需要打分的团队长新增了两个角色，需要分别查出
			userInfoFormMap=new UserInfoFormMap();
			userInfoFormMap.set("roleid", 17);
			userInfoFormMap.set("level", 10);
			userInfoFormMap.set("deletestatus", '0');
			leaderUserInfoList = userInfoMapper.findByPage(userInfoFormMap);
			userInfoFormMap.set("roleid", 18);
			leaderUserInfoList.add(userInfoMapper.findByPage(userInfoFormMap).get(0));
			//3.2遍历所有团队长更新数据
			int sum=0;
			for (UserInfoFormMap uiMap: leaderUserInfoList) {
				if(uiMap.get("roleId").equals(17)||uiMap.get("roleId").equals(18)){
					CheckResultFormMap crm=new CheckResultFormMap();
					crm.put("evaluatorId",uiMap.get("userId"));
					crm.put("month",month);
					crm.put("operationPostId",zhtUserInfoList.get(0).get("userId"));
					//根据评价人id和被评价人id得到每个属于当前组长的6项评分
					checkResultList=checkResultMapper.findCheckResultAllField(crm);
					int sumForLeader=0;
					for (CheckResultFormMap cfm:checkResultList) {
						sumForLeader+=(int)cfm.get("checkResult");
					}
					sum+=sumForLeader;

				}
			}
			checkFinalScoreResultMap=new CheckFinalScoreResultMap();   //最终结果实体
			checkFinalScoreResultMap.put("currentMonth",month);										//月份
			checkFinalScoreResultMap.put("accountNumber",zhtUserInfoList.get(0).get("userId"));					//用户id
			checkFinalScoreResultMap=checkFinalScoreResultMapper.findCheckFinalResult(checkFinalScoreResultMap);
			checkFinalScoreResultMap.put("superiorScore",sum/2);										//上级评分
			double superiorPercentileScore =CalculationUtil.getCentesimalSystem(60,Double.valueOf(sum/2)); // 四舍五入取一个小数点
			checkFinalScoreResultMap.put("superiorPercentileScore",superiorPercentileScore);		//百分制上级评分
			//循环更新所有组员的上级评分(团队2不参与被上级评分
			//更入最终结果表
			checkFinalScoreResultMapper.updateCheckFinalResult(checkFinalScoreResultMap);


			/*for (UserInfoFormMap uiMap: leaderUserInfoList) {
				//循环所有组员
				for (UserInfoFormMap personMap:zhtUserInfoList) {
					//查询团队长本月所有评分集合,
					CheckResultFormMap crm=new CheckResultFormMap();
					crm.put("evaluatorId",uiMap.get("userId"));
					crm.put("month",month);
					crm.put("operationPostId",personMap.get("userId"));
					//根据评价人id和被评价人id得到每个属于当前团队长的6项评分
					checkResultList=checkResultMapper.findCheckResultAllField(crm);
					//循环6项评分相加更新到最终结果表：上级评分和百分制上级评分
					for (CheckResultFormMap cfm:checkResultList) {
						int sum=0;
						sum+=(int)cfm.get("checkResult");
						CheckFinalScoreResultMap checkFinalScoreResultMap=new CheckFinalScoreResultMap();   //最终结果实体
						checkFinalScoreResultMap.put("month",month);										//月份
						checkFinalScoreResultMap.put("accountNumber",personMap.get("userId"));					//用户id
						checkFinalScoreResultMap.put("captainScore",sum);										//上级评分
						double captainPercentileScore =CalculationUtil.getCentesimalSystem(60,(int)sum); // 四舍五入取一个小数点
						checkFinalScoreResultMap.put("captainPercentileScore",captainPercentileScore);		//百分制上级评分
						//循环更新所有组员的团队长评分
						checkFinalScoreResultMap=checkFinalScoreResultMapper.findCheckFinalResult(checkFinalScoreResultMap);
					}
				}
			}*/

			//4.遍历结果表计算每一个组员的百分制总分
			//公式：外部评分 X 岗位系数 X 外部评分权重 + 上级评分 X 上级权重 + 团队长评分 X 团队长权重
			CheckFinalScoreResultMap cfsParamMap=new CheckFinalScoreResultMap();
			cfsParamMap.put("accountNumber",zhtUserInfoList.get(0).get("userId"));
			List<CheckFinalScoreResultMap>  cfsrList=checkFinalScoreResultMapper.findCheckFinalResultList(cfsParamMap);

			CheckWeightFormMap cwfMap=new CheckWeightFormMap();



			cwfMap.put("roleId",6);
			cwfMap=checkMapper.getCheckWeight(cwfMap);
			double externalWeightCoefficient=Double.valueOf(cwfMap.get("weightCoefficient").toString());   //外部权重


			cwfMap.put("roleId",8);
			cwfMap=checkMapper.getCheckWeight(cwfMap);
			double superiorWeightCoefficient=Double.valueOf(cwfMap.get("weightCoefficient").toString());	//上级权重

			cwfMap.put("roleId",17);
			cwfMap=checkMapper.getCheckWeight(cwfMap);
			double leaderWeightCoefficient=Double.valueOf(cwfMap.get("weightCoefficient").toString()); 	 //团队长权重

			double leaderWeightCoefficient2=leaderWeightCoefficient+superiorWeightCoefficient; //特殊的团队长权重：因为信贷管理团队没有组长评分项，所以将上级的权重加给团队长
			//4.1取得三项权重数据
			for (CheckFinalScoreResultMap cfsrMap: cfsrList) {
				double tempExternalPercentileScore=Double.valueOf(cfsrMap.get("externalPercentileScore").toString());	//外部评分
				double tempSuperiorPercentileScore=Double.valueOf(cfsrMap.get("superiorPercentileScore").toString());	//上级评分
				double captainPercentileScore=Double.valueOf(cfsrMap.get("captainPercentileScore").toString());		//团队长评分
				double postCoefficient=Double.valueOf(cfsrMap.get("postCoefficient").toString());					//岗位系数
				//判断是哪个团队，是否有组长评分
				if(superiorPercentileScore==0){
					//信贷管理团队
					double totalScore=tempExternalPercentileScore*postCoefficient*externalWeightCoefficient+captainPercentileScore*leaderWeightCoefficient2;
					System.out.println(totalScore);
					CheckFinalScoreResultMap tempCfsMap=new CheckFinalScoreResultMap();
					tempCfsMap.put("finalScore",totalScore);
				}else{
					//业务支持团队
					double totalScore=tempSuperiorPercentileScore*postCoefficient*externalWeightCoefficient+superiorPercentileScore*superiorWeightCoefficient+captainPercentileScore*leaderWeightCoefficient;
					System.out.println(totalScore);
					CheckFinalScoreResultMap tempCfsMap=new CheckFinalScoreResultMap();
					tempCfsMap.put("finalPercentileScore",totalScore);
					tempCfsMap.put("month",month);
					tempCfsMap.put("accountNumber",cfsrMap.get("accountNumber"));
					checkFinalScoreResultMapper.updateCheckFinalResult(tempCfsMap);
				}
			}




		}catch (Exception e){
			e.printStackTrace();
		}finally {

		}
		return null;



	}
	public void updateRank(Map map){
		String month=map.get("month").toString();
		List<CheckFinalScoreResultMap> checkFinalScoreResultlist=null;
		//5.更新外部评分，上级评分，团队长评分名次
		//5.1查询当前月份所有组员的最终结果表数据-根据外部评分数据排序
		CheckFinalScoreResultMap checkFinalScoreResultMap=new CheckFinalScoreResultMap();
		checkFinalScoreResultMap.put("month",month);
		checkFinalScoreResultMap.put("judge","1");
		checkFinalScoreResultlist=checkFinalScoreResultMapper.findByWhere(checkFinalScoreResultMap);
		//循环结果表数据-外部评分排名
		for (int i = 0 ; checkFinalScoreResultlist.size() > i ; i++){
			//先根据月份和userid查到组员信息
			checkFinalScoreResultMap.put("month",month);
			checkFinalScoreResultMap.put("accountNumber",checkFinalScoreResultlist.get(i).get("accountNumber"));					//用户id
			checkFinalScoreResultMap=checkFinalScoreResultMapper.findCheckFinalResult(checkFinalScoreResultMap);
			//更新组员信息：更新外部名次信息
			checkFinalScoreResultMap.put("externalScoreGrading",i+1);
			//更新到数据库
			checkFinalScoreResultMapper.updateCheckFinalResult(checkFinalScoreResultMap);
		}

		//5.2查询当前月份所有组员的最终结果表数据-根据上级评分数据排序
		checkFinalScoreResultMap.put("month",month);
		checkFinalScoreResultMap.put("judge","2");
		checkFinalScoreResultMap.put("ignoreNull",1);//忽略组长评分为空的数据
		checkFinalScoreResultlist=checkFinalScoreResultMapper.findByWhere(checkFinalScoreResultMap);
		//循环结果表数据-外部评分排名
		for (int i = 0 ; checkFinalScoreResultlist.size() > i ; i++){
			//先根据月份和userid查到组员信息
			checkFinalScoreResultMap.put("month",month);
			checkFinalScoreResultMap.put("accountNumber",checkFinalScoreResultlist.get(i).get("accountNumber"));					//用户id
			checkFinalScoreResultMap=checkFinalScoreResultMapper.findCheckFinalResult(checkFinalScoreResultMap);
			//更新组员信息：更新组名次信息
			checkFinalScoreResultMap.put("groupGrading",i+1);
			//更新到数据库
			checkFinalScoreResultMapper.updateCheckFinalResult(checkFinalScoreResultMap);
		}
		//5.3查询当前月份所有组员的最终结果表数据-根据团队长评分数据排序
		checkFinalScoreResultMap.put("month",month);
		checkFinalScoreResultMap.put("judge","3");
		checkFinalScoreResultlist=checkFinalScoreResultMapper.findByWhere(checkFinalScoreResultMap);
		//循环结果表数据-外部评分排名
		for (int i = 0 ; checkFinalScoreResultlist.size() > i ; i++){
			//先根据月份和userid查到组员信息
			checkFinalScoreResultMap.put("month",month);
			checkFinalScoreResultMap.put("accountNumber",checkFinalScoreResultlist.get(i).get("accountNumber"));					//用户id
			checkFinalScoreResultMap=checkFinalScoreResultMapper.findCheckFinalResult(checkFinalScoreResultMap);
			//更新组员信息：更新团队长评分名次信息
			checkFinalScoreResultMap.put("captainScoreGrading",i+1);
			//更新到数据库
			checkFinalScoreResultMapper.updateCheckFinalResult(checkFinalScoreResultMap);
		}
		//5.4查询当前月份所有组员的最终结果表数据-根据总分数据排序
		checkFinalScoreResultMap.put("month",month);
		checkFinalScoreResultMap.put("judge","4");
		checkFinalScoreResultlist=checkFinalScoreResultMapper.findByWhere(checkFinalScoreResultMap);
		//循环结果表数据-外部评分排名
		for (int i = 0 ; checkFinalScoreResultlist.size() > i ; i++){
			//先根据月份和userid查到组员信息
			checkFinalScoreResultMap.put("month",month);
			checkFinalScoreResultMap.put("accountNumber",checkFinalScoreResultlist.get(i).get("accountNumber"));					//用户id
			checkFinalScoreResultMap=checkFinalScoreResultMapper.findCheckFinalResult(checkFinalScoreResultMap);
			//更新组员信息：更新总分评分名次信息（最终名次）
			checkFinalScoreResultMap.put("totalScoreGrading",i+1);
			//更新到数据库
			checkFinalScoreResultMapper.updateCheckFinalResult(checkFinalScoreResultMap);
		}
	}
    
}
