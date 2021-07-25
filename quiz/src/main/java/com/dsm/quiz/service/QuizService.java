package com.dsm.quiz.service;

import com.dsm.quiz.entity.Quiz;
import com.dsm.quiz.payload.response.QuizResponse;
import com.dsm.quiz.repository.QuizRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Service
public class QuizService {
    private final QuizRepository quizRepository;

    public List<QuizResponse> randomQuiz(int num){
        List<Quiz> quiz = quizRepository.randomQuiz(num);
        List<QuizResponse> quizResponses = new ArrayList<>();
        for(Quiz q : quiz){
            quizResponses.add(
                    QuizResponse.builder()
                            .content(q.getContent())
                            .title(q.getTitle())
                            .answer(q.getAnswer())
                            .build()
            );
        }
        return quizResponses;
    }
}
