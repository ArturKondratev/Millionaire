//
//  GameScene.swift
//  Millioner
//
//  Created by Артур Кондратьев on 09.06.2022.
//

import Foundation

class GameScene {
    
    var game: Game?
    
    var questions: [QuestionsModel]?
    private let createQuestionsStrategy: CreateGameStrategy
    
    init(createGameStrategy: CreateGameStrategy) {
        self.createQuestionsStrategy = createGameStrategy
    }
    
    fileprivate func createQuestions() {
        let question = self.createQuestionsStrategy.createGame()
        guard let questions = question.first else { return }
        self.questions = [questions]
    }
    
    
}
