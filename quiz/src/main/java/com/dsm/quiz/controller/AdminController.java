package com.dsm.quiz.controller;

import com.dsm.quiz.entity.Quiz;
import com.dsm.quiz.payload.request.LoginRequest;
import com.dsm.quiz.payload.request.QuizRequest;
import com.dsm.quiz.payload.response.QuizResponse;
import com.dsm.quiz.service.AdminService;
import com.dsm.quiz.service.QuizService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@Controller
public class AdminController {
    private final AdminService adminService;
    private final QuizService quizService;

    @RequestMapping("/quiz")
    public String main(){
        // html 띄워주기
        return "thymeleaf/login";
    }

    @PostMapping("/admin")
    public String login(@RequestBody LoginRequest user){
        System.out.println(user.getId());
        if(adminService.login(user)){
            return "thymeleaf/main";
        }
        return "thymeleaf/login";
    }

    @GetMapping("/quiz-page")
    public String insertPage(){
        return "thymeleaf/quizInsert";
    }

    @PostMapping("/quiz")
    public String quizInsert(QuizRequest quizReq){
        Quiz quiz = Quiz.builder()
                .content(quizReq.getContent())
                .title(quizReq.getTitle())
                .answer(quizReq.getAnswer())
                .build();
        adminService.insertQuiz(quiz);
        return "thymeleaf/main";
    }


}
