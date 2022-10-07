package com.qingge.springboot.controller;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.support.ExcelTypeEnum;
import com.qingge.springboot.VO.UserEntity;
import org.apache.commons.compress.utils.Lists;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

/**
 * @author lubenchu
 * @date 2022/6/21
 */
@RestController
@RequestMapping("/easyExcel")
public class EasyExcelController {

    /**
     * 测试写入Excel文件
     *
     * @param response
     * @throws IOException
     */
    @GetMapping("/download")
    public void doDownLoad(HttpServletResponse response) throws IOException {
        response.setContentType("application/vnd.ms-excel");
        response.setCharacterEncoding("utf-8");
        String fileName = URLEncoder.encode("第一个文件", "UTF-8");
        response.setHeader("Content-disposition", "attachment;filename=" + fileName + ".xlsx");
        EasyExcel.write(response.getOutputStream(), UserEntity.class).sheet("模板").doWrite(getData());
    }

    /**
     * 构造假数据，实际上应该从数据库查出来
     *
     * @return List<UserEntity>
     */
    private List<UserEntity> getData(){
        List<UserEntity> users = Lists.newArrayList();
        for (int i = 1; i <= 9; i++) {
            UserEntity user = new UserEntity();
            user.setBirthday(new Date());
            user.setName("user_" + i);
            user.setSalary(1.285 * i);
            user.setTelphone("1888888888" + i);
            users.add(user);
        }
        return users;
    }

}
