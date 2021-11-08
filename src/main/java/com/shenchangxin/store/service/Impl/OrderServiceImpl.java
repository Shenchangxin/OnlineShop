package com.shenchangxin.store.service.Impl;


import com.shenchangxin.store.dao.AddressMapper;
import com.shenchangxin.store.dao.OrderItemMapper;
import com.shenchangxin.store.dao.OrderMapper;
import com.shenchangxin.store.entity.*;
import com.shenchangxin.store.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

    @Autowired(required = false)
    private OrderMapper orderMapper;

    @Autowired(required = false)
    private OrderItemMapper orderItemMapper;

    @Autowired(required = false)
    private AddressMapper addressMapper;

    @Override
    public void insertOrder(Order order) {
        orderMapper.insertSelective(order);
    }

    @Override
    public void deleteById(Integer orderid) {
        orderMapper.deleteByPrimaryKey(orderid);
    }


    @Override
    public List<Order> selectOrderByExample(OrderExample orderExample) {
        return orderMapper.selectByExample(orderExample);
    }

    @Override
    public List<OrderItem> getOrderItemByExample(OrderItemExample orderItemExample) {
        return orderItemMapper.selectByExample(orderItemExample);
    }

    @Override
    public Address getAddressByKey(Integer addressid) {
        return addressMapper.selectByPrimaryKey(addressid);
    }

    @Override
    public void updateOrderByKey(Order order) {
        orderMapper.updateByPrimaryKeySelective(order);
    }

    @Override
    public Order selectByPrimaryKey(Integer orderid) {
        return orderMapper.selectByPrimaryKey(orderid);
    }

    @Override
    public void insertOrderItem(OrderItem orderItem) {
        orderItemMapper.insertSelective(orderItem);
    }
}
