package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.MyzComments;

/**
 * 文章评论Service接口
 * 
 * @author 木有枝
 * @date 2024-08-10
 */
public interface IMyzCommentsService 
{
    /**
     * 查询文章评论
     * 
     * @param commentId 文章评论主键
     * @return 文章评论
     */
    public MyzComments selectMyzCommentsByCommentId(Long commentId);

    /**
     * 查询文章评论列表
     * 
     * @param myzComments 文章评论
     * @return 文章评论集合
     */
    public List<MyzComments> selectMyzCommentsList(MyzComments myzComments);

    /**
     * 新增文章评论
     * 
     * @param myzComments 文章评论
     * @return 结果
     */
    public MyzComments insertMyzComments(MyzComments myzComments);

    /**
     * 修改文章评论
     * 
     * @param myzComments 文章评论
     * @return 结果
     */
    public int updateMyzComments(MyzComments myzComments);

    /**
     * 批量删除文章评论
     * 
     * @param commentIds 需要删除的文章评论主键集合
     * @return 结果
     */
    public int deleteMyzCommentsByCommentIds(Long[] commentIds);

    /**
     * 删除文章评论信息
     * 
     * @param commentId 文章评论主键
     * @return 结果
     */
    public int deleteMyzCommentsByCommentId(Long commentId);
}
