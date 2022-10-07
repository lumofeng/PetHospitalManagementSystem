package com.qingge.springboot.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.VO.DiagnosisVO;
import com.qingge.springboot.entity.Pet;
import com.qingge.springboot.service.IPetService;
import com.qingge.springboot.utils.TokenUtils;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.List;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.qingge.springboot.common.Result;

import com.qingge.springboot.service.IDiagnosisService;
import com.qingge.springboot.entity.Diagnosis;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 墨枫
 * @since 2022-03-06
 */
@RestController
@RequestMapping("/diagnosis")
public class DiagnosisController {

    @Resource
    private IDiagnosisService diagnosisService;

    @Resource
    private IPetService petService;


    // 新增或者更新
    @PostMapping
    public Result save(@RequestBody Diagnosis diagnosis) {
        diagnosisService.saveOrUpdate(diagnosis);
        return Result.success();
    }

    // 就诊是新增宠物健康史
    @PostMapping("/add_appointment_diagnosis")
    public Result saveAppointmentDiagnosis(@RequestBody Diagnosis diagnosis) {
        diagnosis.setUserId(TokenUtils.getCurrentUser().getId());
        diagnosis.setDoctorId(TokenUtils.getCurrentUser().getId());
        diagnosisService.saveOrUpdate(diagnosis);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        diagnosisService.removeById(id);
        return Result.success();
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        diagnosisService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping
    public Result findAll() {
        return Result.success(diagnosisService.list());
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(diagnosisService.getById(id));
    }

    @GetMapping("/page")
    public Result findPage(@RequestParam Integer pageNum,
                                @RequestParam Integer pageSize,
                           @RequestParam(defaultValue = "") String diagnosisAdvice) {
        QueryWrapper<Diagnosis> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        if(!"".equals(diagnosisAdvice)){
            queryWrapper.like("info", diagnosisAdvice);
        }
        return Result.success(diagnosisService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

    @GetMapping("/diagnosis_page")
    public Result diagnosisPage(@RequestParam Integer pageNum,
                           @RequestParam Integer pageSize,
                           @RequestParam(defaultValue = "") String diagnosisAdvice) {
        QueryWrapper<DiagnosisVO> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        Page<Diagnosis> page = diagnosisService.findPage(new Page<>(pageNum, pageSize), diagnosisAdvice);
        return Result.success(page);


    }

}

