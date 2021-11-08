package com.shenchangxin.store.service.Impl;

import com.shenchangxin.store.controller.front.OrderController;
import com.shenchangxin.store.entity.EmailSend;
import com.shenchangxin.store.service.EmailService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import java.time.LocalDate;


@Service("emailService")
public class EmailServiceImpl implements EmailService {

    private static final Logger log = LoggerFactory.getLogger(EmailServiceImpl.class);

    @Value("${mail.username}")
    private String sender;

    @Value("${mail.receive}")
    private String receiver;

    @Value("${mail.receive2}")
    private String twoDog;


    static MailSender mailSender;

    public EmailServiceImpl() {
    }

    public EmailServiceImpl(MailSender mailSender) {
        this.mailSender = mailSender;
    }

    @Override
    public void sendEmailToAdmin() {
        EmailSend emailSend = new EmailSend();
        emailSend.setSubject("用户购买信息");
        emailSend.setContent("today is " + LocalDate.now() + ",有新用户购买");
//        emailSend.setReceivers();
        log.info("开始发送邮件了");
        SimpleMailMessage message = new SimpleMailMessage();
        //谁发的
        message.setFrom(sender);
        //谁要接收
        message.setTo(receiver);
        //邮件标题
        message.setSubject(emailSend.getSubject());
        //邮件内容
        message.setText(emailSend.getContent());
        try {
            mailSender.send(message);
        } catch (MailException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void sendEmailToUser() {

        EmailSend emailSend = new EmailSend();
        emailSend.setSubject("管理员已经发货");
        emailSend.setContent("today is " + LocalDate.now() + ",商城已经发货");
//        emailSend.setReceivers();
        log.info("开始发送邮件了");
        SimpleMailMessage message = new SimpleMailMessage();
        //谁发的
        message.setFrom(receiver);
        //谁要接收
        message.setTo(sender);
        //邮件标题
        message.setSubject(emailSend.getSubject());
        //邮件内容
        message.setText(emailSend.getContent());
        try {
            mailSender.send(message);
        } catch (MailException e) {
            e.printStackTrace();
        }


    }
}
