//
//  CreateGameStrategy.swift
//  Millioner
//
//  Created by Артур Кондратьев on 09.06.2022.
//

import Foundation

protocol CreateGameStrategy {
    func createGame() -> [QuestionsModel]
}

final class RandomQuestionsStrategy: CreateGameStrategy {
    private let questions = QuestionCaretaker()
    
    func createGame() -> [QuestionsModel] {
        var questions = Questions.needQestions() + questions.retrieveRecords()
        questions.shuffle()
        return questions
    }
}

final class NormalQuestionsStrategy: CreateGameStrategy {
    private let questions = QuestionCaretaker()
    
    func createGame() -> [QuestionsModel] {
        let questions = Questions.needQestions() + questions.retrieveRecords()
        return questions
    }
}
