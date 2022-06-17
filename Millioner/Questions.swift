//
//  Questions.swift
//  Millioner
//
//  Created by Артур Кондратьев on 01.06.2022.
//

import Foundation

class Questions {
    
    static func needQestions() -> [QuestionsModel] {
        return [ QuestionsModel(qestion: "Сколько будет 2+2*2?",
                                coorectAnswer: "6",
                                answersA: "2",
                                answersB: "4",
                                answersC: "6",
                                answersD: "8"),
                 QuestionsModel(qestion: "Какое растение существует на самом деле?",
                                coorectAnswer: "Лох индийский",
                                answersA: "Лох чилийский",
                                answersB: "Лох греческий",
                                answersC: "Лох индийский",
                                answersD: "Лох русский"),
                 QuestionsModel(qestion: "Сколько грамм в 1 килограмме?",
                                coorectAnswer: "1000",
                                answersA: "10",
                                answersB: "100",
                                answersC: "1000",
                                answersD: "10000"),
                 QuestionsModel(qestion: "Что является спутником земли?",
                                coorectAnswer: "Луна",
                                answersA: "Солнце",
                                answersB: "Юпитер",
                                answersC: "Марс",
                                answersD: "Луна"),
                 QuestionsModel(qestion: "Сколько будет 2 в квадрате?",
                                coorectAnswer: "4",
                                answersA: "2",
                                answersB: "4",
                                answersC: "6",
                                answersD: "8") ]
        
    }
}
