package com.shenchangxin.store.service.Impl;


import com.shenchangxin.store.dao.AdminMapper;
import com.shenchangxin.store.entity.Admin;
import com.shenchangxin.store.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

    @Autowired(required = false)
    private AdminMapper adminMapper;

    @Override
    public Admin selectByName(Admin admin) {
        return adminMapper.selectByName(admin);
    }
}
