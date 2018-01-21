/** 
 * @ClassName: CheckController 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 * @author gaoguofeng 
 * @date 2018年1月18日 下午3:16:12  
 */
package com.numberONe.controller.system;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.numberONe.controller.index.BaseController;
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
public class CheckController extends BaseController{
	
	@RequestMapping("index")
	public String welcome() throws Exception{
		return Common.BACKGROUND_PATH + "/function/check/index";
	}
	
	@RequestMapping("checkResult")
	public String assessList(){
		return Common.BACKGROUND_PATH + "/function/check/checkResult";
	}
	
}
