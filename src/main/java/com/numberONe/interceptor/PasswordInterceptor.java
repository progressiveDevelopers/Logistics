package com.numberONe.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class PasswordInterceptor implements HandlerInterceptor {

    @Override
    public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2,
            Exception arg3) throws Exception {
    }

    @Override
    public void postHandle(HttpServletRequest req, HttpServletResponse arg1, Object arg2,
            ModelAndView mv) throws Exception {
        Session session = SecurityUtils.getSubject().getSession();
        System.out.println(session.getAttribute("password")); 
        if("123456789".equals(session.getAttribute("password"))) {
            mv.addObject("error", "密码过于简单请及时修改");
            mv.addObject("username",session.getAttribute("username"));
            mv.addObject("change", 1);
            mv.setViewName("redirect:login.shtml");
        }
        
    }

    @Override
    public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2)
            throws Exception {
        return true;
    }

}
