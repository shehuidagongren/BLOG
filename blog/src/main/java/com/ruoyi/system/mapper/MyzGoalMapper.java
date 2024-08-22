package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.MyzGoal;

/**
 * 学习目标Mapper接口
 * 
 * @author 木有枝
 * @date 2024-08-13
 */
public interface MyzGoalMapper 
{
    /**
     * 查询学习目标
     * 
     * @param id 学习目标主键
     * @return 学习目标
     */
    public MyzGoal selectMyzGoalById(Long id);

    /**
     * 查询学习目标列表
     * 
     * @param myzGoal 学习目标
     * @return 学习目标集合
     */
    public List<MyzGoal> selectMyzGoalList(MyzGoal myzGoal);

    /**
     * 新增学习目标
     * 
     * @param myzGoal 学习目标
     * @return 结果
     */
    public int insertMyzGoal(MyzGoal myzGoal);

    /**
     * 修改学习目标
     * 
     * @param myzGoal 学习目标
     * @return 结果
     */
    public int updateMyzGoal(MyzGoal myzGoal);

    /**
     * 删除学习目标
     * 
     * @param id 学习目标主键
     * @return 结果
     */
    public int deleteMyzGoalById(Long id);

    /**
     * 批量删除学习目标
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMyzGoalByIds(Long[] ids);
}
