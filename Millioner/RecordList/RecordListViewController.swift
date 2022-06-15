//
//  RecordListViewController.swift
//  Snake
//
//  Created by Артур Кондратьев on 28.05.2022.
//  Copyright © 2022 Pinspb. All rights reserved.
//

import UIKit

class RecordListViewController: UITableViewController {
    
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.records.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let record =  Game.shared.records.reversed()[indexPath.row]
        cell.selectionStyle = .none
        cell.textLabel?.text = dateFormatter.string(from: record.date) + " " + "Правильных ответов \(record.score)"
        return cell
    }
}

