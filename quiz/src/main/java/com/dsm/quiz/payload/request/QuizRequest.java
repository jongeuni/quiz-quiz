package com.dsm.quiz.payload.request;


import lombok.Getter;

@Getter
public class QuizRequest {
    private String title;
    private String content;
    private int answer;
}
