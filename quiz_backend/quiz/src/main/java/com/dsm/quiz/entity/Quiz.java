package com.dsm.quiz.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Getter
@Table(name = "quiz")
@Entity
@NoArgsConstructor
public class Quiz {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int num;
    private String title;
    private String content;
    private int answer;

    @Builder
    Quiz(String title, String content, int answer){
        this.title = title;
        this.content = content;
        this.answer = answer;
    }
}
