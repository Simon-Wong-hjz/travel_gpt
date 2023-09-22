package com.centific.travelgpt.backend.controller;

import com.centific.travelgpt.backend.entity.TravelGptRequest;
import com.centific.travelgpt.backend.service.TravelGptService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;

/**
 * todo describe the class
 *
 * @author <a href="mailto:v-simhuang@expediagroup.com">simhuang</a>
 * @create 2023/9/19
 */
@Slf4j
@RequiredArgsConstructor
@RestController
public class TravelGptController {

    private final TravelGptService travelGptService;

    @PostMapping("/generatePlan")
    public Mono<Object> generatePlan(@RequestBody TravelGptRequest travelGptRequest, @RequestParam Boolean isWeb) {
        log.info("Received request, isWeb {}, body: {}", isWeb, travelGptRequest);
        return travelGptService.callGpt(travelGptRequest, isWeb);
    }
}
