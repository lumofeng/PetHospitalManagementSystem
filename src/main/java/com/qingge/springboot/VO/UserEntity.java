package com.qingge.springboot.VO;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.format.DateTimeFormat;
import com.alibaba.excel.annotation.format.NumberFormat;
import com.alibaba.excel.annotation.write.style.ColumnWidth;
import lombok.Data;

import java.util.Date;

/**
 * @author lubenchu
 * @date 2022/6/21
 */
// 表示列宽
@ColumnWidth(20)
@Data
public class UserEntity {
    // index--表示属性在第几列，value--表示标题
    @ExcelProperty(value = "姓名", index = 0)
    private String name;

    // @DateTimeFormat--对日期格式的转换
    @DateTimeFormat("yyyy-MM-dd")
    @ExcelProperty(value = "生日", index = 1)
    private Date birthday;

    @ExcelProperty(value = "电话", index = 2)
    private String telphone;

    // @NumberFormat--对数字格式的转换
    @NumberFormat("#.##")
    @ExcelProperty(value = "工资", index = 3)
    private double salary;
}
