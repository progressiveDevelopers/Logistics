/** 
 * @ClassName: CheckController 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 * @author gaoguofeng 
 * @date 2018年1月18日 下午3:16:12  
 */
package com.numberONe.controller.system;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.numberONe.controller.index.BaseController;
import com.numberONe.entity.CheckOptionFormMap;
import com.numberONe.entity.CheckResultFormMap;
import com.numberONe.entity.CheckTaskAssignmentFormMap;
import com.numberONe.entity.UserLoginFormMap;
import com.numberONe.mapper.CheckMapper;
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

	@RequestMapping("list")
	public String listUI(Model model) throws Exception {

		CheckTaskAssignmentFormMap checkTaskAssignmentFormMap = getFormMap(CheckTaskAssignmentFormMap.class);

		return Common.BACKGROUND_PATH + "/function/check/list";
	}

	@ResponseBody
	@RequestMapping("findByPage")
	public LayTableUtils<CheckTaskAssignmentFormMap> findByPage(String page, String limit)
			throws Exception {
		CheckTaskAssignmentFormMap checkTaskAssignmentFormMap = getFormMap(CheckTaskAssignmentFormMap.class);

	
		
		checkTaskAssignmentFormMap = toFormMap(checkTaskAssignmentFormMap,
				page, limit, checkTaskAssignmentFormMap.getStr("orderby"));
		 
		
		 ;
		 LayTableUtils<CheckTaskAssignmentFormMap> layTableUtils = new LayTableUtils<CheckTaskAssignmentFormMap>();
		 
		 layTableUtils.setCode(0);
		 layTableUtils.setCount(1000);
		 layTableUtils.setData(checkMapper.findByPage(checkTaskAssignmentFormMap));
		 
		 
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

		checkResultFormMap = toFormMap(checkResultFormMap,
				pageNow, pageSize, checkResultFormMap.getStr("orderby"));

		pageView.setRecords(checkMapper.findByPage(checkResultFormMap));
		return pageView;
	}
	
	@RequestMapping("checkUI")
	public String addUI(Model model) throws Exception {
		return Common.BACKGROUND_PATH + "/function/check/check";
	}
	
	@ResponseBody
	@RequestMapping("findOptByPage")
	public LayTableUtils<CheckOptionFormMap> findOptByPage(String page, String limit)
			throws Exception {
		CheckOptionFormMap checkOptionFormMap = getFormMap(CheckOptionFormMap.class);

	
		
		checkOptionFormMap = toFormMap(checkOptionFormMap,
				page, limit, checkOptionFormMap.getStr("orderby"));
		 
		
		 ;
		 LayTableUtils<CheckOptionFormMap> layTableUtils = new LayTableUtils<CheckOptionFormMap>();
		 
		 layTableUtils.setCode(0);
		 layTableUtils.setCount(1000);
		 layTableUtils.setData(checkMapper.findByPage(checkOptionFormMap));
		 
		 
		 System.out.println(layTableUtils.toString());
		 return layTableUtils;

	}
	

}
