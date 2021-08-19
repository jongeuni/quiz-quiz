package com.dsm.quiz.exception;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum ExceptionMessage {
    INVALID_ADMIN_ID(404, "Admin that do not exist");

    private final int status;
    private final String message;
}
