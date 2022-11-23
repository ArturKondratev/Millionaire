//
//  RecordListViewController.swift
//  Snake
//
//  Created by Артур Кондратьев on 28.05.2022.
//  Copyright © 2022 Pinspb. All rights reserved.
//

import UIKit

class RecordListViewController: UITableViewController {
    
    // MARK: - Properties
    let recordsCaretaker = RecordsCaretaker()
    var recordList: [GameSession] = []
    
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.recordList = recordsCaretaker.retrieveRecords().reversed()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? RecordTableViewCell
        else {
            return UITableViewCell()
        }
        let record = recordList[indexPath.row]
        cell.configure(record: record)
        cell.selectionStyle = .none
        return cell
    }
    
    // MARK: - Functions
    @IBAction func clearList(_ sender: Any) {
        recordsCaretaker.clearRecordList()
        self.recordList.removeAll()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

