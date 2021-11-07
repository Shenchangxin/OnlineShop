package com.shenchangxin.store.service;


import com.shenchangxin.store.entity.Activity;
import com.shenchangxin.store.entity.ActivityExample;

import java.util.List;

public interface ActivityService {
    List<Activity> getAllActivity(ActivityExample activityExample);

    void insertActivitySelective(Activity activity);

    Activity selectByKey(Integer activityid);

    void deleteByActivityId(Integer activityid);

//    void updateGoodsActSelective(Goods goods);
}
