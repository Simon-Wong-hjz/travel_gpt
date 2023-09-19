package com.centific.travelgpt.backend.entity.openai;

import lombok.Builder;
import lombok.Data;

import java.util.List;

/**
 * todo describe the class
 *
 * @author <a href="mailto:v-simhuang@expediagroup.com">simhuang</a>
 * @create 2023/9/19
 */
@Data
@Builder
public class OpenAiRequest {
    private String model;
    private List<Message> messages;
}