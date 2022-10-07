package com.qingge.springboot.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.VO.DiagnosisVO;
import com.qingge.springboot.entity.Diagnosis;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 墨枫
 * @since 2022-03-06
 */
public interface DiagnosisMapper extends BaseMapper<Diagnosis> {
    Page<Diagnosis> findPage(Page<Diagnosis> page, @Param("info") String diagnosisAdvice);
}
