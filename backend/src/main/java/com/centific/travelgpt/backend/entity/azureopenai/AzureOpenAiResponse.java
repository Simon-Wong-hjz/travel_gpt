package com.centific.travelgpt.backend.entity.azureopenai;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.List;

/**
 * todo describe the class
 *
 * @author <a href="mailto:v-simhuang@expediagroup.com">simhuang</a>
 * @create 2023/9/25
 */
@Data
public class AzureOpenAiResponse {
    private String id;
    private String object;
    private Long created;
    private String model;
    @JsonProperty("prompt_filter_results")
    private List<PromptFilterResult> promptFilterResults;
    @JsonProperty("choices")
    private List<Choice> choices;
    @JsonProperty("usage")
    private Usage usage;
}
