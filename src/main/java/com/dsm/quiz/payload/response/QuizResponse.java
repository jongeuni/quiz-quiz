package com.dsm.quiz.payload.response;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@ToString
@Builder
@Getter
public class QuizResponse {
    private String title;
    private String content;
    private int answer;
}
