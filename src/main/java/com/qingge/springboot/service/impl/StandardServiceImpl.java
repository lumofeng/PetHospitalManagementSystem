package com.qingge.springboot.service.impl;

import com.qingge.springboot.entity.Standard;
import com.qingge.springboot.mapper.StandardMapper;
import com.qingge.springboot.service.IStandardService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 墨枫
 * @since 2022-03-06
 */
@Service
public class StandardServiceImpl extends ServiceImpl<StandardMapper, Standard> implements IStandardService {

}
