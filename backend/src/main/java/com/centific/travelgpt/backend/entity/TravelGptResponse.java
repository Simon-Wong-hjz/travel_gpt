package com.centific.travelgpt.backend.entity;

import lombok.Data;

import java.util.List;

/**
 * todo describe the class
 *
 * @author <a href="mailto:v-simhuang@expediagroup.com">simhuang</a>
 * @create 2023/9/19
 */
@Data
public class TravelGptResponse {
    private List<Day> dayList;
    private String destination;
    private String destinationDescription;
}