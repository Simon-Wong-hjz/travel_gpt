package com.centific.travelgpt.backend.entity.openai;

import lombok.Data;

@Data
public class Choice {
    private Integer index;
    private Message message;
    private String finishReason;
}
