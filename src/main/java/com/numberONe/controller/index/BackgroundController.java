package com.numberONe.controller.index;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.jdbc.ScriptRunner;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.mysql.jdbc.Connection;
import com.numberONe.constant.EmailConstant;
import com.numberONe.entity.ResFormMap;
import com.numberONe.entity.UserFormMap;
import com.numberONe.entity.UserInfoView;
import com.numberONe.entity.UserLoginFormMap;
import com.numberONe.mapper.ResourcesMapper;
import com.numberONe.mapper.UserInfoMapper;
import com.numberONe.mapper.UserLoginMapper;
import com.numberONe.mapper.UserMapper;
import com.numberONe.util.Common;
import com.numberONe.util.EmailUtils;
import com.numberONe.util.TreeObject;
import com.numberONe.util.TreeUtil;

/**
 * 进行管理后台框架界面的类
 * 
 * @author numberONe 2015-04-05

 * @version 3.0v
 * @mod  Ekko 2015-09-07
 */
@Controller
@RequestMapping("/")
public class BackgroundController extends BaseController {
 
	@Inject
	private ResourcesMapper resourcesMapper;

	@Inject
	private UserMapper userLoginMapper;
	
	@Inject
	private UserInfoMapper userInfoMapper;
	
	/**
	 * @return
	 */
	@RequestMapping(value = "login", method = RequestMethod.GET, produces = "text/html; charset=utf-8")
	public String login(HttpServletRequest request) {
		request.removeAttribute("error");
		return "/login";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST, produces = "text/html; charset=utf-8")
	public String login(String accountName, String password, HttpServletRequest request) throws InvalidSessionException, Exception {
		try {
			if (!request.getMethod().equals("POST")) {
				request.setAttribute("error", "支持POST方法提交！");
			}
			if (Common.isEmpty(accountName) || Common.isEmpty(password)) {
				request.setAttribute("error", "用户名或密码不能为空！");
				return "/login";
			}
			// 想要得到 SecurityUtils.getSubject()　的对象．．访问地址必须跟ｓｈｉｒｏ的拦截地址内．不然后会报空指针
			Subject user = SecurityUtils.getSubject();
			// 用户输入的账号和密码,,存到UsernamePasswordToken对象中..然后由shiro内部认证对比,
			// 认证执行者交由ShiroDbRealm中doGetAuthenticationInfo处理
			// 当以上认证成功后会向下执行,认证失败会抛出异常
			UsernamePasswordToken token = new UsernamePasswordToken(accountName, password);
			try {
				user.login(token);
			} catch (LockedAccountException lae) {
				token.clear();
				request.setAttribute("error", "用户已经被锁定不能登录，请与管理员联系！");
				return "/login";
			} catch (ExcessiveAttemptsException e) {
			    e.printStackTrace();
				token.clear();
				request.setAttribute("error", "账号：" + accountName + " 登录失败次数过多,锁定10分钟!");
				return "/login";
			} catch (AuthenticationException e) {
			    e.printStackTrace();
				token.clear();
				request.setAttribute("error", "用户或密码不正确！");
				return "/login";
			}
			UserLoginFormMap userLogin = new UserLoginFormMap();
			session = SecurityUtils.getSubject().getSession();
			session.setAttribute("password", password);
			userLogin.put("userId", session.getAttribute("userSessionId"));
			userLogin.put("accountName", accountName);
			userLogin.put("loginIP", session.getHost());
			userLoginMapper.addEntity(userLogin);
			request.removeAttribute("error");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "登录异常，请联系管理员！");
			return "/login";
		}
		
