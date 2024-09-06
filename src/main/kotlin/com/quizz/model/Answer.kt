package com.quizz.model

import jakarta.persistence.*

@Entity
data class Answer(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Long? = null,
    var text: String = "",
    var points: Int = 0
)
