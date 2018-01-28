/** 
 * @ClassName: CheckMapper 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 * @author gaoguofeng 
 * @date 2018年1月22日 下午5:43:57  
 */
package com.numberONe.mapper;

import java.util.List;

import com.numberONe.entity.ResFormMap;
import com.numberONe.mapper.base.BaseMapper;

/** 
 * @ClassName: CheckMapper 
 * @Description: 考核系统 
 * @author: gaoguofeng 
 * @email: 18516523981@163.com
 * @date: 2018年1月22日 下午5:43:57 
 */
public interface CheckMapper extends BaseMapper {
	
	public List<ResFormMap> findRes(ResFormMap map);
	
	public void updateCheckResult(List list);
	
	

}
