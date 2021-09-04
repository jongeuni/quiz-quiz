package com.dsm.quiz.service;

import com.dsm.quiz.entity.Quiz;
import com.dsm.quiz.repository.QuizRepository;
import com.dsm.quiz.payload.request.LoginRequest;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Getter
@Service
public class AdminService {
    @Value("${admin.id}")
    private String id;

    @Value("${admin.pw}")
    private String pw;
    private final QuizRepository quizRepository;

    public boolean login(LoginRequest loginReq){
        return loginReq.getId().equals(id) && loginReq.getPw().equals(pw);
    }

    public void insertQuiz(Quiz quiz){
        quizRepository.save(quiz);
    }
}
