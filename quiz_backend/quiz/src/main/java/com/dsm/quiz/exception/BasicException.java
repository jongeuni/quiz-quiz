package com.dsm.quiz.exception;

import lombok.Getter;

@Getter
public class BasicException extends RuntimeException{
    private final ExceptionMessage msg;

    public BasicException(ExceptionMessage msg){
        super(msg.getMessage());
        this.msg = msg;
    }
}
