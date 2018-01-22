package com.numberONe.entity;

import com.numberONe.annotation.TableSeg;
import com.numberONe.util.FormMap;

@TableSeg(tableName = "ly_user_data", id="id")
public class UserData extends FormMap<String, Object>{
    private static final long serialVersionUID = 1;
}