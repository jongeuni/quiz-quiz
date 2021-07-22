package com.dsm.quiz;

import com.dsm.quiz.entity.Quiz;
import com.dsm.quiz.repository.QuizRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class QuizRepositoryTests {
    @Autowired
    QuizRepository quizRepository;

    @Test
    public void randomQuizTest(){
        int num = 3;
        quizRepository.randomQuiz(num);
    }

    @Test
    public void saveTest(){
        String title = "제목";
        String content = "내용";
        int answer = 2;
        Quiz quiz = Quiz.builder()
                .title(title)
                .content(content)
                .answer(answer)
                .build();
        quizRepository.save(quiz);
    }
}
