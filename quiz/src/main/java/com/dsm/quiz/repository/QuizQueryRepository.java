package com.dsm.quiz.repository;

import com.dsm.quiz.entity.QQuiz;
import com.dsm.quiz.entity.Quiz;
import com.querydsl.core.types.dsl.NumberExpression;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@RequiredArgsConstructor
@Repository
public class QuizQueryRepository {
    private final JPAQueryFactory queryFactory;

    public List<Quiz> randomQuiz(int num){
        QQuiz quiz = QQuiz.quiz;
         return queryFactory.selectFrom(quiz)
                 .orderBy(NumberExpression.random().asc())
                 .limit(num)
                .fetch();
    }
}
