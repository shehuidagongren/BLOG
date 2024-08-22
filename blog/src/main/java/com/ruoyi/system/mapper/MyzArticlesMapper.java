package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.MyzArticles;
import org.apache.ibatis.annotations.Mapper;

/**
 * 文章Mapper接口
 * 
 * @author ShanYouMuXi
 * @date 2024-08-08
 */
@Mapper
public interface MyzArticlesMapper 
{
    /**
     * 查询文章
     * 
     * @param id 文章主键
     * @return 文章
     */
    public MyzArticles selectMyzArticlesById(Long id);

    /**
     * 查询文章列表
     * 
     * @param myzArticles 文章
     * @return 文章集合
     */
    public List<MyzArticles> selectMyzArticlesList(MyzArticles myzArticles);

    /**
     * 新增文章
     * 
     * @param myzArticles 文章
     * @return 结果
     */
    public int insertMyzArticles(MyzArticles myzArticles);

    /**
     * 修改文章
     * 
     * @param myzArticles 文章
     * @return 结果
     */
    public int updateMyzArticles(MyzArticles myzArticles);

    /**
     * 删除文章
     * 
     * @param id 文章主键
     * @return 结果
     */
    public int deleteMyzArticlesById(Long id);

    /**
     * 批量删除文章
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMyzArticlesByIds(Long[] ids);
}
