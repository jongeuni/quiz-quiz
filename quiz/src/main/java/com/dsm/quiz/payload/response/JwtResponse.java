package com.dsm.quiz.payload.response;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class JwtResponse {
    private String token;
}
