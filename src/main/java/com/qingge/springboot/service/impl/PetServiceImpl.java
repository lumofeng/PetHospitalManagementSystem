package com.qingge.springboot.service.impl;

import com.qingge.springboot.entity.Pet;
import com.qingge.springboot.mapper.PetMapper;
import com.qingge.springboot.service.IPetService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 墨枫
 * @since 2022-03-03
 */
@Service
public class PetServiceImpl extends ServiceImpl<PetMapper, Pet> implements IPetService {

}
