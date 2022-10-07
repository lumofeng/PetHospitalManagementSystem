package com.qingge.springboot.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.VO.PetDailyVO;
import com.qingge.springboot.entity.PetDaily;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 墨枫
 * @since 2022-03-03
 */
public interface IPetDailyService extends IService<PetDaily> {

    List<PetDailyVO> listPetAndDaily();

    Page<PetDaily> findPage(Page<PetDaily> page, String name);
}
