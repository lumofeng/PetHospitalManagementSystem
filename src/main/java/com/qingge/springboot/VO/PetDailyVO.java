package com.qingge.springboot.VO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author lubenchu
 * @date 2022/4/24
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PetDailyVO {
    private Integer id;
    private Integer pId;
    private String name;
    private String temperature;
    private String weight;
    private String height;
    private String appetite;
    private String status;
}
