/** 
 * @ClassName: HelloController 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 * @author gaoguofeng 
 * @date 2018年1月17日 下午3:13:52  
 */
package com.numberONe.controller.system;
   
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.numberONe.controller.index.BaseController;
import com.numberONe.entity.Test;

/**
 * @ClassName: HelloController
 * @Description: 测试类1
 * @author gaoguofeng
 * @date 2018年1月17日 下午3:13:52
 */
@Controller
public class TestController extends BaseController {

	@RequestMapping(method = RequestMethod.GET)
	public String printHello(ModelMap model) {
		model.addAttribute("message", "Hello Spring MVC Framework!");
		return "hello";
	}

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public ModelAndView student() {
		return new ModelAndView("helloTest", "command", new Test());
	}

	@RequestMapping(value = "/addTest", method = RequestMethod.POST)
	public String addStudent(@ModelAttribute("SpringWeb") Test test,
			ModelMap model) {
		model.addAttribute("name", test.getName());
		model.addAttribute("age", test.getAge());
		model.addAttribute("id", test.getId());
		return "resultTest";
	}
	
	
	  @RequestMapping(value = "/index1", method = RequestMethod.GET)
	   public String index() {
	       return "helloTest";
	   }   
	   @RequestMapping(value = "/redirect", method = RequestMethod.POST)
	   public String redirect() {     
	      return "redirect:finalPage.shtml";
	   }   
	   @RequestMapping(value = "/finalPage", method = RequestMethod.GET)
	   public String finalPage() {     
	      return "resultTest";
	   }

}
