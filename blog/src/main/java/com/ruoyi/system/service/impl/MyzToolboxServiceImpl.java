package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.MyzToolboxMapper;
import com.ruoyi.system.domain.MyzToolbox;
import com.ruoyi.system.service.IMyzToolboxService;

/**
 * 工具管理Service业务层处理
 * 
 * @author 木有枝
 * @date 2024-08-13
 */
@Service
public class MyzToolboxServiceImpl implements IMyzToolboxService 
{
    @Autowired
    private MyzToolboxMapper myzToolboxMapper;

    /**
     * 查询工具管理
     * 
     * @param id 工具管理主键
     * @return 工具管理
     */
    @Override
    public MyzToolbox selectMyzToolboxById(Long id)
    {
        return myzToolboxMapper.selectMyzToolboxById(id);
    }

    /**
     * 查询工具管理列表
     * 
     * @param myzToolbox 工具管理
     * @return 工具管理
     */
    @Override
    public List<MyzToolbox> selectMyzToolboxList(MyzToolbox myzToolbox)
    {
        return myzToolboxMapper.selectMyzToolboxList(myzToolbox);
    }

    /**
     * 新增工具管理
     * 
     * @param myzToolbox 工具管理
     * @return 结果
     */
    @Override
    public int insertMyzToolbox(MyzToolbox myzToolbox)
    {
        return myzToolboxMapper.insertMyzToolbox(myzToolbox);
    }

    /**
     * 修改工具管理
     * 
     * @param myzToolbox 工具管理
     * @return 结果
     */
    @Override
    public int updateMyzToolbox(MyzToolbox myzToolbox)
    {
        return myzToolboxMapper.updateMyzToolbox(myzToolbox);
    }

    /**
     * 批量删除工具管理
     * 
     * @param ids 需要删除的工具管理主键
     * @return 结果
     */
    @Override
    public int deleteMyzToolboxByIds(Long[] ids)
    {
        return myzToolboxMapper.deleteMyzToolboxByIds(ids);
    }

    /**
     * 删除工具管理信息
     * 
     * @param id 工具管理主键
     * @return 结果
     */
    @Override
    public int deleteMyzToolboxById(Long id)
    {
        return myzToolboxMapper.deleteMyzToolboxById(id);
    }
}
