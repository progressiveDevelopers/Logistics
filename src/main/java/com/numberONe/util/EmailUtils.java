package com.numberONe.util;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.numberONe.constant.EmailConstant;

/**
 * 简单的邮件发送
 * 
 * @author Administrator
 * 
 */
public class EmailUtils {
    
    private  static  final Logger log = LoggerFactory.getLogger(EmailUtils.class);
    
    public static Properties properties = getEmailProps();

    
    /**
     * 加载email properties 文件
     * @return
     */
    public static Properties getEmailProps() {
        System.out.println("开始加载Props");
        Properties prop = new Properties();
        try (InputStream in = EmailUtils.class.getResourceAsStream("/email.properties")){
            prop.load(in);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return prop;
    }

    @Test
    public void unRate() throws Exception {

        String htmlTemp = getEmailTemplate(EmailConstant.TEMP_UNRATE);

        String content = htmlTemp.replace("${name}", "陈宇浩").replace("${LogisticsAddress}",
                getProperty(EmailConstant.LOGISTICS_ADDRESS));

        //sendHtmlMail("chenyh.me@gmail.com", getProperty(EmailConstant.LOGISTICS_ADDRESS), content);
    }
    
    
    @Test
    public void uPwd() throws Exception {
        
        String htmlTemp = getEmailTemplate(EmailConstant.TEMP_UPWD);
        String content = htmlTemp.replace("${name}", "陈宇浩")
                .replace("${newpwd}","123456");

        sendHtmlMail("chenyh.me@gmail.com",getProperty(EmailConstant.EMAIL_TITLE_UPWD), content);
        
    }
    
    
    // 得到邮件HTML模板
    public static String getEmailTemplate(String tempName) throws Exception {
        String str = null;
        try (FileInputStream in = new FileInputStream(EmailUtils.class
                .getResource(properties.getProperty(tempName)).getFile());
                InputStreamReader reader = new InputStreamReader(in);
                BufferedReader br = new BufferedReader(reader)){
            str = br.readLine();
        } catch (Exception e) {
            throw new Exception(e);
        }

        return str;
    }

    /**
     * 
     * @param toEmail 发送给谁
     * @param subject 邮件标题
     * @param centent 邮件内容
     * @throws IOException 
     * @throws MessagingException 
     * @throws AddressException 
     */
    public static void sendHtmlMail(String toEmail,String subject, String centent)
            throws IOException, AddressException, MessagingException {
        // 0.1 确定连接位置
        Properties props = new Properties();
        // 设置邮箱smtp服务器的地址，
        props.setProperty("mail.host", properties.getProperty("mail.smtp.host"));
        // 是否进行权限验证。
        props.setProperty("mail.smtp.auth", properties.getProperty("mail.smtp.auth"));

        final String eamilName = properties.getProperty("emailName");
        final String emailPassword = properties.getProperty("emailPassword");

        // 0.2确定权限（账号和密码）
        Authenticator authenticator = new Authenticator() {
            @Override
            public PasswordAuthentication getPasswordAuthentication() {
                // 填写自己的邮箱的登录帐号和密码
                return new PasswordAuthentication(eamilName, emailPassword);
            }
        };

        Session session = Session.getDefaultInstance(props, authenticator);
        // 2 创建消息html版
        MimeMessage message = new MimeMessage(session);
        // 2.1 发件人 我们自己的邮箱地址，就是名称
        message.setFrom(new InternetAddress(properties.getProperty("fromEmail")));
        // 2.2 发送给谁
        message.setRecipient(RecipientType.TO, new InternetAddress(toEmail));
        // 2.3 主题（标题）
        message.setSubject(properties.getProperty("emailTitleForUnRate"));
        // 2.4 正文
        // 设置编码，防止发送的内容中文乱码。
        message.setContent(centent, "text/html;charset=UTF-8");
        // 3发送消息
        Transport.send(message);
        log.error("邮件发送成功内容--》"+centent);
    }
    
    
    
    /**
     * 发送邮件　(暂时只支持163邮箱发送)
     * @param fromEmail　发送邮箱
     * @param toEmail　接收邮箱
     * @param emailName　163邮箱登录名
     * @param emailPassword　密码
     * @param title　发送主题
     * @param centent　发送内容
     * @throws Exception
     */
    public static void sendMail(String fromEmail,String toEmail,String emailName,String emailPassword,String title, String centent) throws Exception {
        
        Properties properties = new Properties();// 创建Properties对象
        properties.setProperty("mail.transport.protocol", "smtp");// 设置传输协议
        properties.put("mail.smtp.host", "smtp.163.com");// 设置发信邮箱的smtp地址
        properties.setProperty("mail.smtp.auth", "true"); // 验证
        Authenticator auth = new AjavaAuthenticator(emailName,
                emailPassword); // 使用验证，创建一个Authenticator
        Session session = Session.getDefaultInstance(properties, auth);// 根据Properties，Authenticator创建Session
        Message message = new MimeMessage(session);// Message存储发送的电子邮件信息
        message.setFrom(new InternetAddress(fromEmail));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(
                toEmail));// 设置收信邮箱
        // 指定邮箱内容及ContentType和编码方式
        message.setContent(centent, "text/html;charset=utf-8");
        message.setSubject(title);// 设置主题
        message.setSentDate(new Date());// 设置发信时间
        Transport.send(message);// 发送

    }
    
    /**
     * 从email.properties得到指定key的值
     * */
    public static String getProperty(String key) {
        return properties.getProperty(key);
    }
    
    
    
}

// 创建传入身份验证信息的 Authenticator类
class AjavaAuthenticator extends Authenticator {
    private String user;
    private String pwd;

    public AjavaAuthenticator(String user, String pwd) {
        this.user = user;
        this.pwd = pwd;
    }

    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(user, pwd);
    }
}