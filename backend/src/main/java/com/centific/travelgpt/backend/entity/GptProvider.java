package com.centific.travelgpt.backend.entity;

/**
 * todo describe the class
 *
 * @author <a href="mailto:v-simhuang@expediagroup.com">simhuang</a>
 * @create 2023/9/19
 */
public enum GptProvider {
    /**
     * Use OpenAI GPT-3
     */
    OPEN_AI("openai"),
    /**
     * Use Azure OpenAI resources
     */
    AZURE("azure");

    public final String value;

    GptProvider(String value) {
        this.value = value;
    }
}
