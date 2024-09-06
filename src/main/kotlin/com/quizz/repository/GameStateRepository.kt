package com.quizz.repository

import com.quizz.model.GameState
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface GameStateRepository: JpaRepository<GameState, Long> {
}