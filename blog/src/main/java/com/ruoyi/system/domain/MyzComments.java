package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 文章评论对象 myz_comments
 * 
 * @author 木有枝
 * @date 2024-08-10
 */
public class MyzComments extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 评论唯一标识符 */
    private Long commentId;

    /** 评论所属文章的ID */
    @Excel(name = "评论所属文章的ID")
    private Long articleId;

    /** 博客类型 */
    @Excel(name = "博客类型")
    private Long articleType;

    /** 发表评论的用户ID，可以为NULL表示匿名用户 */
    @Excel(name = "发表评论的用户ID，可以为NULL表示匿名用户")
    private Long userId;

    /** 用户昵称，当user_id为NULL时使用 */
    @Excel(name = "用户昵称，当user_id为NULL时使用")
    private String userName;

    /** 用户邮箱，用于匿名用户 */
    @Excel(name = "用户邮箱，用于匿名用户")
    private String userEmail;

    /** 被回复的评论ID，如果是顶级评论则为NULL */
    @Excel(name = "被回复的评论ID，如果是顶级评论则为NULL")
    private Long parentCommentId;

    /** 评论内容 */
    @Excel(name = "评论内容")
    private String content;

    /** 评论状态 */
    @Excel(name = "评论状态")
    private String status;

    /** 评论创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "评论创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createdAt;

    public void setCommentId(Long commentId) 
    {
        this.commentId = commentId;
    }

    public Long getCommentId() 
    {
        return commentId;
    }
    public void setArticleId(Long articleId) 
    {
        this.articleId = articleId;
    }

    public Long getArticleId() 
    {
        return articleId;
    }
    public void setArticleType(Long articleType) 
    {
        this.articleType = articleType;
    }

    public Long getArticleType() 
    {
        return articleType;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setUserName(String userName) 
    {
        this.userName = userName;
    }

    public String getUserName() 
    {
        return userName;
    }
    public void setUserEmail(String userEmail) 
    {
        this.userEmail = userEmail;
    }

    public String getUserEmail() 
    {
        return userEmail;
    }
    public void setParentCommentId(Long parentCommentId) 
    {
        this.parentCommentId = parentCommentId;
    }

    public Long getParentCommentId() 
    {
        return parentCommentId;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setCreatedAt(Date createdAt) 
    {
        this.createdAt = createdAt;
    }

    public Date getCreatedAt() 
    {
        return createdAt;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("commentId", getCommentId())
            .append("articleId", getArticleId())
            .append("articleType", getArticleType())
            .append("userId", getUserId())
            .append("userName", getUserName())
            .append("userEmail", getUserEmail())
            .append("parentCommentId", getParentCommentId())
            .append("content", getContent())
            .append("status", getStatus())
            .append("createdAt", getCreatedAt())
            .toString();
    }
}
