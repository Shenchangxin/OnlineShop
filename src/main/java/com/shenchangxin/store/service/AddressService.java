package com.shenchangxin.store.service;

import com.shenchangxin.store.entity.Address;
import com.shenchangxin.store.entity.AddressExample;

import java.util.List;

public interface AddressService {
    public List<Address> getAllAddressByExample(AddressExample addressExample);

    public void updateByPrimaryKeySelective(Address address);

    public void deleteByPrimaryKey(Integer addressid);

    public void insert(Address address);

    public void  insertSelective(Address address);

    public Address selectByPrimaryKey(Integer addressid);
}
