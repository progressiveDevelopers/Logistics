package com.numberONe.shiro.credentials;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.util.ByteSource;

import com.numberONe.enums.LoginType;
import com.numberONe.shiro.EasyTypeToken;

import java.util.concurrent.atomic.AtomicInteger;

public class RetryLimitHashedCredentialsMatcher extends HashedCredentialsMatcher {
    private Cache<String, AtomicInteger> passwordRetryCache;

    public RetryLimitHashedCredentialsMatcher(CacheManager cacheManager) {
        passwordRetryCache = cacheManager.getCache("passwordRetryCache");
    }

    @Override
    public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
        String username = (String) token.getPrincipal();
        
        EasyTypeToken easyToken = new EasyTypeToken();
        
        try {
            // 强转出错说明使用的帐号密码登陆
            // 否则说明是免密登陆
            easyToken = (EasyTypeToken) token;
        } catch (Exception e) {
            System.out.println("不要担心这个错误，这只是强转错误");
            e.printStackTrace();
        }
        
        //如果是免密登陆则直接返回true
        if (LoginType.NOPASSWD.equals(easyToken.getType())) {
            return true;
        }
        // retry count + 1
        AtomicInteger retryCount = passwordRetryCache.get(username);

        if (retryCount == null) {
            retryCount = new AtomicInteger(0);
            passwordRetryCache.put(username, retryCount);
        }

        if (retryCount.incrementAndGet() > 5) {
            // if retry count > 5 throw
            throw new ExcessiveAttemptsException();
        }

        boolean matches = super.doCredentialsMatch(token, info);

        if (matches) {
            // clear retry count
            passwordRetryCache.remove(username);
        }

        return matches;
    }

    /**
    * build user password
    */
    public String buildCredentials(String userName, String password, String credentialsSalt) {
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(userName,
                password, ByteSource.Util.bytes(userName + credentialsSalt), userName);
        AuthenticationToken token = new UsernamePasswordToken(userName, password);
        return super.hashProvidedCredentials(token, authenticationInfo).toString();
    }
}
