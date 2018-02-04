/** 
 * @ClassName: CheckController 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 * @author gaoguofeng 
 * @date 2018年1月18日 下午3:16:12  
 */
package com.numberONe.controller.system;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.numberONe.annotation.SystemLog;
import com.numberONe.controller.index.BaseController;
import com.numberONe.entity.CheckAvgResultFormMap;
import com.numberONe.entity.CheckMonthFormMap;
import com.numberONe.entity.CheckOptionFormMap;
import com.numberONe.entity.CheckResultFormMap;
import com.numberONe.entity.CheckTaskAssignmentFormMap;
import com.numberONe.entity.UserFormMap;
import com.numberONe.mapper.CheckMapper;
import com.numberONe.mapper.CheckMonthMapper;
import com.numberONe.mapper.UserMapper;
import com.numberONe.plugin.PageView;
import com.numberONe.util.Common;
import com.numberONe.util.LayTableUtils;

/**
 * @ClassName: CheckController
 * @Description: 部门考核模块控制器
 * @author: gaoguofeng
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
		
		
		Map map = new HashMap();
		map.put("evaluatorId", evaluatorId);
		//获取评论条数
		
		int i = checkMapper.findAssignTaskCount(map);
		
		layTableUtils.setCode(0);
		layTableUtils.setCount(i);
		List list = null;
		
		
		try {
			list = checkMapper.findAssignTask(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		//layTableUtils.setData(checkMapper.findByPage(checkTaskAssignmentFormMap));
		layTableUtils.setData(checkMapper.findAssignTask(map));
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
	 * @author: gaoguofeng 
	 * @email: 18516523981@163.com
	 * @date: 2018年2月4日 下午12:04:21 
	 */
	@RequestMapping("checkHistoryList")
	public String checkHistoryList(Model model) throws Exception {
		 //获取当前月份
        CheckMonthFormMap checkMonthFormMap =  checkMonthMapper.getCurrentMonth();
        String month = (String) checkMonthFormMap.get("month");
        
        model.addAttribute("month", month);
		
		return Common.BACKGROUND_PATH + "/function/check/checkHistoryList";
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
        
        
    	Map map = new HashMap();
		map.put("evaluatorId", evaluatorId);
		
		 //获取当前月份
        CheckMonthFormMap checkMonthFormMap =  checkMonthMapper.getCurrentMonth();
        String month = (String) checkMonthFormMap.get("month");
		
		map.put("month", month);
        
		//获取评论条数
		  checkResultFormMap.put("month", month);
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
	 	List  userRes  =  null;
		try {
			  userRes  = userMapper.findUserById(userFormMap);
		
		 
		Map<?, ?> map = (Map<?, ?>) userRes.get(0);
		CheckOptionFormMap checkOptionFormMap = getFormMap(CheckOptionFormMap.class);
		List  res  = checkMapper.findByWhere(checkOptionFormMap);
		model.addAttribute("res",   res);
		model.addAttribute("operationPost", map.get("userName").toString());
		model.addAttribute("id", map.get("id").toString());
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
        CheckAvgResultFormMap avgResult =  new CheckAvgResultFormMap();;
        //获取当前月份
        CheckMonthFormMap checkMonthFormMap =  checkMonthMapper.getCurrentMonth();
        String month = (String) checkMonthFormMap.get("month");
        // 当前用户的全量信息
        // UserInfoView userInfoView = userInfoMapper.findById((Integer) userFormMap.get("id"));
		
		CheckOptionFormMap checkOptionFormMap = getFormMap(CheckOptionFormMap.class);
		List  res  = checkMapper.findByWhere(checkOptionFormMap);
		int num = res.size();
		Map<String, String> map = new  HashMap();
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
		// 获取被评价人的所有评价人  并遍历判断当前用户是否是最后一位评价者
		List<CheckTaskAssignmentFormMap> taskList = checkMapper.findTaskList(map2);
	    for(CheckTaskAssignmentFormMap taskAssign : taskList){
	    	if(taskAssign.getInt("status") == 0){
	    		j++;
	    		break;//代表当前的登录员不是最后一个评价
	    	}
	    }
	    
	    if(j == 0){//代表当前是最后一个评价,求该被评价人的平均分  保存到avg表
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
		return "success";
	}

}
