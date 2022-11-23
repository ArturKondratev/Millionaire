//
//  Game.swift
//  Millioner
//
//  Created by Артур Кондратьев on 28.05.2022.
//

import Foundation

final class Game {
    
    // MARK: - Properties
    var gameSession: GameSession?
    static let shared = Game()
    private let recordsCaretaker = RecordsCaretaker()
    private let questionsCaretaker = QuestionCaretaker()
    var questionsArray: [QuestionsModel] = []
    
    var questionOrder: Difficulty = .sequence
    var strategyInstance: CreateGameStrategy?
        
    //MARK: - Initialization
    private init() {
        questionsArray = Questions.needQestions() + questionsCaretaker.retrieveRecords()
    }
    
    //MARK: - добавляем результат в массив
    func addResult(record: GameSession) {
        recordsCaretaker.saveRecord(records: [record])
    }
    
    //MARK: - Получаем стратегию и отдаем необходимый массив: последовательный или перемешанный
    private var createArrayStrategy: CreateGameStrategy  {
        switch questionOrder {
        case .sequence:
            return NormalQuestionsStrategy()
        case .random:
            return RandomQuestionsStrategy()
        }
    }

    func returnRequestedArray() -> [QuestionsModel] {
        strategyInstance = createArrayStrategy
        return (strategyInstance?.createGame())!
    }
}
