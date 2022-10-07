package com.qingge.springboot.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.entity.Diagnosis;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 墨枫
 * @since 2022-03-06
 */
public interface IDiagnosisService extends IService<Diagnosis> {

    Page<Diagnosis> findPage(Page<Diagnosis> page, String diagnosisAdvice);
}
