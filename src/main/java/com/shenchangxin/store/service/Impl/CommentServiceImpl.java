package com.shenchangxin.store.service.Impl;


import com.shenchangxin.store.dao.CommentMapper;
import com.shenchangxin.store.entity.Comment;
import com.shenchangxin.store.entity.CommentExample;
import com.shenchangxin.store.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("commentService")
public class CommentServiceImpl implements CommentService {

    @Autowired(required = false)
    private CommentMapper commentMapper;

    @Override
    public void insertSelective(Comment comment){
        commentMapper.insertSelective(comment);
    }

    @Override
    public List<Comment> selectByExample(CommentExample commentExample) {
        return commentMapper.selectByExample(commentExample);
    }

}
