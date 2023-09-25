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
public class PromptFilterResult {
    @JsonProperty("prompt_index")
    private Integer promptIndex;
    @JsonProperty("content_filter_results")
    private ContentFilterResults contentFilterResults;
}
