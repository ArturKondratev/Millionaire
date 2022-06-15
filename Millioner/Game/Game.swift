//
//  Game.swift
//  Millioner
//
//  Created by Артур Кондратьев on 28.05.2022.
//

import Foundation

struct Record: Codable {
    let date: Date
    let score: Int
}

final class Game {
    
    var gameSession: GameScene?
    
    static let shared = Game()
    
    private let recordCaretaker = RecordsCaretaker()
    
    private(set) var records: [Record] {
        didSet {
            recordCaretaker.save(records: records)
        }
    }
    
    private init() {
        self.records = self.recordCaretaker.retrieveRecords()
    }
    
    // MARK: - Functions
    
    func addRecord (_ record: Record) {
        records.append(record)
    }
    
    func clearRecords() {
        records = []
    }
}
