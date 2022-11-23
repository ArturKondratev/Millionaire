//
//  RecordTableViewCell.swift
//  Millioner
//
//  Created by Артур Кондратьев on 16.06.2022.
//

import UIKit

class RecordTableViewCell: UITableViewCell {

    // MARK: - Properties
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var fiftyFifty: UIButton!
    @IBOutlet weak var callFriend: UIButton!
    @IBOutlet weak var helpHall: UIButton!
    
    // MARK: - Functions
    func configure(record: GameSession) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        date.text = dateFormatter.string(from: record.date!)
        score.text = "Очки: \(record.answeredQuestionCount!)"
        
        fiftyFifty.tintColor = record.fifyFifty ? .tintColor : .darkGray
        callFriend.tintColor = record.callPrompt ? .tintColor : .darkGray
        helpHall.tintColor = record.helpHall ? .tintColor : .darkGray
    }
}
