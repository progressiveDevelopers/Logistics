package com.numberONe.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.BAD_REQUEST,reason="配置文件找不到了，会联系管理员")
public class ConfigFileNotFondException  extends RuntimeException {
    
    public ConfigFileNotFondException() {
    }
    
    public ConfigFileNotFondException(String message) {
        super(message);
    }
    
    private static final long serialVersionUID = 458859877759052287L;
}
