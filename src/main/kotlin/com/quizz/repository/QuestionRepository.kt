package com.quizz.repository

import com.quizz.model.Question
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.stereotype.Repository

@Repository
interface QuestionRepository : JpaRepository<Question, Long> {
    @Query("SELECT q.id FROM Question q")
    fun findAllQuestionIds(): Set<Long>
}