package com.shenchangxin.store.service;


import com.shenchangxin.store.entity.ShopCart;
import com.shenchangxin.store.entity.ShopCartExample;
import com.shenchangxin.store.entity.ShopCartKey;

import java.util.List;

public interface ShopCartService {
    public void addShopCart(ShopCart shopCart);

    public List<ShopCart> selectByExample(ShopCartExample shopCartExample);

    public void deleteByKey(ShopCartKey shopCartKey);

    public void updateCartByKey(ShopCart shopCart);

    public ShopCart selectCartByKey(ShopCartKey shopCartKey);
}
