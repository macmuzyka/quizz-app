package com.quizz.model

import jakarta.persistence.*
import kotlin.random.Random

@Entity
data class Question(
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null,
    var text: String = "",
    @OneToMany(cascade = [CascadeType.ALL], orphanRemoval = true)
    @JoinColumn(name = "question_id")
    var answers: List<Answer> = mutableListOf(),
    var stage: Int = resolveStage(answers.size)
)

fun resolveStage(size: Int): Int {
    return when {
        size > 5 -> 1
        size > 3 -> 2
        else -> 3
    }
}
