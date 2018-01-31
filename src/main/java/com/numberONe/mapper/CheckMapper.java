/** 
 * @ClassName: CheckMapper 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 * @author gaoguofeng 
 * @date 2018年1月22日 下午5:43:57  
 */
package com.numberONe.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.numberONe.entity.CheckTaskAssignmentFormMap;
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
	
	//更新评论结果
	public void updateCheckResult(List list);
	
	//查询客户经理的分配的详情
	public List<CheckTaskAssignmentFormMap> findAssignTask(Map  map);
	
	//查询客户经理分配的人数
	public Integer findAssignTaskCount(Map  map);
	
}
