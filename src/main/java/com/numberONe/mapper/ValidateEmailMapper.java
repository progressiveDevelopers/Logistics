/** 
 * @ClassName: CheckMapper 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 * @author gaoguofeng 
 * @date 2018年1月22日 下午5:43:57  
 */
package com.numberONe.mapper;


import com.numberONe.entity.ValidateEmailFormMap;
import com.numberONe.mapper.base.BaseMapper;

/** 
 * @ClassName: CheckMapper 
 * @Description: 考核系统 
 * @author: gaoguofeng 
 * @email: 18516523981@163.com
 * @date: 2018年1月22日 下午5:43:57 
 */
public interface ValidateEmailMapper extends BaseMapper {
	
    /**
     * 
     * @param userId 用户的id
     * @return
     */
	Integer getUnusedCodeByUserId(Integer userId);
	
	/**
	 * 检验验证码是否输入
	 * @param validateEmailFormMap
	 * @return
	 */
	Integer validateCode(ValidateEmailFormMap validateEmailFormMap);
	
	/**
	 * 更新验证码状态
	 * 
	 * @param validateEmailFormMap
	 */
	void updateCodeStatus(ValidateEmailFormMap validateEmailFormMap);
	
}
