package com.centific.travelgpt.backend.entity.azureopenai;

import lombok.Data;

/**
 * todo describe the class
 *
 * @author <a href="mailto:v-simhuang@expediagroup.com">simhuang</a>
 * @create 2023/9/25
 */
@Data
public abstract class FilterResults {
    private Boolean filtered;
    private String severity;
}
