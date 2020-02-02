//
//  HabitDetailViewController.swift
//  HabitClicker
//
//  Created by red.bean on 2020/02/02.
//  Copyright © 2020 hongsii. All rights reserved.
//

import UIKit

class HabitDetailViewController: UIViewController {

    var habit: Habit?
    
    let dateFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        f.locale = Locale(identifier: "ko_KR")
        return f
    }()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.tableFooterView = UIView()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HabitDetailViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailContentCell", for: indexPath)
            cell.textLabel?.text = "습관"
            cell.detailTextLabel?.text = habit?.content
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailDateCell", for: indexPath)
            cell.textLabel?.text = "생성일"
            cell.detailTextLabel?.text = dateFormatter.string(for: habit?.createdAt)
            return cell
        default:
            fatalError("Not exists row. check table view")
        }
    }
    
}
