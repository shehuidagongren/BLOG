package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 学习目标对象 myz_goal
 * 
 * @author 木有枝
 * @date 2024-08-13
 */
public class MyzGoal extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 唯一标识符 */
    private Long id;

    /** 目标名称 */
    @Excel(name = "目标名称")
    private String goalName;

    /** 目标描述 */
    @Excel(name = "目标描述")
    private String description;

    /** 目标状态 */
    @Excel(name = "目标状态")
    private Long status;

    /** 目标类型 */
    @Excel(name = "目标类型")
    private Long goalType;

    /** 目标标签 */
    @Excel(name = "目标标签")
    private Long goalTag;

    /** 图片URL */
    @Excel(name = "图片URL")
    private String imageUrl;

    /** 网站链接 */
    @Excel(name = "网站链接")
    private String websiteUrl;

    /** 前置条件 */
    @Excel(name = "前置条件")
    private String precondition;

    /** 博客索引 */
    @Excel(name = "博客索引")
    private Long articleId;

    /** 展示顺序 */
    @Excel(name = "展示顺序")
    private Long orderIndex;

    /** 实现时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "实现时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date comeTrueData;

    /** 收藏时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "收藏时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createdAt;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setGoalName(String goalName) 
    {
        this.goalName = goalName;
    }

    public String getGoalName() 
    {
        return goalName;
    }
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }
    public void setStatus(Long status) 
    {
        this.status = status;
    }

    public Long getStatus() 
    {
        return status;
    }
    public void setGoalType(Long goalType) 
    {
        this.goalType = goalType;
    }

    public Long getGoalType() 
    {
        return goalType;
    }
    public void setGoalTag(Long goalTag) 
    {
        this.goalTag = goalTag;
    }

    public Long getGoalTag() 
    {
        return goalTag;
    }
    public void setImageUrl(String imageUrl) 
    {
        this.imageUrl = imageUrl;
    }

    public String getImageUrl() 
    {
        return imageUrl;
    }
    public void setWebsiteUrl(String websiteUrl) 
    {
        this.websiteUrl = websiteUrl;
    }

    public String getWebsiteUrl() 
    {
        return websiteUrl;
    }
    public void setPrecondition(String precondition) 
    {
        this.precondition = precondition;
    }

    public String getPrecondition() 
    {
        return precondition;
    }
    public void setArticleId(Long articleId) 
    {
        this.articleId = articleId;
    }

    public Long getArticleId() 
    {
        return articleId;
    }
    public void setOrderIndex(Long orderIndex) 
    {
        this.orderIndex = orderIndex;
    }

    public Long getOrderIndex() 
    {
        return orderIndex;
    }
    public void setComeTrueData(Date comeTrueData) 
    {
        this.comeTrueData = comeTrueData;
    }

    public Date getComeTrueData() 
    {
        return comeTrueData;
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
            .append("id", getId())
            .append("goalName", getGoalName())
            .append("description", getDescription())
            .append("status", getStatus())
            .append("goalType", getGoalType())
            .append("goalTag", getGoalTag())
            .append("imageUrl", getImageUrl())
            .append("websiteUrl", getWebsiteUrl())
            .append("precondition", getPrecondition())
            .append("articleId", getArticleId())
            .append("orderIndex", getOrderIndex())
            .append("comeTrueData", getComeTrueData())
            .append("createdAt", getCreatedAt())
            .toString();
    }
}
