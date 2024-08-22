package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.MyzCommentsMapper;
import com.ruoyi.system.domain.MyzComments;
import com.ruoyi.system.service.IMyzCommentsService;

/**
 * 文章评论Service业务层处理
 * 
 * @author 木有枝
 * @date 2024-08-10
 */
@Service
public class MyzCommentsServiceImpl implements IMyzCommentsService 
{
    @Autowired
    private MyzCommentsMapper myzCommentsMapper;

    /**
     * 查询文章评论
     * 
     * @param commentId 文章评论主键
     * @return 文章评论
     */
    @Override
    public MyzComments selectMyzCommentsByCommentId(Long commentId)
    {
        return myzCommentsMapper.selectMyzCommentsByCommentId(commentId);
    }

    /**
     * 查询文章评论列表
     * 
     * @param myzComments 文章评论
     * @return 文章评论
     */
    @Override
    public List<MyzComments> selectMyzCommentsList(MyzComments myzComments)
    {
        return myzCommentsMapper.selectMyzCommentsList(myzComments);
    }

    /**
     * 新增文章评论
     * 
     * @param myzComments 文章评论
     * @return 结果
     */
    @Override
    public MyzComments insertMyzComments(MyzComments myzComments)
    {
        // 执行插入操作
        int result = myzCommentsMapper.insertMyzComments(myzComments);

        if (result > 0) {
            return myzComments;
        } else {
            // 或者抛出异常，根据你的业务需求
            return null;
        }
    }

    /**
     * 修改文章评论
     * 
     * @param myzComments 文章评论
     * @return 结果
     */
    @Override
    public int updateMyzComments(MyzComments myzComments)
    {
        return myzCommentsMapper.updateMyzComments(myzComments);
    }

    /**
     * 批量删除文章评论
     * 
     * @param commentIds 需要删除的文章评论主键
     * @return 结果
     */
    @Override
    public int deleteMyzCommentsByCommentIds(Long[] commentIds)
    {
        return myzCommentsMapper.deleteMyzCommentsByCommentIds(commentIds);
    }

    /**
     * 删除文章评论信息
     * 
     * @param commentId 文章评论主键
     * @return 结果
     */
    @Override
    public int deleteMyzCommentsByCommentId(Long commentId)
    {
        return myzCommentsMapper.deleteMyzCommentsByCommentId(commentId);
    }
}
