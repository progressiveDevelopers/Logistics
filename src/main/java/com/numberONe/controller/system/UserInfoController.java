package com.numberONe.controller.system;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.numberONe.controller.index.BaseController;
import com.numberONe.entity.CheckMonthFormMap;
import com.numberONe.entity.UserFormMap;
import com.numberONe.entity.UserInfoView;
import com.numberONe.mapper.CheckMonthMapper;
import com.numberONe.mapper.UserInfoMapper;
import com.numberONe.util.Common;
import com.numberONe.util.LayTableUtils;
import com.numberONe.util.UserRelativeTreeUtil;

@Controller
@RequestMapping("userInfo")
public class UserInfoController extends BaseController {

    @Inject
    private UserInfoMapper userInfoMapper;

    @Inject
    private CheckMonthMapper checkMonthMapper;

    @RequestMapping(value = "userRelativeTree")
    @ResponseBody
    public UserRelativeTreeUtil getUserRelativeTree() {
        UserRelativeTreeUtil urt = new UserRelativeTreeUtil();

        urt.setName("物流与商业金融部");

        List<UserRelativeTreeUtil> urtsLevel1 = null; // 组
        List<UserRelativeTreeUtil> urtsLevel2 = null; // 角色
        List<UserRelativeTreeUtil> urtsLevel3 = null; // 用户

        urtsLevel1 = userInfoMapper.findAllGroup();

        urt.setChildren(urtsLevel1);

        // 用组数据获取角色信息
        for (UserRelativeTreeUtil userRelativeTreeUtil1 : urtsLevel1) {
            urtsLevel2 = new ArrayList<UserRelativeTreeUtil>();
            urtsLevel2 = userInfoMapper.findTargetRole(userRelativeTreeUtil1.getIds());
            userRelativeTreeUtil1.setChildren(urtsLevel2);

            // 用组合角色数据获取用户信息
            for (UserRelativeTreeUtil userRelativeTreeUtil2 : urtsLevel2) {
                urtsLevel3 = new ArrayList<UserRelativeTreeUtil>();
                urtsLevel3 = userInfoMapper.findTargetUser(userRelativeTreeUtil1.getIds(),
                        userRelativeTreeUtil2.getIds());
                userRelativeTreeUtil2.setChildren(urtsLevel3);
            }
        }

        return urt;
    }

    @RequestMapping("userRelativeTreeView")
    public String userRelativeTreeView() {
        return Common.BACKGROUND_PATH + "/system/userInfo/userRelativeTreeView";
    }

    /**
     * 下属信息页面
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("subordinateRateView")
    public ModelAndView getSubordinateView(ModelAndView mv) throws Exception {
        List<CheckMonthFormMap> listCheckMonth = checkMonthMapper.getAllMonthByDesc();
        mv.addObject("listCheckMonth", listCheckMonth);
        mv.setViewName(Common.BACKGROUND_PATH + "/system/userInfo/SubordinateView");
        return mv;
    }

    /**
     * 人员信息
     * 得到当前人员下属的信息
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("subordinateRate")
    @ResponseBody
    public LayTableUtils<UserInfoView> getSubordinate(HttpServletRequest request) throws Exception {

        LayTableUtils<UserInfoView> layTableUtils = new LayTableUtils<UserInfoView>();

        layTableUtils.setCode(0);
        layTableUtils.setCount(1000);

        // 当验证都通过后，把用户信息放在session里
        UserFormMap userFormMap = getFormMap(UserFormMap.class);

        userFormMap = (UserFormMap) Common.findUserSession(request);

        // 当前用户的全量信息
        UserInfoView userInfoView = userInfoMapper.findById((Integer) userFormMap.get("id"));

        // 下属的信息全量
        List<UserInfoView> listUserInfoView = userInfoMapper.findSubordinate(userInfoView);

        layTableUtils.setData(listUserInfoView);

        return layTableUtils;
    }

    @RequestMapping("rateInfo")
    public ModelAndView rateInfo(ModelAndView mv,Integer userId) {
        List<CheckMonthFormMap> listCheckMonth = checkMonthMapper.getAllMonthByDesc();
        mv.addObject("listCheckMonth", listCheckMonth);
        if(userId == null) {
            mv.setViewName(Common.BACKGROUND_PATH + "/system/userInfo/rateInfo");
        } else {
            mv.setViewName(Common.BACKGROUND_PATH + "/system/userInfo/alertRateInfo");
            mv.addObject("userId", userId);
        }
        return mv;
    }

    @RequestMapping("rateInfoDataTargetMonth")
    @ResponseBody
    public List<Map<String, Object>> rateInfoDataTargetMonth(Integer userId, Integer monthId) {
        return userInfoMapper.getRateByMonthAndUser(userId, monthId);
    }

    @RequestMapping("rateInfoDataAllMonth")
    @ResponseBody
    public Map<String, Object> rateInfoDataAllMonth(Integer userId) {
        List<Map<String, Object>> listData = userInfoMapper.rateInfoDataAllMonth(userId);

        Map<String, Object> returnMap = new HashMap<String, Object>();
        List<Map<String, Object>> returnList = null;
        /*
         * month evaluatorId evaluator total 
         * 2018年2月 4 骆敬忠 59 0 
         * 2018年2月 5 郭雪山 41 1 
         * 2018年2月 6 范毛毛 70 1 
         * 2018年2月 7 王维 58 0 
         * 2018年2月 8 王林飞 60 0 
         * 2018年3月 4 骆敬忠 59 0 
         * 2018年3月 5 郭雪山 41 1 
         * 2018年3月 6 范毛毛 70 1
         * 2018年3月 7 王维 58 0
         * 2018年3月 8 王林飞 60 0
         */
        String month = null;
        try {
            for (Map<String, Object> map : listData) {
                String tmpMonth = (String) map.get("month");
                if (!returnMap.containsKey(tmpMonth)) {
                    if (returnMap.size() == 0) { // 第一个
                        returnMap.put(tmpMonth, null);
                        month = tmpMonth;
                        if (returnList != null) {
                            returnMap.put(month, returnList);
                        }
                    } else { //  中间
                        returnMap.put(tmpMonth, null);
                        if (returnList != null) {
                            returnMap.put(month, returnList);
                        }
                    }
                    returnList = new ArrayList<Map<String, Object>>();
                    returnList.add(map);
                } else {
                    returnList.add(map);
                }

                month = tmpMonth;
            }
            
            // 最后一个
            returnMap.put(month, null);
            if (returnList != null) {
                returnMap.put(month, returnList);
            }
            
            
//            for (int i = 0,size = listData.size(); i < size; i++) {
//                if(i == 0) {
//                    
//                    
//                    
//                }
//                
//                
//            }
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return returnMap;
    }

}
