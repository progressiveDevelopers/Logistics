package com.numberONe.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.FORBIDDEN,reason="密码错误")
public class PasswordErrorExpection extends RuntimeException {
    private static final long serialVersionUID = -7819811364901006813L;
    public PasswordErrorExpection() {
        // TODO Auto-generated constructor stub
    }
    
    public PasswordErrorExpection(String message) {
        super(message);
    }
    
}
