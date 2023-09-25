package com.centific.travelgpt.backend.entity.azureopenai;

import lombok.Builder;
import lombok.Data;

import java.util.List;

/**
 * todo describe the class
 *
 * @author <a href="mailto:v-simhuang@expediagroup.com">simhuang</a>
 * @create 2023/9/25
 */
@Data
@Builder
public class AzureOpenAiRequest {
    private List<Message> messages;
}
