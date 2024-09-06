package com.quizz.service

import com.quizz.model.GameState
import com.quizz.model.Question
import com.quizz.repository.GameStateRepository
import com.quizz.repository.QuestionRepository
import jakarta.transaction.Transactional
import org.slf4j.LoggerFactory
import org.springframework.stereotype.Service


@Service
class QuestionService(
    private val gameStateRepository: GameStateRepository,
    private val questionRepository: QuestionRepository
) {
    private val log = LoggerFactory.getLogger(QuestionService::class.java)
    private val usedQuestions = mutableSetOf<Long>()

    @Transactional
    fun addQuestion(question: Question): Question {
        log.info("question :: {}", question)
        return questionRepository.save(question)
    }

    fun getQuestions(): List<Question> {
        return questionRepository.findAll()
    }

    fun playGame(): Question? {
        val ids = questionRepository.findAllQuestionIds()
        log.info("ids: {}", ids)
        log.info("used questions: {}", usedQuestions)
        val sub = ids - usedQuestions
        log.info("sub: {}", sub)

        if (sub.isEmpty()) {
            log.warn("No more question to pool from!")
            throw IllegalArgumentException("No more question to pool from!")
        }
        val randomId = sub.random()
        usedQuestions.add(randomId)
        return questionRepository.findById(randomId).takeIf { it.isPresent }?.get()
            ?: throw IllegalArgumentException("Cannot find question with id $randomId")
    }

    fun saveCurrentGame(game: GameState): Any {
        log.info("gameState passed from endpoint: {}", game)
        return gameStateRepository.save(game)
    }
}