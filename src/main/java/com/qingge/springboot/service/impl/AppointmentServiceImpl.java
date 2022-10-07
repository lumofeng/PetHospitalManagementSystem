package com.qingge.springboot.service.impl;

import com.qingge.springboot.entity.Appointment;
import com.qingge.springboot.mapper.AppointmentMapper;
import com.qingge.springboot.service.IAppointmentService;
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
public class AppointmentServiceImpl extends ServiceImpl<AppointmentMapper, Appointment> implements IAppointmentService {

}
