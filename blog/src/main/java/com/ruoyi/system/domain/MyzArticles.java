package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 文章对象 myz_articles
 * 
 * @author ShanYouMuXi
 * @date 2024-08-08
 */
public class MyzArticles extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 文章标题 */
    @Excel(name = "文章标题")
    private String articleTitle;

    /** 文章内容 */
    @Excel(name = "文章内容")
    private String articleContent;

    /** 文章作者编号 */
    @Excel(name = "文章作者编号")
    private Long articleAuthorId;

    /** 文章类型 */
    @Excel(name = "文章类型")
    private Long articleType;

    /** 文章标签 */
    @Excel(name = "文章标签")
    private Long articleTag;

    /** 文章方向 */
    @Excel(name = "文章方向")
    private Long articleDirection;

    /** 文章评论 */
    @Excel(name = "文章评论")
    private String articleComments;

    /** 文章点赞次数 */
    @Excel(name = "文章点赞次数")
    private Long articleLikes;

    /** 文章展示次数 */
    @Excel(name = "文章展示次数")
    private Long articleViews;

    /** 搜索擎优化用的标题 */
    @Excel(name = "搜索擎优化用的标题")
    private String seoTitle;

    /** 搜索引擎优化用的描述 */
    @Excel(name = "搜索引擎优化用的描述")
    private String seoDescription;

    /** 封面图片 */
    @Excel(name = "封面图片")
    private String coverImage;

    /** 存储原文链接 */
    @Excel(name = "存储原文链接")
    private String sourceLink;

    /** 允许评论 */
    @Excel(name = "允许评论")
    private Long allowComments;

    /** 文章状态 */
    @Excel(name = "文章状态")
    private Long articleStatus;

    /** 删除标记 */
    private Long delFlag;

    /** 文章创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "文章创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date articleCreatedAt;

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
    public void setArticleTitle(String articleTitle) 
    {
        this.articleTitle = articleTitle;
    }

    public String getArticleTitle() 
    {
        return articleTitle;
    }
    public void setArticleContent(String articleContent) 
    {
        this.articleContent = articleContent;
    }

    public String getArticleContent() 
    {
        return articleContent;
    }
    public void setArticleAuthorId(Long articleAuthorId) 
    {
        this.articleAuthorId = articleAuthorId;
    }

    public Long getArticleAuthorId() 
    {
        return articleAuthorId;
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
    public void setArticleComments(String articleComments) 
    {
        this.articleComments = articleComments;
    }

    public String getArticleComments() 
    {
        return articleComments;
    }
    public void setArticleLikes(Long articleLikes) 
    {
        this.articleLikes = articleLikes;
    }

    public Long getArticleLikes() 
    {
        return articleLikes;
    }
    public void setArticleViews(Long articleViews) 
    {
        this.articleViews = articleViews;
    }

    public Long getArticleViews() 
    {
        return articleViews;
    }
    public void setSeoTitle(String seoTitle) 
    {
        this.seoTitle = seoTitle;
    }

    public String getSeoTitle() 
    {
        return seoTitle;
    }
    public void setSeoDescription(String seoDescription) 
    {
        this.seoDescription = seoDescription;
    }

    public String getSeoDescription() 
    {
        return seoDescription;
    }
    public void setCoverImage(String coverImage) 
    {
        this.coverImage = coverImage;
    }

    public String getCoverImage() 
    {
        return coverImage;
    }
    public void setSourceLink(String sourceLink) 
    {
        this.sourceLink = sourceLink;
    }

    public String getSourceLink() 
    {
        return sourceLink;
    }
    public void setAllowComments(Long allowComments) 
    {
        this.allowComments = allowComments;
    }

    public Long getAllowComments() 
    {
        return allowComments;
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
    public void setArticleCreatedAt(Date articleCreatedAt) 
    {
        this.articleCreatedAt = articleCreatedAt;
    }

    public Date getArticleCreatedAt() 
    {
        return articleCreatedAt;
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
            .append("articleTitle", getArticleTitle())
            .append("articleContent", getArticleContent())
            .append("articleAuthorId", getArticleAuthorId())
            .append("articleType", getArticleType())
            .append("articleTag", getArticleTag())
            .append("articleDirection", getArticleDirection())
            .append("articleComments", getArticleComments())
            .append("articleLikes", getArticleLikes())
            .append("articleViews", getArticleViews())
            .append("seoTitle", getSeoTitle())
            .append("seoDescription", getSeoDescription())
            .append("coverImage", getCoverImage())
            .append("sourceLink", getSourceLink())
            .append("allowComments", getAllowComments())
            .append("articleStatus", getArticleStatus())
            .append("delFlag", getDelFlag())
            .append("articleCreatedAt", getArticleCreatedAt())
            .append("articleUpdatedAt", getArticleUpdatedAt())
            .toString();
    }
}
