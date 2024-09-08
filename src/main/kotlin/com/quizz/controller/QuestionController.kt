package com.quizz.controller

import com.quizz.model.GameState
import com.quizz.model.Question
import com.quizz.service.QuestionService
import org.slf4j.LoggerFactory
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/questions")
class QuestionController(
        private val questionService: QuestionService
) {
    private val log = LoggerFactory.getLogger(QuestionController::class.java)

    @PostMapping
    fun createQuestion(@RequestBody question: Question): ResponseEntity<*> {
        return try {
            ResponseEntity.status(HttpStatus.CREATED).body(questionService.addQuestion(question))
        } catch (e: Exception) {
            ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.message)
        }
    }

    @GetMapping
    fun getQuestions(): ResponseEntity<*> {
        return try {
            ResponseEntity.status(HttpStatus.OK).body(questionService.getQuestions())
        } catch (e: Exception) {
            ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.message)
        }
    }

    @GetMapping("/start-game")
    fun startGame(): ResponseEntity<*> {
        return try {
            ResponseEntity.status(HttpStatus.OK).body(questionService.playGame())
        } catch (e: IllegalArgumentException) {
            ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.message)
        } catch (e: Exception) {
            ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.message)
        }
    }

    @PostMapping("/save-current-state-of-the-game")
    fun saveCurrentStateOfTheGame(@RequestBody game: GameState): ResponseEntity<*> {
        return try {
            val response = questionService.saveCurrentGame(game)
            log.info("response: {}", response)
            ResponseEntity.status(HttpStatus.CREATED).body(response)
        } catch (e: Exception) {
            ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.message)
        }
    }

    @PatchMapping("/reset-auxiliary-map")
    fun resetAuxiliaryMap(): ResponseEntity<*> {
        return try {
            val mapResetResult = questionService.resetAuxiliaryMap()
            return if (mapResetResult == "OK") {
                ResponseEntity.status(HttpStatus.OK).body(mapResetResult)
            } else {
                ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(mapResetResult)
            }
        } catch (e: Exception) {
            ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.message)
        }
    }
}