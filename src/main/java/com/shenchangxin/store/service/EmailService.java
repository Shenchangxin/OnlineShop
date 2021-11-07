package com.shenchangxin.store.service;


public interface EmailService {
    /**
     * 用户购买成功后 发送邮件给管理员
     */
    public void sendEmailToAdmin();

    /**
     * 管理员发货后 发送邮件给用户
     */
    public void sendEmailToUser();

}
