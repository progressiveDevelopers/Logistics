/** 
 * @ClassName: CheckController 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 * @author gaoguofeng 
 * @date 2018年1月18日 下午3:16:12  
 */
package com.numberONe.controller.system;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.handler.UserRoleAuthorizationInterceptor;

import com.numberONe.annotation.SystemLog;
import com.numberONe.controller.index.BaseController;
import com.numberONe.entity.CheckMonthFormMap;
import com.numberONe.entity.CheckOptionFormMap;
import com.numberONe.entity.CheckResultFormMap;
import com.numberONe.entity.CheckTaskAssignmentFormMap;
import com.numberONe.entity.ResFormMap;
import com.numberONe.entity.UserFormMap;
import com.numberONe.entity.UserGroupsFormMap;
import com.numberONe.entity.UserLoginFormMap;
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
	
	
	@ResponseBody
	@RequestMapping("updateCheckResult")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="部门评价",methods="考核评价-结果暂存")//凡需要处理业务逻辑的.都需要记录操作日志
	public String updateCheckResult(@RequestParam Map<String, Object> param, HttpServletRequest req) throws Exception {
		UserFormMap userFormMap = getFormMap(UserFormMap.class);
		//登录客户信息
        userFormMap = (UserFormMap)Common.findUserSession(req);
        int evaluatorId = (Integer) userFormMap.get("id");
        
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
		
		return "success";
	}

}
