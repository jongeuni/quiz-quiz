package com.dsm.quiz.controller;

import com.dsm.quiz.payload.response.QuizResponse;
import com.dsm.quiz.service.QuizService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@RequiredArgsConstructor
@Controller
public class QuizController {
    private final QuizService quizService;

    @ResponseBody
    @GetMapping("quiz/{num}")
    public List<QuizResponse> quizReturn(@PathVariable int num){
        return quizService.randomQuiz(num);
    }
}
