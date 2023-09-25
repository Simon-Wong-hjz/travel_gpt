package com.centific.travelgpt.backend.entity.azureopenai;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

/**
 * todo describe the class
 *
 * @author <a href="mailto:v-simhuang@expediagroup.com">simhuang</a>
 * @create 2023/9/25
 */
@Data
public class Usage {
    @JsonProperty("completion_tokens")
    private Long completionTokens;
    @JsonProperty("prompt_tokens")
    private Long promptTokens;
    @JsonProperty("total_tokens")
    private Long totalTokens;
}
