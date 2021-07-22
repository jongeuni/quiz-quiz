package com.dsm.quiz;

import com.dsm.quiz.entity.Quiz;
import com.dsm.quiz.repository.QuizRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

@SpringBootTest
public class QuizRepositoryTests {
    @Autowired
    QuizRepository quizRepository;

    @Test
    public void randomPostTest(){
        int num = 3;
        List<Quiz> quiz = quizRepository.randomQuiz(num);
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
