//
//  QuestionCaretaker.swift
//  Millioner
//
//  Created by Артур Кондратьев on 15.06.2022.
//

import Foundation

final class QuestionCaretaker {
    
    // MARK: - Properties
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "questions"
    
    // MARK: - Functions
    func save(questions: [QuestionsModel]) {
        do {
            let data = try encoder.encode(questions)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print (error)
        }
    }
    
    func retrieveRecords() -> [QuestionsModel] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try decoder.decode([QuestionsModel].self, from: data)
        } catch {
            print (error)
            return []
        }
    }
}
