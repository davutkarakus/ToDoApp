//
//  ToDoTableViewCell.swift
//  ToDoApp
//
//  Created by Davut Karakuş on 1.02.2023.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    @IBOutlet weak var labelToDo: UILabel!
    
    @IBOutlet weak var labelTarih: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
