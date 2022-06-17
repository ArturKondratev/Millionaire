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
    func createGame() -> [QuestionsModel] {
        var questions = Questions.needQestions()
        questions.shuffle()
        return questions
    }
}

final class NormalQuestionsStrategy: CreateGameStrategy {
    func createGame() -> [QuestionsModel] {
        let questions = Questions.needQestions()
        return questions
    }
}
