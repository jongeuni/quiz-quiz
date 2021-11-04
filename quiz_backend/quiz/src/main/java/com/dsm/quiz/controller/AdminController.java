package com.dsm.quiz.controller;

import com.dsm.quiz.entity.Quiz;
import com.dsm.quiz.payload.request.QuizRequest;
import com.dsm.quiz.service.AdminService;
import com.dsm.quiz.service.QuizService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@RequiredArgsConstructor
@Controller
public class AdminController {
    private final AdminService adminService;
    private final QuizService quizService;

    @RequestMapping("/quiz")
    public String main(){
        return "thymeleaf/login";
    }

    @PostMapping("/admin")
    public String login(HttpServletRequest request){
        if(adminService.login(request.getParameter("id"), request.getParameter("pw"))){ // 로그인 성공
            return "thymeleaf/main";
        }
        return "thymeleaf/login"; // 로그인 실패
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
