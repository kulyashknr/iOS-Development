//
//  TaskCell.swift
//  APITableView
//
//  Created by Kulyash Konyrova on 10/9/19.
//  Copyright © 2019 Kulyash Konyrova. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    
    
}
