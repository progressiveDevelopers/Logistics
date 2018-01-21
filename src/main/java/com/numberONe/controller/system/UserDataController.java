package com.numberONe.controller.system;

import java.util.List;

import javax.inject.Inject;

import org.omg.PortableServer.REQUEST_PROCESSING_POLICY_ID;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.numberONe.entity.UserData;
import com.numberONe.mapper.UserDataMapper;
import com.numberONe.util.Common;

@Controller
@RequestMapping("userData")
public class UserDataController {

    @Inject
    private UserDataMapper userDataMapper;
    
    
    @RequestMapping("view")
    public String echartView() {
        
        
        return Common.BACKGROUND_PATH + "/system/userData/view";
    }
    
    @RequestMapping(value = "data",method = RequestMethod.GET)
    @ResponseBody
    public List<UserData>  echartData(){
        return userDataMapper.findAll();
    }
    
    
}
