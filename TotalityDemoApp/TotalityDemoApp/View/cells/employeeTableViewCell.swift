//
//  employeeTableViewCell.swift
//  TotalityDemoApp
//
//  Created by Apple on 08/06/22.
//

import UIKit

class employeeTableViewCell: UITableViewCell {

    @IBOutlet weak var salaryOutlet: UILabel!
    
    @IBOutlet weak var ageOutlet: UILabel!
    @IBOutlet weak var emNameOutlet: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
