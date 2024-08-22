package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 博客收藏对象 myz_favorites
 * 
 * @author 木有枝
 * @date 2024-08-10
 */
public class MyzFavorites extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 唯一标识符 */
    private Long id;

    /** 收藏的博客或文章标题 */
    @Excel(name = "收藏的博客或文章标题")
    private String title;

    /** 对博客或文章的描述 */
    @Excel(name = "对博客或文章的描述")
    private String description;

    /** 博客或文章的URL链接 */
    @Excel(name = "博客或文章的URL链接")
    private String url;

    /** 博客或文章的作者 */
    @Excel(name = "博客或文章的作者")
    private String author;

    /** 额外的笔记或评论 */
    @Excel(name = "额外的笔记或评论")
    private String notes;

    /** 文章类型 */
    @Excel(name = "文章类型")
    private Long articleType;

    /** 文章标签 */
    @Excel(name = "文章标签")
    private Long articleTag;

    /** 文章方向 */
    @Excel(name = "文章方向")
    private Long articleDirection;

    /** 文章状态 */
    @Excel(name = "文章状态")
    private Long articleStatus;

    /** 删除标记 */
    private Long delFlag;

    /** 收藏日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "收藏日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date favoriteDate;

    /** 文章更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "文章更新时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date articleUpdatedAt;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }
    public void setUrl(String url) 
    {
        this.url = url;
    }

    public String getUrl() 
    {
        return url;
    }
    public void setAuthor(String author) 
    {
        this.author = author;
    }

    public String getAuthor() 
    {
        return author;
    }
    public void setNotes(String notes) 
    {
        this.notes = notes;
    }

    public String getNotes() 
    {
        return notes;
    }
    public void setArticleType(Long articleType) 
    {
        this.articleType = articleType;
    }

    public Long getArticleType() 
    {
        return articleType;
    }
    public void setArticleTag(Long articleTag) 
    {
        this.articleTag = articleTag;
    }

    public Long getArticleTag() 
    {
        return articleTag;
    }
    public void setArticleDirection(Long articleDirection) 
    {
        this.articleDirection = articleDirection;
    }

    public Long getArticleDirection() 
    {
        return articleDirection;
    }
    public void setArticleStatus(Long articleStatus) 
    {
        this.articleStatus = articleStatus;
    }

    public Long getArticleStatus() 
    {
        return articleStatus;
    }
    public void setDelFlag(Long delFlag) 
    {
        this.delFlag = delFlag;
    }

    public Long getDelFlag() 
    {
        return delFlag;
    }
    public void setFavoriteDate(Date favoriteDate) 
    {
        this.favoriteDate = favoriteDate;
    }

    public Date getFavoriteDate() 
    {
        return favoriteDate;
    }
    public void setArticleUpdatedAt(Date articleUpdatedAt) 
    {
        this.articleUpdatedAt = articleUpdatedAt;
    }

    public Date getArticleUpdatedAt() 
    {
        return articleUpdatedAt;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("title", getTitle())
            .append("description", getDescription())
            .append("url", getUrl())
            .append("author", getAuthor())
            .append("notes", getNotes())
            .append("articleType", getArticleType())
            .append("articleTag", getArticleTag())
            .append("articleDirection", getArticleDirection())
            .append("articleStatus", getArticleStatus())
            .append("delFlag", getDelFlag())
            .append("favoriteDate", getFavoriteDate())
            .append("articleUpdatedAt", getArticleUpdatedAt())
            .toString();
    }
}
