package com.numberONe.controller.system;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.numberONe.annotation.SystemLog;
import com.numberONe.constant.EmailConstant;
import com.numberONe.controller.index.BaseController;
import com.numberONe.entity.GroupFormMap;
import com.numberONe.entity.ResUserFormMap;
import com.numberONe.entity.UserFormMap;
import com.numberONe.entity.UserGroupInfoFormMap;
import com.numberONe.entity.UserGroupsFormMap;
import com.numberONe.entity.ValidateEmailFormMap;
import com.numberONe.exception.SystemException;
import com.numberONe.mapper.GroupMapper;
import com.numberONe.mapper.UserMapper;
import com.numberONe.mapper.ValidateEmailMapper;
import com.numberONe.plugin.PageView;
import com.numberONe.shiro.EasyTypeToken;
import com.numberONe.util.Common;
import com.numberONe.util.EmailUtils;
import com.numberONe.util.JsonUtils;
import com.numberONe.util.POIUtils;
import com.numberONe.util.PasswordHelper;

/**
 * 
 * @author numberONe 2014-11-19
 * @version 3.0v
 */
@Controller
@RequestMapping("/user/")
public class UserController extends BaseController {
	@Inject
	private UserMapper userMapper;
	
	@Inject
	private GroupMapper groupMapper;
	
	@Inject
	private ValidateEmailMapper validateEmailMapper;
	
	@RequestMapping("list")
	public String listUI(Model model) throws Exception {
		model.addAttribute("res", findByRes());
		return Common.BACKGROUND_PATH + "/system/user/list";
	}

	@ResponseBody
	@RequestMapping("findByPage")
	public PageView findByPage( String pageNow,
			String pageSize,String column,String sort) throws Exception {
		UserFormMap userFormMap = getFormMap(UserFormMap.class);
		userFormMap=toFormMap(userFormMap, pageNow, pageSize,userFormMap.getStr("orderby"));
		userFormMap.put("column", column);
		userFormMap.put("sort", sort);
        pageView.setRecords(userMapper.findUserPage(userFormMap));//不调用默认分页,调用自已的mapper中findUserPage
        return pageView;
	}
	
	@RequestMapping("/export")
	public void download(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String fileName = "用户列表";
		UserFormMap userFormMap = findHasHMap(UserFormMap.class);
		//exportData = 
		// [{"colkey":"sql_info","name":"SQL语句","hide":false},
		// {"colkey":"total_time","name":"总响应时长","hide":false},
		// {"colkey":"avg_time","name":"平均响应时长","hide":false},
		// {"colkey":"record_time","name":"记录时间","hide":false},
		// {"colkey":"call_count","name":"请求次数","hide":false}
		// ]
		String exportData = userFormMap.getStr("exportData");// 列表头的json字符串

		List<Map<String, Object>> listMap = JsonUtils.parseJSONList(exportData);

		List<UserFormMap> lis = userMapper.findUserPage(userFormMap);
		POIUtils.exportToExcel(response, listMap, lis, fileName);
	}

	@RequestMapping("addUI")
	public ModelAndView addUI(ModelAndView mv) throws Exception {
	    
	    mv.setViewName(Common.BACKGROUND_PATH + "/system/user/add");
	    List<GroupFormMap> listGroup = groupMapper.finall();
	    mv.addObject("listGroup", listGroup);
		return mv;
	}

	@ResponseBody
	@RequestMapping("addEntity")
	@SystemLog(module="系统管理",methods="用户管理-新增用户")//凡需要处理业务逻辑的.都需要记录操作日志
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	public String addEntity(String txtGroupsSelect,Integer groupId){
		try {
			UserFormMap userFormMap = getFormMap(UserFormMap.class);
			userFormMap.put("txtGroupsSelect", txtGroupsSelect);
			PasswordHelper passwordHelper = new PasswordHelper();
			userFormMap.set("password","123456789");
			passwordHelper.encryptPassword(userFormMap);
			userMapper.addEntity(userFormMap);//新增后返回新增信息
			if (!Common.isEmpty(txtGroupsSelect)) {
				String[] txt = txtGroupsSelect.split(",");
				UserGroupsFormMap userGroupsFormMap = new UserGroupsFormMap();
			    UserGroupInfoFormMap userGroupInfoFormMap = new UserGroupInfoFormMap();
			    userGroupInfoFormMap.put("userId", userFormMap.get("id"));
                userGroupInfoFormMap.put("groupId", groupId);
                userMapper.addEntity(userGroupInfoFormMap);
				for (String roleId : txt) {
					userGroupsFormMap.put("userId", userFormMap.get("id"));
					userGroupsFormMap.put("roleId", roleId);
					userMapper.addEntity(userGroupsFormMap);
					
				}
			}
		} catch (Exception e) {
			 throw new SystemException("添加账号异常");
		}
		return "success";
	}

