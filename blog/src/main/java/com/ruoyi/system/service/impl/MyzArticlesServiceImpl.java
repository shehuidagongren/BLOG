package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.MyzArticlesMapper;
import com.ruoyi.system.domain.MyzArticles;
import com.ruoyi.system.service.IMyzArticlesService;

/**
 * 文章Service业务层处理
 * 
 * @author ShanYouMuXi
 * @date 2024-08-08
 */

@Service
public class MyzArticlesServiceImpl implements IMyzArticlesService 
{
    @Autowired
    private MyzArticlesMapper myzArticlesMapper;

    /**
     * 查询文章
     * 
     * @param id 文章主键
     * @return 文章
     */
    @Override
    public MyzArticles selectMyzArticlesById(Long id)
    {
        return myzArticlesMapper.selectMyzArticlesById(id);
    }

    /**
     * 查询文章列表
     * 
     * @param myzArticles 文章
     * @return 文章
     */
    @Override
    public List<MyzArticles> selectMyzArticlesList(MyzArticles myzArticles)
    {
        return myzArticlesMapper.selectMyzArticlesList(myzArticles);
    }

    /**
     * 新增文章
     * 
     * @param myzArticles 文章
     * @return 结果
     */
    @Override
    public int insertMyzArticles(MyzArticles myzArticles)
    {
        return myzArticlesMapper.insertMyzArticles(myzArticles);
    }

    /**
     * 修改文章
     * 
     * @param myzArticles 文章
     * @return 结果
     */
    @Override
    public int updateMyzArticles(MyzArticles myzArticles)
    {
        return myzArticlesMapper.updateMyzArticles(myzArticles);
    }

    /**
     * 批量删除文章
     * 
     * @param ids 需要删除的文章主键
     * @return 结果
     */
    @Override
    public int deleteMyzArticlesByIds(Long[] ids)
    {
        return myzArticlesMapper.deleteMyzArticlesByIds(ids);
    }

    /**
     * 删除文章信息
     * 
     * @param id 文章主键
     * @return 结果
     */
    @Override
    public int deleteMyzArticlesById(Long id)
    {
        return myzArticlesMapper.deleteMyzArticlesById(id);
    }
}
