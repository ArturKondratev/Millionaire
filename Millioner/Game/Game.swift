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
    
//    var arrayFromMemory = [QuestionsModel]() {
//        didSet {
//            questionsCaretaker.save(questions: self.arrayFromMemory)
//        }
//    }
    
    //MARK: - Initialization
    private init() {
       // self.arrayFromMemory = self.questionsCaretaker.retrieveRecords()
        questionsArray = Questions.needQestions() + questionsCaretaker.retrieveRecords()
    }
    
    //MARK: - добавляем результат в массив
    func addResult(record: GameSession) {
        recordsCaretaker.saveRecord(records: [record])
    }
    
    //MARK: - Получаем стратегию и отдаем необходимый массив: последовательный или перемешанный
    var questionOrder: Difficulty = .sequence
    
    private var createArrayStrategy: CreateGameStrategy  {
        switch questionOrder {
        case .sequence:
            return NormalQuestionsStrategy()
        case .random:
            return RandomQuestionsStrategy()
        }
    }
    
    var strategyInstance: CreateGameStrategy?
    
    func returnRequestedArray() -> [QuestionsModel] {
        strategyInstance = createArrayStrategy
        return (strategyInstance?.createGame())!
    }
    
}
