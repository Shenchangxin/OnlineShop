package com.shenchangxin.store.service;


import com.shenchangxin.store.entity.Comment;
import com.shenchangxin.store.entity.CommentExample;

import java.util.List;

public interface CommentService {
    public void insertSelective(Comment comment);

    public List<Comment> selectByExample(CommentExample commentExample);
}
