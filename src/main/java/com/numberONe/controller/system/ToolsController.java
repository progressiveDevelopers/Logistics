/** 
 * @ClassName: CheckController 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 * @author gaoguofeng 
 * @date 2018年1月18日 下午3:16:12  
 */
package com.numberONe.controller.system;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody; 
import com.numberONe.controller.index.BaseController;
import com.numberONe.entity.ResFormMap;
import com.numberONe.util.Common;

/**
 * @ClassName: CheckController
 * @Description: 利率反推工具
 * @author: gaoguofeng
 * @email: gaoguofengcoder@gmail.com
 * @date: 2019年02月26日14:10:56
 */

@Controller
@RequestMapping("/tools/")
public class ToolsController extends BaseController {

//	@Inject
//	private CheckMapper checkMapper;
	 
	
    /**
     * @description 展示利率反推工具
     * @return 
     * @throws Exception 
     */
    @RequestMapping("input")
    public String input(Model model) throws Exception {
       System.out.println("************test***********");
    	return  Common.BACKGROUND_PATH + "/system/tools/add";
    }
    
    /**
     * @description 展示利率反推工具
     * @return 
     * @throws Exception 
     */
//    @RequestMapping("calculate")
//    public List<ResFormMap> calculate() throws Exception {
//		ResFormMap resFormMap = getFormMap(ResFormMap.class);
//		 
//		return rs;
//	}
}
