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
    func save(records: [Record]) {
        do {
            let data = try encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveRecords() -> [Record] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        
        do {
            return try decoder.decode([Record].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
