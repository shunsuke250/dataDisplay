//
//  CustomCell.swift
//  dataDisplay
//
//  Created by 副山俊輔 on 2022/06/26.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var dataLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
