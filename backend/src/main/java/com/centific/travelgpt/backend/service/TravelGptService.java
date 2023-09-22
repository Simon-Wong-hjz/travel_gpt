package com.centific.travelgpt.backend.service;

import com.centific.travelgpt.backend.client.GptClient;
import com.centific.travelgpt.backend.entity.TravelGptRequest;
import com.centific.travelgpt.backend.entity.TravelGptResponse;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Mono;

/**
 * todo describe the class
 *
 * @author <a href="mailto:v-simhuang@expediagroup.com">simhuang</a>
 * @create 2023/9/19
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class TravelGptService {

    private final GptClient gptClient;

    private final ObjectMapper objectMapper;

    @Value("${prompt.web}")
    private String promptForWeb;

    @Value("${prompt.app}")
    private String promptForApp;

    public Mono<Object> callGpt(TravelGptRequest travelGptRequest, Boolean isWeb) {
        return gptClient.callGpt(generatePrompt(travelGptRequest, isWeb))
                .handle((content, sink) -> {
                    log.info("Content: {}", content);
                    // return whatever we get from GPT if it's web
                    if (isWeb) {
                        sink.next(content);
                        return;
                    }
                    // otherwise, try to parse the content and return the parsed object
                    TravelGptResponse travelGptResponse;
                    try {
                        travelGptResponse = objectMapper.readValue(content, TravelGptResponse.class);
                    } catch (JsonProcessingException e) {
                        // if parsing fails, that means the gpt failed to stick with the pattern, return error
                        log.error("Error when parsing content: {}", content);
                        sink.error(new RuntimeException(e));
                        return;
                    }
                    sink.next(travelGptResponse);
                });
    }

    private String generatePrompt(TravelGptRequest travelGptRequest, Boolean isWeb) {
        if (isWeb) {
            return String.format(
                    promptForWeb,
                    travelGptRequest.travellerCount,
                    travelGptRequest.startDate,
                    travelGptRequest.endDate,
                    travelGptRequest.departure,
                    travelGptRequest.budget,
                    travelGptRequest.keywords);
        } else {
            return String.format(
                    promptForApp,
                    travelGptRequest.travellerCount,
                    travelGptRequest.startDate,
                    travelGptRequest.endDate,
                    travelGptRequest.departure,
                    travelGptRequest.budget,
                    travelGptRequest.keywords);
        }
    }

}
