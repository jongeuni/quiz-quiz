package com.dsm.quiz.payload.request;

import lombok.Getter;

@Getter
public class LoginRequest {
    private String id;
    private String pw;
    private String like;
}
