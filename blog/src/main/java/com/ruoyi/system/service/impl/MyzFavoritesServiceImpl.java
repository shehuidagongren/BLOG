package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.MyzFavoritesMapper;
import com.ruoyi.system.domain.MyzFavorites;
import com.ruoyi.system.service.IMyzFavoritesService;

/**
 * 博客收藏Service业务层处理
 * 
 * @author 木有枝
 * @date 2024-08-10
 */
@Service
public class MyzFavoritesServiceImpl implements IMyzFavoritesService 
{
    @Autowired
    private MyzFavoritesMapper myzFavoritesMapper;

    /**
     * 查询博客收藏
     * 
     * @param id 博客收藏主键
     * @return 博客收藏
     */
    @Override
    public MyzFavorites selectMyzFavoritesById(Long id)
    {
        return myzFavoritesMapper.selectMyzFavoritesById(id);
    }

    /**
     * 查询博客收藏列表
     * 
     * @param myzFavorites 博客收藏
     * @return 博客收藏
     */
    @Override
    public List<MyzFavorites> selectMyzFavoritesList(MyzFavorites myzFavorites)
    {
        return myzFavoritesMapper.selectMyzFavoritesList(myzFavorites);
    }

    /**
     * 新增博客收藏
     * 
     * @param myzFavorites 博客收藏
     * @return 结果
     */
    @Override
    public int insertMyzFavorites(MyzFavorites myzFavorites)
    {
        return myzFavoritesMapper.insertMyzFavorites(myzFavorites);
    }

    /**
     * 修改博客收藏
     * 
     * @param myzFavorites 博客收藏
     * @return 结果
     */
    @Override
    public int updateMyzFavorites(MyzFavorites myzFavorites)
    {
        return myzFavoritesMapper.updateMyzFavorites(myzFavorites);
    }

    /**
     * 批量删除博客收藏
     * 
     * @param ids 需要删除的博客收藏主键
     * @return 结果
     */
    @Override
    public int deleteMyzFavoritesByIds(Long[] ids)
    {
        return myzFavoritesMapper.deleteMyzFavoritesByIds(ids);
    }

    /**
     * 删除博客收藏信息
     * 
     * @param id 博客收藏主键
     * @return 结果
     */
    @Override
    public int deleteMyzFavoritesById(Long id)
    {
        return myzFavoritesMapper.deleteMyzFavoritesById(id);
    }
}
