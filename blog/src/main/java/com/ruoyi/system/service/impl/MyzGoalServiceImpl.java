package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.MyzGoalMapper;
import com.ruoyi.system.domain.MyzGoal;
import com.ruoyi.system.service.IMyzGoalService;

/**
 * 学习目标Service业务层处理
 * 
 * @author 木有枝
 * @date 2024-08-13
 */
@Service
public class MyzGoalServiceImpl implements IMyzGoalService 
{
    @Autowired
    private MyzGoalMapper myzGoalMapper;

    /**
     * 查询学习目标
     * 
     * @param id 学习目标主键
     * @return 学习目标
     */
    @Override
    public MyzGoal selectMyzGoalById(Long id)
    {
        return myzGoalMapper.selectMyzGoalById(id);
    }

    /**
     * 查询学习目标列表
     * 
     * @param myzGoal 学习目标
     * @return 学习目标
     */
    @Override
    public List<MyzGoal> selectMyzGoalList(MyzGoal myzGoal)
    {
        return myzGoalMapper.selectMyzGoalList(myzGoal);
    }

    /**
     * 新增学习目标
     * 
     * @param myzGoal 学习目标
     * @return 结果
     */
    @Override
    public int insertMyzGoal(MyzGoal myzGoal)
    {
        return myzGoalMapper.insertMyzGoal(myzGoal);
    }

    /**
     * 修改学习目标
     * 
     * @param myzGoal 学习目标
     * @return 结果
     */
    @Override
    public int updateMyzGoal(MyzGoal myzGoal)
    {
        return myzGoalMapper.updateMyzGoal(myzGoal);
    }

    /**
     * 批量删除学习目标
     * 
     * @param ids 需要删除的学习目标主键
     * @return 结果
     */
    @Override
    public int deleteMyzGoalByIds(Long[] ids)
    {
        return myzGoalMapper.deleteMyzGoalByIds(ids);
    }

    /**
     * 删除学习目标信息
     * 
     * @param id 学习目标主键
     * @return 结果
     */
    @Override
    public int deleteMyzGoalById(Long id)
    {
        return myzGoalMapper.deleteMyzGoalById(id);
    }
}
