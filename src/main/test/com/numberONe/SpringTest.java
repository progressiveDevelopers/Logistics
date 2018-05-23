package com.numberONe;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.numberONe.util.TimeConUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-application.xml"}) //加载配置文件   
public class SpringTest {
    
    @Autowired
    private TimeConUtil timeConUtil;
    
    @Test
    public void TimeTask() {
        System.out.println(timeConUtil);
        try {
            timeConUtil.sendEmailForUnRate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    @Test
    public void TimeTaskRateInfo() {
        System.out.println(timeConUtil);
        try {
            timeConUtil.findUserInfoList();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    
    
    
    
}
