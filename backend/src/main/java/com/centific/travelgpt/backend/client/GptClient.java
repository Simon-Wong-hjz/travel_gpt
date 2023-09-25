package com.centific.travelgpt.backend.client;

import com.centific.travelgpt.backend.entity.GptProvider;
import com.centific.travelgpt.backend.entity.azureopenai.AzureOpenAiRequest;
import com.centific.travelgpt.backend.entity.azureopenai.AzureOpenAiResponse;
import com.centific.travelgpt.backend.entity.azureopenai.Choice;
import com.centific.travelgpt.backend.entity.azureopenai.Message;
import com.centific.travelgpt.backend.entity.openai.OpenAiRequest;
import com.centific.travelgpt.backend.entity.openai.OpenAiResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;

import java.util.List;

/**
 * Client that calls the GPT model on either OpenAI or Azure.
 *
 * @author <a href="mailto:v-simhuang@expediagroup.com">simhuang</a>
 * @create 2023/9/19
 */
@Slf4j
@Component
public class GptClient {

    @Value("${openai.endpoint}")
    private String openAiEndpoint;

    @Value("${openai.key}")
    private String openAiKey;

    @Value("${openai.retry}")
    private int openAiRetry;

    @Value("${azure.endpoint}")
    private String azureEndpoint;

    @Value("${azure.key}")
    private String azureKey;

    @Value("${azure.retry}")
    private int azureRetry;

    private final WebClient webClient = WebClient.builder().build();

    public Mono<String> callGpt(String prompt) {
        String gptProvider = System.getenv("GPT_PROVIDER");
        if (GptProvider.AZURE.value.equalsIgnoreCase(gptProvider)) {
            return callAzure(prompt);
        } else {
            return callOpenAi(prompt);
        }
    }

    private Mono<String> callOpenAi(String prompt) {
        OpenAiRequest openAiRequest = buildOpenAiRequest(prompt);
        log.info("Calling OpenAI with request: {}", openAiRequest);
        return webClient.post()
                .uri(openAiEndpoint)
                .contentType(MediaType.APPLICATION_JSON)
                .bodyValue(openAiRequest)
                .header("Authorization", "Bearer " + openAiKey)
                .retrieve()
                .onStatus(httpStatus -> !httpStatus.is2xxSuccessful(), clientResponse ->
                        clientResponse.bodyToMono(String.class)
                                .flatMap(errorBody -> {
                                    log.error("OpenAI call failed with status: {}, error body: {}", clientResponse.statusCode(), errorBody);
                                    return Mono.error(new RuntimeException("OpenAI call failed"));
                                }))
                .bodyToMono(OpenAiResponse.class)
                .map(openAiResponse -> {
                    log.info("OpenAI call succeeded with response: {}", openAiResponse);
                    List<com.centific.travelgpt.backend.entity.openai.Choice> choices = openAiResponse.getChoices();
                    return choices.get(0).getMessage().getContent();
                })
                .retry(openAiRetry);
    }

    private Mono<String> callAzure(String prompt) {
        AzureOpenAiRequest azureOpenAiRequest = buildAzureOpenAiRequest(prompt);
        log.info("Calling Azure OpenAI with request: {}", azureOpenAiRequest);
        return webClient.post()
                .uri(azureEndpoint)
                .contentType(MediaType.APPLICATION_JSON)
                .bodyValue(azureOpenAiRequest)
                .header("api-key", azureKey)
                .retrieve()
                .onStatus(httpStatus -> !httpStatus.is2xxSuccessful(), clientResponse ->
                        clientResponse.bodyToMono(String.class)
                                .flatMap(errorBody -> {
                                    log.error("Azure OpenAI call failed with status: {}, error body: {}", clientResponse.statusCode(), errorBody);
                                    return Mono.error(new RuntimeException("Azure OpenAI call failed"));
                                }))
                .bodyToMono(AzureOpenAiResponse.class)
                .map(azureOpenAiResponse -> {
                    log.info("Azure OpenAI call succeeded with response: {}", azureOpenAiResponse);
                    List<Choice> choices = azureOpenAiResponse.getChoices();
                    return choices.get(0).getMessage().getContent();
                })
                .retry(azureRetry);
    }

    private OpenAiRequest buildOpenAiRequest(String prompt) {
        com.centific.travelgpt.backend.entity.openai.Message message = new com.centific.travelgpt.backend.entity.openai.Message();
        message.setRole("user");
        message.setContent(prompt);
        return OpenAiRequest.builder()
                .model("gpt-3.5-turbo")
                .messages(List.of(message))
                .build();
    }

    private AzureOpenAiRequest buildAzureOpenAiRequest(String prompt) {
        Message message = new Message();
        message.setRole("user");
        message.setContent(prompt);
        return AzureOpenAiRequest.builder()
                .messages(List.of(message))
                .build();
    }
}
