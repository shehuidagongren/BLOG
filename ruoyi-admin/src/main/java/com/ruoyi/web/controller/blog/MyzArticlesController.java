package com.ruoyi.web.controller.blog;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.MyzArticles;
import com.ruoyi.system.service.IMyzArticlesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 文章Controller
 * 
 * @author ShanYouMuXi
 * @date 2024-08-08
 */
@RestController
@RequestMapping("/blog/articles")
public class MyzArticlesController extends BaseController
{
    @Autowired
    private IMyzArticlesService myzArticlesService;

    /**
     * 查询文章列表
     */
    @Anonymous
    @GetMapping("/list")
    public TableDataInfo list(MyzArticles myzArticles)
    {
        startPage();
        List<MyzArticles> list = myzArticlesService.selectMyzArticlesList(myzArticles);
        return getDataTable(list);
    }

    /**
     * 导出文章列表
     */
    @PreAuthorize("@ss.hasPermi('blog:articles:export')")
    @Log(title = "文章", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MyzArticles myzArticles)
    {
        List<MyzArticles> list = myzArticlesService.selectMyzArticlesList(myzArticles);
        ExcelUtil<MyzArticles> util = new ExcelUtil<MyzArticles>(MyzArticles.class);
        util.exportExcel(response, list, "文章数据");
    }

    /**
     * 获取文章详细信息
     */
    @Anonymous
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(myzArticlesService.selectMyzArticlesById(id));
    }

    /**
     * 新增文章
     */
    @PreAuthorize("@ss.hasPermi('blog:articles:add')")
    @Log(title = "文章", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MyzArticles myzArticles)
    {
        return toAjax(myzArticlesService.insertMyzArticles(myzArticles));
    }

    /**
     * 修改文章
     */
    @PreAuthorize("@ss.hasPermi('blog:articles:edit')")
    @Log(title = "文章", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MyzArticles myzArticles)
    {
        return toAjax(myzArticlesService.updateMyzArticles(myzArticles));
    }

    /**
     * 删除文章
     */
    @PreAuthorize("@ss.hasPermi('blog:articles:remove')")
    @Log(title = "文章", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(myzArticlesService.deleteMyzArticlesByIds(ids));
    }
}
