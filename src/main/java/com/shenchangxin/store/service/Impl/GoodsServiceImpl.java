package com.shenchangxin.store.service.Impl;


import com.shenchangxin.store.dao.FavoriteMapper;
import com.shenchangxin.store.dao.GoodsMapper;
import com.shenchangxin.store.dao.ImagePathMapper;
import com.shenchangxin.store.entity.*;
import com.shenchangxin.store.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {

    @Autowired(required = false)
    GoodsMapper goodsMapper;

    @Autowired(required = false)
    ImagePathMapper imagePathMapper;

    @Autowired(required = false)
    FavoriteMapper favoriteMapper;

    @Override
    public Integer addGoods(Goods goods) {
        goodsMapper.insertSelective(goods);
        return goods.getGoodsid();
    }

    @Override
    public void addImagePath(ImagePath imagePath) {
        imagePathMapper.insertSelective(imagePath);
    }

    @Override
    public List<Goods> selectByExample(GoodsExample example) {
        return goodsMapper.selectByExampleWithBLOBs(example);
    }

    @Override
    public void deleteGoodsById(Integer goodsid) {

        goodsMapper.deleteByPrimaryKey(goodsid);
    }

    @Override
    public void updateGoodsById(Goods goods) {
        goodsMapper.updateByPrimaryKeySelective(goods);
    }

    @Override
    public List<ImagePath> findImagePath(Integer goodsid) {
        ImagePathExample imagePathExample = new ImagePathExample();
        imagePathExample.or().andGoodidEqualTo(goodsid);

        return imagePathMapper.selectByExample(imagePathExample);
    }

    @Override
    public Goods selectById(Integer goodsid) {
        return goodsMapper.selectByPrimaryKey(goodsid);
    }

    @Override
    public List<Goods> selectByExampleLimit(GoodsExample digGoodsExample) {
        return goodsMapper.selectByExampleWithBLOBsLimit(digGoodsExample);
    }

    @Override
    public void addFavorite(Favorite favorite) {
        favoriteMapper.insertSelective(favorite);
    }

    @Override
    public Favorite selectFavByKey(FavoriteKey favoriteKey) {
        return favoriteMapper.selectByPrimaryKey(favoriteKey);
    }

    @Override
    public void deleteFavByKey(FavoriteKey favoriteKey) {
        favoriteMapper.deleteByPrimaryKey(favoriteKey);
    }

    @Override
    public List<Favorite> selectFavByExample(FavoriteExample favoriteExample) {
        return favoriteMapper.selectByExample(favoriteExample);
    }

    //@Override
//    public List<Goods> selectGoodByGoodsId(List<Integer> goodsIdList){
//        return goodsMapper.selectGoodByGoodsId(goodsIdList);
//    }

}
