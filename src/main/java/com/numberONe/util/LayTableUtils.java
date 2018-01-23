/** 
 * @ClassName: LayTableUtils 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 * @author gaoguofeng 
 * @date 2018年1月23日 下午6:37:42  
 */
package com.numberONe.util;

import java.util.List;

import com.numberONe.entity.CheckTaskAssignmentFormMap;

/**
 * @ClassName: LayTableUtils
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author: gaoguofeng
 * @email: 18516523981@163.com
 * @date: 2018年1月23日 下午6:37:42
 */
public class LayTableUtils<T> {

	private Integer code;
	private String msg;
	private Integer count;
	private List<T> data;

	/**
	 * @return the code
	 */
	public Integer getCode() {
		return code;
	}

	/**
	 * @param code
	 *            the code to set
	 */
	public void setCode(Integer code) {
		this.code = code;
	}

	/**
	 * @return the count
	 */
	public Integer getCount() {
		return count;
	}

	/**
	 * @return the msg
	 */
	public String getMsg() {
		return msg;
	}

	/**
	 * @param msg the msg to set
	 */
	public void setMsg(String msg) {
		this.msg = msg;
	}

	/**
	 * @param count
	 *            the count to set
	 */
	public void setCount(Integer count) {
		this.count = count;
	}

	/**
	 * @return the data
	 */
	public List<T> getData() {
		return data;
	}

	/**
	 * @param data the data to set
	 */
	public void setData(List<T> data) {
		this.data = data;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "LayTableUtils [code=" + code + ", count=" + count + ", data="
				+ data + "]";
	}
	
	

}
