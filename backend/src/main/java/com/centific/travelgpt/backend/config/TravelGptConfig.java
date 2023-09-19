package com.centific.travelgpt.backend.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.joda.JodaModule;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * todo describe the class
 *
 * @author <a href="mailto:v-simhuang@expediagroup.com">simhuang</a>
 * @create 2023/9/20
 */
@Configuration
public class TravelGptConfig {
    @Bean
    public ObjectMapper objectMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.registerModule(new JodaModule());
        return mapper;
    }
}
