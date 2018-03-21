package com.numberONe.constant;

/**
 * email 常量key值
 * @author ChenYuhao
 *
 */
public class EmailConstant {
    
    /** 
     * 邮件模板（HTML)路径（未评分）<br>
     * 需要替换${name},${LogisticsAddress}
     *  */
    public static final String TEMP_UNRATE = "emailTempPathForUnRate";

    /** 
     * 邮件模板（HTML)路径（修改密码提醒）<br>
     * 需要替换 ${name},${newpassword}
     * 
     *  */
    public static final String TEMP_UPWD = "emailTempPathForUpwd";
    
    
    /**
     * 邮件模板（HTML)路径（忘记密码验证）<br>
     * 需要替换 ${name},${code}
     */
    public static final String TEMP_FORGET_PWD = "emailTempPathForForgetPwd";

    
    /** 评分系统外网访问地址  */
    public static final String LOGISTICS_ADDRESS = "LogisticsAddress";
    
    /** 邮件标题（未评分） */
    public static final String EMAIL_TITLE_UNRATE = "emailTitleForUnRate";

    /** 邮件标题（修改密码） */
    public static final String EMAIL_TITLE_UPWD = "emailTitleForUpwd";

    /** 邮件标题（忘记密码验证） */
    public static final String EMAIL_TITLE_FORGET_PWD = "emailTitleForForgetPwd";
}
