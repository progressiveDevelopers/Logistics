package com.numberONe.util;

import java.util.List;

public class UserRelativeTreeUtil {
    
    /**
     * 不用id是因为echarts把id识别成关键字段
     */
    private Integer ids;
    
    private String name;

    List<UserRelativeTreeUtil> children;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<UserRelativeTreeUtil> getChildren() {
        return children;
    }

    public void setChildren(List<UserRelativeTreeUtil> children) {
        this.children = children;
    }

    public Integer getIds() {
        return ids;
    }

    public void setIds(Integer ids) {
        this.ids = ids;
    }


}
