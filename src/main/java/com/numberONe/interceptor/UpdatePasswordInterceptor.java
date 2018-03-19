package com.numberONe.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.numberONe.constant.EmailConstant;
import com.numberONe.entity.UserFormMap;
import com.numberONe.util.EmailUtils;

public class UpdatePasswordInterceptor implements HandlerInterceptor {

    @Override
    public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2,
            Exception arg3) throws Exception {
        
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse arg1, Object arg2,
            ModelAndView arg3) throws Exception {
        UserFormMap userFormMap = (UserFormMap) request.getAttribute("newUserFormMap");
        
        String emailTemplate = EmailUtils.getEmailTemplate(EmailConstant.TEMP_UPWD);
        String content = emailTemplate.replace("${name}", userFormMap.getStr("userName"))
               .replace("${newpassword}",userFormMap.getStr("password"));
        
        String toEmail = userFormMap.getStr("email");
        
        
        EmailUtils.sendHtmlMail(toEmail, EmailUtils.getProperty(EmailConstant.EMAIL_TITLE_UPWD), content);
        
        
    }

    @Override
    public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2)
            throws Exception {
        return true;
    }

}
