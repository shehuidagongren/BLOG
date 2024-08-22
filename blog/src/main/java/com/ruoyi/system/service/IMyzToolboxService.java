package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.MyzToolbox;

/**
 * 工具管理Service接口
 * 
 * @author 木有枝
 * @date 2024-08-13
 */
public interface IMyzToolboxService 
{
    /**
     * 查询工具管理
     * 
     * @param id 工具管理主键
     * @return 工具管理
     */
    public MyzToolbox selectMyzToolboxById(Long id);

    /**
     * 查询工具管理列表
     * 
     * @param myzToolbox 工具管理
     * @return 工具管理集合
     */
    public List<MyzToolbox> selectMyzToolboxList(MyzToolbox myzToolbox);

    /**
     * 新增工具管理
     * 
     * @param myzToolbox 工具管理
     * @return 结果
     */
    public int insertMyzToolbox(MyzToolbox myzToolbox);

    /**
     * 修改工具管理
     * 
     * @param myzToolbox 工具管理
     * @return 结果
     */
    public int updateMyzToolbox(MyzToolbox myzToolbox);

    /**
     * 批量删除工具管理
     * 
     * @param ids 需要删除的工具管理主键集合
     * @return 结果
     */
    public int deleteMyzToolboxByIds(Long[] ids);

    /**
     * 删除工具管理信息
     * 
     * @param id 工具管理主键
     * @return 结果
     */
    public int deleteMyzToolboxById(Long id);
}
