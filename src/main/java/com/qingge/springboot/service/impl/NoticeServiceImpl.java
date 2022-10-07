package com.qingge.springboot.service.impl;

import com.qingge.springboot.entity.Notice;
import com.qingge.springboot.mapper.NoticeMapper;
import com.qingge.springboot.service.INoticeService;
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
public class NoticeServiceImpl extends ServiceImpl<NoticeMapper, Notice> implements INoticeService {

}
