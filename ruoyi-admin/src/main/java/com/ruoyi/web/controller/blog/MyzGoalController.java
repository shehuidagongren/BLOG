package com.ruoyi.web.controller.blog;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.MyzGoal;
import com.ruoyi.system.service.IMyzGoalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 学习目标Controller
 * 
 * @author 木有枝
 * @date 2024-08-13
 */
@RestController
@RequestMapping("/blog/goal")
public class MyzGoalController extends BaseController
{
    @Autowired
    private IMyzGoalService myzGoalService;

    /**
     * 查询学习目标列表
     */
    @Anonymous
    @GetMapping("/list")
    public TableDataInfo list(MyzGoal myzGoal)
    {
        startPage();
        List<MyzGoal> list = myzGoalService.selectMyzGoalList(myzGoal);
        return getDataTable(list);
    }

    /**
     * 导出学习目标列表
     */
    @PreAuthorize("@ss.hasPermi('blog:goal:export')")
    @Log(title = "学习目标", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MyzGoal myzGoal)
    {
        List<MyzGoal> list = myzGoalService.selectMyzGoalList(myzGoal);
        ExcelUtil<MyzGoal> util = new ExcelUtil<MyzGoal>(MyzGoal.class);
        util.exportExcel(response, list, "学习目标数据");
    }

    /**
     * 获取学习目标详细信息
     */
    @Anonymous
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(myzGoalService.selectMyzGoalById(id));
    }

    /**
     * 新增学习目标
     */
    @PreAuthorize("@ss.hasPermi('blog:goal:add')")
    @Log(title = "学习目标", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MyzGoal myzGoal)
    {
        return toAjax(myzGoalService.insertMyzGoal(myzGoal));
    }

    /**
     * 修改学习目标
     */
    @PreAuthorize("@ss.hasPermi('blog:goal:edit')")
    @Log(title = "学习目标", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MyzGoal myzGoal)
    {
        return toAjax(myzGoalService.updateMyzGoal(myzGoal));
    }

    /**
     * 删除学习目标
     */
    @PreAuthorize("@ss.hasPermi('blog:goal:remove')")
    @Log(title = "学习目标", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(myzGoalService.deleteMyzGoalByIds(ids));
    }
}
