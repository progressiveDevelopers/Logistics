package com.numberONe.controller.system;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.numberONe.entity.UserData;
import com.numberONe.mapper.UserDataMapper;
import com.numberONe.util.Common;
import com.numberONe.util.UserRelativeTreeUtil;

@Controller
@RequestMapping("userData")
public class UserDataController {

    @Inject
    private UserDataMapper userDataMapper;
    
    
    @RequestMapping("view")
    public String echartView() {
        return Common.BACKGROUND_PATH + "/system/userData/view";
    }
    
    @RequestMapping(value = "data")
    @ResponseBody
    public List<UserData>  echartData(){
        return userDataMapper.findAll();
    }
    
    @RequestMapping(value = "userRelativeTree")
    @ResponseBody
    public UserRelativeTreeUtil getUserRelativeTree() {
        UserRelativeTreeUtil urt = new UserRelativeTreeUtil();
        
        urt.setName("物流与商业金融部");
        
        List<UserRelativeTreeUtil> urtsLevel1 = null; // 组
        List<UserRelativeTreeUtil> urtsLevel2 = null; // 角色
        List<UserRelativeTreeUtil> urtsLevel3 = null; // 用户
        
        urtsLevel1 = userDataMapper.findAllGroup();
        
        urt.setChildren(urtsLevel1);
        
        //用组数据获取角色信息
        for (UserRelativeTreeUtil userRelativeTreeUtil1 : urtsLevel1) {
            urtsLevel2 = new ArrayList<UserRelativeTreeUtil>();
            urtsLevel2 = userDataMapper.findTargetRole(userRelativeTreeUtil1.getIds());
            userRelativeTreeUtil1.setChildren(urtsLevel2);
            
            // 用组合角色数据获取用户信息
            for (UserRelativeTreeUtil userRelativeTreeUtil2 : urtsLevel2) {
                urtsLevel3 = new ArrayList<UserRelativeTreeUtil>();
                urtsLevel3 = userDataMapper.findTargetUser(userRelativeTreeUtil1.getIds(), 
                        userRelativeTreeUtil2.getIds());
                userRelativeTreeUtil2.setChildren(urtsLevel3);
            }
        }
        
        return urt;
    }
    
    
    @RequestMapping("userRelativeTreeView")
    public String userRelativeTreeView(){
        return Common.BACKGROUND_PATH + "/system/userData/userRelativeTreeView";
    }
    
}
