package com.dsm.quiz.controller;

import com.dsm.quiz.payload.response.QuizResponse;
import com.dsm.quiz.service.QuizService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Api
@RequiredArgsConstructor
@Controller
public class QuizController {
    private final QuizService quizService;

    @ApiOperation(value = "퀴즈를 리스트 반환")
    @ResponseBody
    @GetMapping("quiz/{num}")
    @ApiResponse(code=200, message = "퀴즈 리턴됨", response = QuizResponse.class, responseContainer = "List")
    public List<QuizResponse> quizReturn(@ApiParam(value = "Quiz count", required = true) @PathVariable int num){
        return quizService.randomQuiz(num);
    }
}
