//
//  RecordsCaretaker.swift
//  Millioner
//
//  Created by Артур Кондратьев on 28.05.2022.
//

import Foundation

class RecordsCaretaker {
    
    // MARK: - Properties
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let key = "records"
    
    // MARK: - Functions
    func saveRecord(records: [GameSession]) {
        do {
            let list = self.retrieveRecords()
            let data = try encoder.encode(list + records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveRecords() -> [GameSession] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try decoder.decode([GameSession].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
    
    func clearRecordList() {
        let records:[GameSession] = []
        do {
            let data = try encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
}
