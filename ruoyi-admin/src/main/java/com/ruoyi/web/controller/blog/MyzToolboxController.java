package com.ruoyi.web.controller.blog;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.annotation.Anonymous;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.MyzToolbox;
import com.ruoyi.system.service.IMyzToolboxService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 工具管理Controller
 * 
 * @author 木有枝
 * @date 2024-08-13
 */
@RestController
@RequestMapping("/blog/toolbox")
public class MyzToolboxController extends BaseController
{
    @Autowired
    private IMyzToolboxService myzToolboxService;

    /**
     * 查询工具管理列表
     */
    @Anonymous
    @GetMapping("/list")
    public TableDataInfo list(MyzToolbox myzToolbox)
    {
        startPage();
        List<MyzToolbox> list = myzToolboxService.selectMyzToolboxList(myzToolbox);
        return getDataTable(list);
    }

    /**
     * 导出工具管理列表
     */
    @PreAuthorize("@ss.hasPermi('blog:toolbox:export')")
    @Log(title = "工具管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MyzToolbox myzToolbox)
    {
        List<MyzToolbox> list = myzToolboxService.selectMyzToolboxList(myzToolbox);
        ExcelUtil<MyzToolbox> util = new ExcelUtil<MyzToolbox>(MyzToolbox.class);
        util.exportExcel(response, list, "工具管理数据");
    }

    /**
     * 获取工具管理详细信息
     */
    @Anonymous
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(myzToolboxService.selectMyzToolboxById(id));
    }

    /**
     * 新增工具管理
     */
    @PreAuthorize("@ss.hasPermi('blog:toolbox:add')")
    @Log(title = "工具管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MyzToolbox myzToolbox)
    {
        return toAjax(myzToolboxService.insertMyzToolbox(myzToolbox));
    }

    /**
     * 修改工具管理
     */
    @PreAuthorize("@ss.hasPermi('blog:toolbox:edit')")
    @Log(title = "工具管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MyzToolbox myzToolbox)
    {
        return toAjax(myzToolboxService.updateMyzToolbox(myzToolbox));
    }

    /**
     * 删除工具管理
     */
    @PreAuthorize("@ss.hasPermi('blog:toolbox:remove')")
    @Log(title = "工具管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(myzToolboxService.deleteMyzToolboxByIds(ids));
    }
}
