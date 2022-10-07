package com.qingge.springboot.VO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * @author lubenchu
 * @date 2022/4/24
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DiagnosisVO {
    private String id;
    private String name;
    private String nickname;
    private String doctorName;
    private String info;
    private String type;
    private String status;
    private LocalDateTime createTime;
}
