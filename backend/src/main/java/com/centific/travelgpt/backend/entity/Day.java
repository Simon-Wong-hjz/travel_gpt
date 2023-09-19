package com.centific.travelgpt.backend.entity;

import lombok.Data;

import java.util.List;

@Data
public class Day {
    private String day;
    private List<Play> playList;
}
