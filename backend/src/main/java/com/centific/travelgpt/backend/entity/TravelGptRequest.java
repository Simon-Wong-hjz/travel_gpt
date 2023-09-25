package com.centific.travelgpt.backend.entity;

import lombok.Data;
import org.joda.time.LocalDate;

import java.util.List;

/**
 * todo describe the class
 *
 * @author <a href="mailto:v-simhuang@expediagroup.com">simhuang</a>
 * @create 2023/9/19
 */
@Data
public class TravelGptRequest {
    public String departure;
    public LocalDate startDate;
    public LocalDate endDate;
    public Integer travellerCount;
    public Double budget;
    public List<String> keywords;
}