	@ResponseBody
	@RequestMapping("deleteEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="用户管理-删除用户")//凡需要处理业务逻辑的.都需要记录操作日志
	public String deleteEntity() throws Exception {
		String[] ids = getParaValues("ids");
		for (String id : ids) {
			userMapper.deleteByAttribute("userId", id, UserGroupsFormMap.class);
			userMapper.deleteByAttribute("userId", id, ResUserFormMap.class);
			userMapper.deleteByAttribute("id", id, UserFormMap.class);
			userMapper.deleteByAttribute("userId", id, UserGroupInfoFormMap.class);
		}
		return "success";
	}

	@RequestMapping("editUI")
	public String editUI(Model model) throws Exception {
		String id = getPara("id");
		if(Common.isNotEmpty(id)){
			model.addAttribute("user", userMapper.findbyFrist("id", id, UserFormMap.class));
		}
		return Common.BACKGROUND_PATH + "/system/user/edit";
	}

	@ResponseBody
	@RequestMapping("editEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="用户管理-修改用户")//凡需要处理业务逻辑的.都需要记录操作日志
	public String editEntity(String txtGroupsSelect) throws Exception {
		UserFormMap userFormMap = getFormMap(UserFormMap.class);
		UserGroupInfoFormMap userGroupInfoFormMap = getFormMap(UserGroupInfoFormMap.class);
		userFormMap.put("txtGroupsSelect", txtGroupsSelect);
//		userMapper.editEntity(userFormMap);
		userMapper.deleteByAttribute("userId", userFormMap.get("id")+"", UserGroupsFormMap.class);
		userMapper.deleteByAttribute("userId", userFormMap.get("id")+"", UserGroupInfoFormMap.class);
		if(!Common.isEmpty(txtGroupsSelect)){
			String[] txt = txtGroupsSelect.split(",");
            userMapper.addEntity(userGroupInfoFormMap);
			for (String roleId : txt) {
				UserGroupsFormMap userGroupsFormMap = new UserGroupsFormMap();
				userGroupsFormMap.put("userId", userFormMap.get("id"));
				userGroupsFormMap.put("roleId", roleId);
				userMapper.addEntity(userGroupsFormMap);
			}
		}
		return "success";
	}
	/**
	 * 验证账号是否存在
	 * 
	 * @author numberONe  date：2014-2-19
	 * @param name
	 * @return
	 */
	@RequestMapping("isExist")
	@ResponseBody
	public boolean isExist(String name) {
		UserFormMap account = userMapper.findbyFrist("accountName", name, UserFormMap.class);
		if (account == null) {
			return true;
		} else {
			return false;
		}
	}
	
	//密码修改
	@RequestMapping("updatePassword")
	public String updatePassword(Model model) throws Exception {
		return Common.BACKGROUND_PATH + "/system/user/updatePassword";
	}
	
	//保存新密码
	@RequestMapping("editPassword")
	@ResponseBody
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="用户管理-修改密码")//凡需要处理业务逻辑的.都需要记录操作日志
	public String editPassword(HttpServletRequest request) throws Exception{
		// 当验证都通过后，把用户信息放在session里
	    UserFormMap userFormMap = getFormMap(UserFormMap.class);
	    String newpassword = (String) userFormMap.get("newpassword");
		userFormMap.put("password", newpassword);
		
		// 将信息保存在request中保存以便发送邮件
		UserFormMap newuserFormMap = (UserFormMap) userMapper.findUserById(userFormMap);
		request.setAttribute("newUserFormMap", newuserFormMap);
		newuserFormMap.put("password", newpassword);
		
		//这里对修改的密码进行加密
		PasswordHelper passwordHelper = new PasswordHelper();
		passwordHelper.encryptPassword(userFormMap);
		userMapper.editEntity(userFormMap);
		
		//更改密码之后注销用户信息 
		SecurityUtils.getSubject().logout();
		return "success";
	}
	
	
	@RequestMapping("forgetPasswordValidate")
	@ResponseBody
    @SystemLog(module="系统管理",methods="用户管理-忘记密码验证")//凡需要处理业务逻辑的.都需要记录操作日志
    public Map<String,String> forgetPasswordValidate(HttpServletRequest req,HttpServletResponse resp){
	    
	    ValidateEmailFormMap validateEmailFormMap = getFormMap(ValidateEmailFormMap.class);
	    
        Integer flag = validateEmailMapper.validateCode(validateEmailFormMap);
        
        Map<String,String> result = new HashMap<>();
        
        if(flag == null || flag == 0) {
            result.put("msg", "faild");
            return result;
        } else {
            validateEmailFormMap.set("status", 1);
            try {
                validateEmailMapper.editEntity(validateEmailFormMap);
            } catch (Exception e) {
                e.printStackTrace();
            }
            
        }
        
        // 验证通过后补全用户信息
        List<UserFormMap> listMap= userMapper
                .findByAttribute("accountName",validateEmailFormMap.getStr("accountName") , UserFormMap.class);
        
        if(listMap == null || listMap.size() == 0) {
            result.put("msg", "找不到账户信息，请检查账户是否正确");
            return result;
        }
        
        // 免密登陆
        Subject subject = SecurityUtils.getSubject();
        EasyTypeToken token = new EasyTypeToken(validateEmailFormMap.getStr("accountName"));
        subject.login(token);
        Session session = subject.getSession();
        session.setAttribute("userSession", listMap.get(0));
        
        result.put("msg", "success");
        
	    return result;
	}
	
	
	
    @RequestMapping("forgetPassword")
    @ResponseBody
    @SystemLog(module="系统管理",methods="用户管理-忘记密码")//凡需要处理业务逻辑的.都需要记录操作日志
    public Map<String,String> forgetPassword(String accountName,String email){
        List<UserFormMap> listUser =   userMapper.findByAttribute("accountName", accountName, UserFormMap.class);
        
        Map<String,String> result = new HashMap<>();
        
        
        if(listUser == null || listUser.size() == 0) {
            result.put("msg", "用户不存在");
            return result;
        }
        
        UserFormMap user = listUser.get(0);
        
        if(!user.getStr("email").equals(email)) {
            result.put("msg", "邮箱和账户不匹配");
           return result;
        }
        
        //查看之前有没有获取过验证码，而且没有使用过
        Integer code = validateEmailMapper.getUnusedCodeByUserId((int)user.get("id"));
        
        // 如果验证码没有使用过就再次发送验证，如果已经使用过就再生成一个新的
        if(code == null) {
            code = (int) (Math.random()*1000000);
            ValidateEmailFormMap validateEmailFormMap = new ValidateEmailFormMap();
            validateEmailFormMap.put("userId",(int)user.get("id"));
            validateEmailFormMap.put("userName",user.getStr("userName"));
            validateEmailFormMap.put("accountName",user.getStr("accountName"));
            validateEmailFormMap.put("code",code);
            try {
                validateEmailMapper.addEntity(validateEmailFormMap);
            } catch (Exception e) {
                e.printStackTrace();
                result.put("msg","生成验证码失败---"+e.toString());
                return result;
            }
        }
        
        // 邮件发送模板
        String template = null;
        try {
            template = EmailUtils.getEmailTemplate(EmailConstant.TEMP_FORGET_PWD);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("msg", "邮件发送失败,未得到邮件模板内容---->"+e.toString());
            return result;
        }
        
        // 获得替换过的html内容
        String content = template.replace("${name}", user.getStr("userName"))
                                 .replace("${code}", code.toString());
       
        
        try {
            EmailUtils.sendHtmlMail(email, EmailConstant.EMAIL_TITLE_FORGET_PWD, content);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("msg", "邮件发送失败，请检查用户名，密码等信息是否正确----》"+e.toString());
            return result;
        } 
        
        result.put("msg", "success");
        
        return result;
    }
	
    
    //保存新密码
    @RequestMapping(value = "forgetPasswordView",method = RequestMethod.GET, produces = "text/html; charset=utf-8")
    public String forgetPasswordView(HttpServletRequest request) {
        request.removeAttribute("error");
        return Common.BACKGROUND_PATH + "/system/user/forgetPassword";
    }
	
}