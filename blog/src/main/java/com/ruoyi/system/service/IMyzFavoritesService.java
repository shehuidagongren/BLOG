package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.MyzFavorites;

/**
 * 博客收藏Service接口
 * 
 * @author 木有枝
 * @date 2024-08-10
 */
public interface IMyzFavoritesService 
{
    /**
     * 查询博客收藏
     * 
     * @param id 博客收藏主键
     * @return 博客收藏
     */
    public MyzFavorites selectMyzFavoritesById(Long id);

    /**
     * 查询博客收藏列表
     * 
     * @param myzFavorites 博客收藏
     * @return 博客收藏集合
     */
    public List<MyzFavorites> selectMyzFavoritesList(MyzFavorites myzFavorites);

    /**
     * 新增博客收藏
     * 
     * @param myzFavorites 博客收藏
     * @return 结果
     */
    public int insertMyzFavorites(MyzFavorites myzFavorites);

    /**
     * 修改博客收藏
     * 
     * @param myzFavorites 博客收藏
     * @return 结果
     */
    public int updateMyzFavorites(MyzFavorites myzFavorites);

    /**
     * 批量删除博客收藏
     * 
     * @param ids 需要删除的博客收藏主键集合
     * @return 结果
     */
    public int deleteMyzFavoritesByIds(Long[] ids);

    /**
     * 删除博客收藏信息
     * 
     * @param id 博客收藏主键
     * @return 结果
     */
    public int deleteMyzFavoritesById(Long id);
}