		//判断客户是否为客户经理，如果为客户经理则重定向为固定页面
		UserInfoView userInfoView =  userInfoMapper.findById((Integer)(session.getAttribute("userSessionId")));
		if (null != userInfoView && userInfoView.getRoleId() == '6') {
			return "redirect:indexForGrade.shtml";
		} else {
			return "redirect:index.shtml";
		}
		
	}

	/**
	 * @mod Ekko 2015-09-07
	 * @throws Exception
	 */
	@RequestMapping("index")
	public String index(Model model) throws Exception {
		// 获取登录的bean
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		UserFormMap userFormMap = (UserFormMap)Common.findUserSession(request);
		ResFormMap resFormMap = new ResFormMap();
		resFormMap.put("userId", userFormMap.get("id"));
		List<ResFormMap> mps = resourcesMapper.findRes(resFormMap);
		//List<ResFormMap> mps = resourcesMapper.findByWhere(new ResFormMap());
		List<TreeObject> list = new ArrayList<TreeObject>();
		for (ResFormMap map : mps) {
			TreeObject ts = new TreeObject();
			Common.flushObject(ts, map);
			list.add(ts);
		}
		TreeUtil treeUtil = new TreeUtil();
		List<TreeObject> ns = treeUtil.getChildTreeObjects(list, 0);
		model.addAttribute("list", ns);
		// 登陆的信息回传页面
		model.addAttribute("userFormMap", userFormMap);
		return "/index";
	}

	/**
	 * @mod Ekko 2015-09-07
	 * @throws Exception
	 */
	@RequestMapping("indexForGrade")
	public String indexForGrade(Model model) throws Exception {
		// 获取登录的bean
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		UserFormMap userFormMap = (UserFormMap)Common.findUserSession(request);
		ResFormMap resFormMap = new ResFormMap();
		resFormMap.put("userId", userFormMap.get("id"));
		List<ResFormMap> mps = resourcesMapper.findRes(resFormMap);
		//List<ResFormMap> mps = resourcesMapper.findByWhere(new ResFormMap());
		List<TreeObject> list = new ArrayList<TreeObject>();
		for (ResFormMap map : mps) {
			TreeObject ts = new TreeObject();
			Common.flushObject(ts, map);
			list.add(ts);
		}
		TreeUtil treeUtil = new TreeUtil();
		List<TreeObject> ns = treeUtil.getChildTreeObjects(list, 0);
		model.addAttribute("list", ns);
		// 登陆的信息回传页面
		model.addAttribute("userFormMap", userFormMap);
		return "/indexForGrade";
	}
	
	
	@RequestMapping("menu")
	public String menu(Model model) {
		return "/framework/menu";
	}

	/**
	 * 获取某个用户的权限资源
	 * 
	 * @author numberONe date：2014-3-4
	 * @param request
	 * @return
	 */
	@RequestMapping("findAuthority")
	@ResponseBody
	public List<String> findAuthority(HttpServletRequest request) {
		return null;
	}

	@RequestMapping("download")
	public void download(String fileName, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		java.io.BufferedInputStream bis = null;
		java.io.BufferedOutputStream bos = null;

		String ctxPath = request.getSession().getServletContext().getRealPath("/") + "\\"
				+ "filezip\\";
		String downLoadPath = ctxPath + fileName;
		System.out.println(downLoadPath);
		try {
			long fileLength = new File(downLoadPath).length();
			response.setContentType("application/x-msdownload;");
			response.setHeader("Content-disposition",
					"attachment; filename=" + new String(fileName.getBytes("utf-8"), "ISO8859-1"));
			response.setHeader("Content-Length", String.valueOf(fileLength));
			bis = new BufferedInputStream(new FileInputStream(downLoadPath));
			bos = new BufferedOutputStream(response.getOutputStream());
			byte[] buff = new byte[2048];
			int bytesRead;
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
				bos.write(buff, 0, bytesRead);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (bis != null)
				bis.close();
			if (bos != null)
				bos.close();
		}
	}
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout() {
		// 使用权限管理工具进行用户的退出，注销登录
		SecurityUtils.getSubject().logout(); // session
												// 会销毁，在SessionListener监听session销毁，清理权限缓存
		return "redirect:login.shtml";
	}

	@RequestMapping("install")
	public String install() throws Exception {

		try {
			Properties props = Resources.getResourceAsProperties("jdbc.properties");
			String url = props.getProperty("jdbc.url");
			String driver = props.getProperty("jdbc.driverClass");
			String username = props.getProperty("jdbc.username");
			String password = props.getProperty("jdbc.password");
			Class.forName(driver).newInstance();
			Connection conn = (Connection) DriverManager.getConnection(url, username, password);
			ScriptRunner runner = new ScriptRunner(conn);
			runner.setErrorLogWriter(null);
			runner.setLogWriter(null);
			runner.runScript((new InputStreamReader(getClass().getResourceAsStream("/intall.sql"),"UTF-8")));

		} catch (Exception e) {
			e.printStackTrace();
			return "初始化失败！请联系管理员" + e;
		}

		return "/install";
	}

	
	@RequestMapping("unrate/sendEmail")
	@ResponseBody
	public Map<String,String> sendEmailForUnrate(@RequestBody Map<String,List<Integer>> param) {
	    Map<String,String> result = new HashMap<>(); 
	    
        result.put("msg", "邮件发送成功");
	    
	    List<Integer> ids = param.get("evaluatorId");
	    
	    if(ids == null || ids.size() == 0) {
	        return result;
	    }
	    
	    List<Map<String, Object>> listUserInfo = userInfoMapper.findByIds(ids);
	    
	    // 得到邮件模板
	    String emailTemplate = null;
        try {
            emailTemplate = EmailUtils.getEmailTemplate(EmailConstant.TEMP_UNRATE);
        } catch (Exception e) {
           e.printStackTrace();
           result.put("msg", "email配置文件找不到啦，赶紧联系管理员");
           return result;
        }
        
	    // 替换关键字
        String shiftContent = emailTemplate.replace("${LogisticsAddress}",
                EmailUtils.getProperty(EmailConstant.LOGISTICS_ADDRESS));
	    
        // 得到抄送人邮箱
        String cc = EmailUtils.getProperty(EmailConstant.EMAIL_CC);
        
        try {
            for (Map<String, Object> x : listUserInfo) {
                String targetContent = shiftContent.replace("${name}", (String)x.get("userName"));
                
                Map<String,Object> master = userInfoMapper.findTeamMaster(x);
                
                String ccs = cc+","+master.get("email");
                
                EmailUtils.sendHtmlMailAndBc((String)x.get("email"), 
                            EmailUtils.getProperty(EmailConstant.EMAIL_TITLE_UNRATE), 
                            targetContent,ccs);
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.put("msg", "请检查网络和发送方邮件密码是否正确");
        }
        
        
	    return result;
	}
	
	
}
