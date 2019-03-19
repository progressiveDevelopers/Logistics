package com.numberONe.util;

import java.math.BigDecimal;

/**
 * 计算工具类
 */
public class CalculationUtil {
    public static Double getCentesimalSystem(int NonPercentileSystem,Double npsNum){
        double psNum=0;
        try {
            BigDecimal b = new BigDecimal((double)npsNum/NonPercentileSystem*100);
            psNum = b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue(); // 四舍五入取一个小数点

        }catch (Exception e){
            e.printStackTrace();
        }
        return psNum;
    }
}
