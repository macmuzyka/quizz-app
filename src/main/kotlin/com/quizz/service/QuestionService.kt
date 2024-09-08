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
    private var currentGameStateId: Long = 0

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

    fun saveCurrentGame(game: GameState): GameState {
        log.info("gameState passed from endpoint: {}", game)
        log.info("current gameState id: {}", currentGameStateId)
        if (currentGameStateId == 0L) {
            log.info("creating new gameState entity")
            val newGameState = gameStateRepository.save(game)
            val currentGameId = newGameState.id
            log.info("gameState id to set in class object: {}", currentGameId)
            if (currentGameId != null) {
                currentGameStateId = currentGameId
                return newGameState
            } else {
                throw IllegalArgumentException("gameState Id was null even tough it should not!")
            }
        } else {
            val sessionGameStateId = currentGameStateId
            log.info("sessionGameStateId: {}", currentGameStateId)
            val sessionGameState = gameStateRepository.findById(sessionGameStateId)
            if (sessionGameState.isPresent) {
                val obj = sessionGameState.get()
                log.info("sessionGameState pre save: {}", obj)
                obj.redPoints = game.redPoints
                obj.bluePoints = game.bluePoints
                val afterUpdate = gameStateRepository.save(obj)
                log.info("after update: {}", afterUpdate)
                return afterUpdate
            } else {
                throw IllegalArgumentException("Could not find gamestate based on id even though it should be there!")
            }
        }
    }

    fun resetAuxiliaryMap(): String {
        usedQuestions.clear()
        currentGameStateId = 0
        return if (usedQuestions.isEmpty()) {
            log.info("Auxiliary map cleared!")
            return "OK"
        } else {
            log.info("Error clearing auxiliary map!")
            "Auxiliary map was not cleared properly"
        }
    }
}