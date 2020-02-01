//
//  HabitMainTableViewController.swift
//  HabitClicker
//
//  Created by red.bean on 2020/01/31.
//  Copyright © 2020 hongsii. All rights reserved.
//

import UIKit

class HabitMainTableViewController: UITableViewController {
   
    static let refreshHabits = Notification.Name(rawValue: "refreshHabits")
    
    var hierarchicalData = [[String]]()
    private var observers = [NSObjectProtocol]()
    
    deinit {
        observers.forEach { observer in NotificationCenter.default.removeObserver(observer) }
    }
    
    // 뷰가 생성될 때 초기화 코드 구현
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let refreshHabitsObserver = NotificationCenter.default.addObserver(forName: HabitMainTableViewController.refreshHabits, object: nil, queue: OperationQueue.main) { [weak self] (noti) in self?.tableView.reloadData() }
        
        observers.append(refreshHabitsObserver)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DataManager.shared.fetchHabits()
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.habits.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HabitCell", for: indexPath) as! HabitMainTableViewCell

        cell.habit = DataManager.shared.habits[indexPath.row]
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
