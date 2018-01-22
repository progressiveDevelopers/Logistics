package com.numberONe.controller.system;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.numberONe.annotation.SystemLog;
import com.numberONe.controller.index.BaseController;
import com.numberONe.entity.RoleFormMap;
import com.numberONe.mapper.RoleMapper;
import com.numberONe.plugin.PageView;
import com.numberONe.util.Common;


/** 
 * @ClassName: RoleController 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 * @author gaoguofeng 
 * @date 2018年1月17日 下午2:59:48 
 */

/**
 * @Controller 注释定义该类作为一个 Spring MVC 控制器
 * @RequestMapping 表明在该控制器中处理的所有方法都是相对于 /role/ 路径的,RequestMapping相当于包名，用来控制边界。
 */

@Controller
@RequestMapping("/role/")
public class RoleController extends BaseController {
	@Inject
	private RoleMapper roleMapper;

	@RequestMapping("list")
	public String listUI(Model model) throws Exception {
		model.addAttribute("res", findByRes());
		return Common.BACKGROUND_PATH + "/system/role/list";
	}


	/** 
	 * @Title: findByPage 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @author gaoguofeng 
	 * @date 2018年1月17日 下午3:01:27 
	 */
	@ResponseBody
	@RequestMapping("findByPage")
	public PageView findByPage(String pageNow,
			String pageSize) throws Exception {
		RoleFormMap roleFormMap = getFormMap(RoleFormMap.class);
		roleFormMap=toFormMap(roleFormMap, pageNow, pageSize,roleFormMap.getStr("orderby"));
        pageView.setRecords(roleMapper.findByPage(roleFormMap));
		return pageView;
	}

	@RequestMapping("addUI")
	public String addUI(Model model) throws Exception {
		return Common.BACKGROUND_PATH + "/system/role/add";
	}

	@ResponseBody
	@RequestMapping("addEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="组管理-新增组")//凡需要处理业务逻辑的.都需要记录操作日志
	public String addEntity() throws Exception {
		RoleFormMap roleFormMap = getFormMap(RoleFormMap.class);
		roleMapper.addEntity(roleFormMap);
		return "success";
	}

	@ResponseBody
	@RequestMapping("deleteEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="组管理-删除组")//凡需要处理业务逻辑的.都需要记录操作日志
	public String deleteEntity() throws Exception {
		String[] ids = getParaValues("ids");
		for (String id : ids) {
			roleMapper.deleteByAttribute("id", id, RoleFormMap.class);
		}
		return "success";
	}

	@RequestMapping("editUI")
	public String editUI(Model model) throws Exception {
		String id = getPara("id");
		if(Common.isNotEmpty(id)){
			model.addAttribute("role", roleMapper.findbyFrist("id", id, RoleFormMap.class));
		}
		return Common.BACKGROUND_PATH + "/system/role/edit";
	}

	@ResponseBody
	@RequestMapping("editEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="组管理-修改组")//凡需要处理业务逻辑的.都需要记录操作日志
	public String editEntity() throws Exception {
		RoleFormMap roleFormMap = getFormMap(RoleFormMap.class);
		roleMapper.editEntity(roleFormMap);
		return "success";
	}
	
	
	@RequestMapping("selRole")
	public String seletRole(Model model) throws Exception {
		RoleFormMap roleFormMap = getFormMap(RoleFormMap.class);
		Object userId = roleFormMap.get("userId");
		if(null!=userId){
			List<RoleFormMap> list = roleMapper.seletUserRole(roleFormMap);
			String ugid = "";
			for (RoleFormMap ml : list) {
				ugid += ml.get("id")+",";
			}
			ugid = Common.trimComma(ugid);
			model.addAttribute("txtRoleSelect", ugid);
			model.addAttribute("userRole", list);
			if(StringUtils.isNotBlank(ugid)){
				roleFormMap.put("where", " where id not in ("+ugid+")");
			}
		}
		List<RoleFormMap> roles = roleMapper.findByWhere(roleFormMap);
		model.addAttribute("role", roles);
		return Common.BACKGROUND_PATH + "/system/user/roleSelect";
	}

}