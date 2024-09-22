package com.ruoyi.web.controller.blog;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.MyzComments;
import com.ruoyi.system.service.IMyzCommentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 文章评论Controller
 * 
 * @author 木有枝
 * @date 2024-08-10
 */
@RestController
@RequestMapping("/blog/comments")
public class MyzCommentsController extends BaseController
{
    @Autowired
    private IMyzCommentsService myzCommentsService;

    /**
     * 查询文章评论列表
     */
    @Anonymous
    @GetMapping("/list")
    public TableDataInfo list(MyzComments myzComments)
    {
        startPage();
        List<MyzComments> list = myzCommentsService.selectMyzCommentsList(myzComments);
        System.out.println(list);
        return getDataTable(list);
    }

    /**
     * 导出文章评论列表
     */
    @PreAuthorize("@ss.hasPermi('blog:comments:export')")
    @Log(title = "文章评论", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MyzComments myzComments)
    {
        List<MyzComments> list = myzCommentsService.selectMyzCommentsList(myzComments);
        ExcelUtil<MyzComments> util = new ExcelUtil<MyzComments>(MyzComments.class);
        util.exportExcel(response, list, "文章评论数据");
    }

    /**
     * 获取文章评论详细信息
     */
    @PreAuthorize("@ss.hasPermi('blog:comments:query')")
    @GetMapping(value = "/{commentId}")
    public AjaxResult getInfo(@PathVariable("commentId") Long commentId)
    {
        return success(myzCommentsService.selectMyzCommentsByCommentId(commentId));
    }

    /**
     * 新增文章评论
     */
    @Anonymous
    @Log(title = "文章评论", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MyzComments myzComments)
    {
        MyzComments newComment = myzCommentsService.insertMyzComments(myzComments);
        if (newComment != null) {
            return AjaxResult.success("操作成功", newComment);
        } else {
            return AjaxResult.error("评论插入失败");
        }
    }




    /**
     * 修改文章评论
     */
    @Anonymous
    @Log(title = "文章评论", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MyzComments myzComments)
    {
        return toAjax(myzCommentsService.updateMyzComments(myzComments));
    }

    /**
     * 删除文章评论
     */
    @PreAuthorize("@ss.hasPermi('blog:comments:remove')")
    @Log(title = "文章评论", businessType = BusinessType.DELETE)
	@DeleteMapping("/{commentIds}")
    public AjaxResult remove(@PathVariable Long[] commentIds)
    {
        return toAjax(myzCommentsService.deleteMyzCommentsByCommentIds(commentIds));
    }
}
