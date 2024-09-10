package com.quizz.model

import jakarta.persistence.*

@Entity
data class Question(
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null,
    @Column(unique = true)
    var text: String = "",
    @OneToMany(cascade = [CascadeType.ALL], orphanRemoval = true)
    @JoinColumn(name = "question_id")
    var answers: List<Answer> = mutableListOf(),
    var stage: Int = resolveStage(answers.size)
) {
    fun prettyQuestion(): String {
        return text + "\n" + answers.map { a -> a.text + ": " + a.points }
    }
}

fun resolveStage(size: Int): Int {
    return when {
        size > 5 -> 1
        size > 3 -> 2
        else -> 3
    }
}
