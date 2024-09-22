package com.ruoyi.web.controller.blog;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.MyzFavorites;
import com.ruoyi.system.service.IMyzFavoritesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 博客收藏Controller
 * 
 * @author 木有枝
 * @date 2024-08-10
 */
@RestController
@RequestMapping("/blog/favorites")
public class MyzFavoritesController extends BaseController
{
    @Autowired
    private IMyzFavoritesService myzFavoritesService;

    /**
     * 查询博客收藏列表
     */
    @Anonymous
    @GetMapping("/list")
    public TableDataInfo list(MyzFavorites myzFavorites)
    {
        startPage();
        List<MyzFavorites> list = myzFavoritesService.selectMyzFavoritesList(myzFavorites);
        return getDataTable(list);
    }

    /**
     * 导出博客收藏列表
     */
    @PreAuthorize("@ss.hasPermi('blog:favorites:export')")
    @Log(title = "博客收藏", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MyzFavorites myzFavorites)
    {
        List<MyzFavorites> list = myzFavoritesService.selectMyzFavoritesList(myzFavorites);
        ExcelUtil<MyzFavorites> util = new ExcelUtil<MyzFavorites>(MyzFavorites.class);
        util.exportExcel(response, list, "博客收藏数据");
    }

    /**
     * 获取博客收藏详细信息
     */
    @Anonymous
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(myzFavoritesService.selectMyzFavoritesById(id));
    }

    /**
     * 新增博客收藏
     */
    @PreAuthorize("@ss.hasPermi('blog:favorites:add')")
    @Log(title = "博客收藏", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MyzFavorites myzFavorites)
    {
        return toAjax(myzFavoritesService.insertMyzFavorites(myzFavorites));
    }

    /**
     * 修改博客收藏
     */
    @PreAuthorize("@ss.hasPermi('blog:favorites:edit')")
    @Log(title = "博客收藏", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MyzFavorites myzFavorites)
    {
        return toAjax(myzFavoritesService.updateMyzFavorites(myzFavorites));
    }

    /**
     * 删除博客收藏
     */
    @PreAuthorize("@ss.hasPermi('blog:favorites:remove')")
    @Log(title = "博客收藏", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(myzFavoritesService.deleteMyzFavoritesByIds(ids));
    }
}
