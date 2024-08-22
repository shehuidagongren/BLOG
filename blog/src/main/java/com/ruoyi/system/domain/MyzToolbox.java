package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 工具管理对象 myz_toolbox
 * 
 * @author 木有枝
 * @date 2024-08-13
 */
public class MyzToolbox extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 唯一ID */
    private Long id;

    /** 工具名称 */
    @Excel(name = "工具名称")
    private String toolName;

    /** 工具描述 */
    @Excel(name = "工具描述")
    private String description;

    /** 工具图片 */
    @Excel(name = "工具图片")
    private String imageUrl;

    /** 工具链接 */
    @Excel(name = "工具链接")
    private String linkUrl;

    /** 工具类型 */
    @Excel(name = "工具类型")
    private Long type;

    /** 工具顺序 */
    @Excel(name = "工具顺序")
    private Long orderIndex;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createdAt;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setToolName(String toolName) 
    {
        this.toolName = toolName;
    }

    public String getToolName() 
    {
        return toolName;
    }
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }
    public void setImageUrl(String imageUrl) 
    {
        this.imageUrl = imageUrl;
    }

    public String getImageUrl() 
    {
        return imageUrl;
    }
    public void setLinkUrl(String linkUrl) 
    {
        this.linkUrl = linkUrl;
    }

    public String getLinkUrl() 
    {
        return linkUrl;
    }
    public void setType(Long type) 
    {
        this.type = type;
    }

    public Long getType() 
    {
        return type;
    }
    public void setOrderIndex(Long orderIndex) 
    {
        this.orderIndex = orderIndex;
    }

    public Long getOrderIndex() 
    {
        return orderIndex;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
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
            .append("toolName", getToolName())
            .append("description", getDescription())
            .append("imageUrl", getImageUrl())
            .append("linkUrl", getLinkUrl())
            .append("type", getType())
            .append("orderIndex", getOrderIndex())
            .append("userId", getUserId())
            .append("createdAt", getCreatedAt())
            .toString();
    }
}
