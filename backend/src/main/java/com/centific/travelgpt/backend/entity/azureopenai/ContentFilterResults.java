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
public class ContentFilterResults {
    private Hate hate;
    @JsonProperty("self_harm")
    private SelfHarm selfHarm;
    private Sexual sexual;
    private Violence violence;
}
