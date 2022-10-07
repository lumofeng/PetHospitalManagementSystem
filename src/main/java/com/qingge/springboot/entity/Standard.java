package com.qingge.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * <p>
 * 
 * </p>
 *
 * @author 墨枫
 * @since 2022-03-06
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
  @ApiModel(value = "Standard对象", description = "")
public class Standard implements Serializable {

    private static final long serialVersionUID = 1L;

      @ApiModelProperty("主键ID")
        @TableId(value = "id", type = IdType.AUTO)
      private Integer id;

      @ApiModelProperty("开始年龄")
      private Integer ageMin;

      @ApiModelProperty("结束年龄")
      private Integer ageMax;

      @ApiModelProperty("体温最小值")
      private Double tempMin;

      @ApiModelProperty("体温最大值")
      private Double tempMax;

      @ApiModelProperty("体重最小值")
      private Double weightMin;

      @ApiModelProperty("体温最大值")
      private Double weightMax;

      @ApiModelProperty("身长最小值")
      private Double heightMin;

      @ApiModelProperty("身长最大值")
      private Double heightMax;

      @ApiModelProperty("饭量最小值")
      private Double appetiteMin;

      @ApiModelProperty("饭量最大值")
      private Double appetiteMax;

      @ApiModelProperty("状态")
      private String type;

      @ApiModelProperty("类型")
      private String status;


}
