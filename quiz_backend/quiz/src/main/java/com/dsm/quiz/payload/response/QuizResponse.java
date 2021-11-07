package com.dsm.quiz.payload.response;

import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@ToString
@Builder
@Getter
public class QuizResponse {
    @ApiModelProperty(example = "다음 중 동물 종류가 아닌 것은?")
    private String title;
    @ApiModelProperty(example = "코기린/코끼리/고양이/강아지")
    private String content;
    @ApiModelProperty(example = "0")
    private int answer;
}
