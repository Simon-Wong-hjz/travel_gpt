package com.centific.travelgpt.backend.entity.openai;

import lombok.Data;

@Data
public class Message {
    private String role;
    private String content;
}
