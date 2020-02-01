//
//  HabitMainTableViewCell.swift
//  HabitClicker
//
//  Created by red.bean on 2020/02/01.
//  Copyright © 2020 hongsii. All rights reserved.
//

import UIKit

class HabitMainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var count: UILabel!
    
    var habit: Habit? {
        didSet {
            content.text = habit?.content
            setCountLabel(currentCount: habit!.count)
        }
    }
    
    @IBAction func plus(_ sender: UIButton) {
        updateCount(additionalCount: 1)
    }
    
    @IBAction func minus(_ sender: UIButton) {
        updateCount(additionalCount: -1)
    }
    
    private func updateCount(additionalCount: Int16) {
        habit?.count += additionalCount
        DataManager.shared.saveContext()
        
        setCountLabel(currentCount: habit!.count)
    }
    
    private func setCountLabel(currentCount: Int16 = 0) {
        var text = String(currentCount)
        var textColor = UIColor.label
        if (currentCount > Int16(0)) {
            text = "+" + text
            textColor = UIColor.systemGreen
        } else if (currentCount < Int16(0)) {
            textColor = UIColor.systemRed
        }
        count.text = text
        count.textColor = textColor
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension UIColor {
    
    convenience init(hex: String) {
        var chars = Array(hex.hasPrefix("#") ? hex.dropFirst() : hex[...])
        switch chars.count {
            case 3: chars = chars.flatMap { [$0, $0] }; fallthrough
            case 6: chars = ["F","F"] + chars
            case 8: break
            default:
                assertionFailure("Invalid hex")
        }
        
        self.init(
            red: .init(strtoul(String(chars[2...3]), nil, 16)) / 255,
            green: .init(strtoul(String(chars[4...5]), nil, 16)) / 255,
            blue: .init(strtoul(String(chars[6...7]), nil, 16)) / 255,
            alpha: .init(strtoul(String(chars[0...1]), nil, 16)) / 255
        )
    }
}
