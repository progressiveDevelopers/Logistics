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
import com.numberONe.entity.CheckTaskAssignmentFormMap;
import com.numberONe.entity.UserLoginFormMap;
import com.numberONe.mapper.CheckMapper;
import com.numberONe.mapper.UserMapper;
import com.numberONe.plugin.PageView;
import com.numberONe.util.Common;

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
	public PageView findByPage(String pageNow, String pageSize)
			throws Exception {
		CheckTaskAssignmentFormMap checkTaskAssignmentFormMap = getFormMap(CheckTaskAssignmentFormMap.class);

		checkTaskAssignmentFormMap = toFormMap(checkTaskAssignmentFormMap,
				pageNow, pageSize, checkTaskAssignmentFormMap.getStr("orderby"));

		pageView.setRecords(checkMapper.findByPage(checkTaskAssignmentFormMap));
		return pageView;
	}

}
