//
//  HabitMainTableViewCell.swift
//  HabitClicker
//
//  Created by red.bean on 2020/02/01.
//  Copyright © 2020 hongsii. All rights reserved.
//

import UIKit

class HabitMainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    var habit: Habit? {
        didSet {
            contentLabel.text = habit?.content
            setCountLabel(count: habit?.count)
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
        
        setCountLabel(count: habit?.count)
    }
    
    private func setCountLabel(count: Int16? = 0) {
        guard let count = count else { return }
        var text = "  "
        var textColor = UIColor.label
        if (count > Int16(0)) {
            text = "+\(count)"
            textColor = UIColor.systemBlue
        } else if (count < Int16(0)) {
            text = "−\(abs(count))"
            textColor = UIColor.systemRed
        }
        countLabel.text = text
        countLabel.textColor = textColor
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
