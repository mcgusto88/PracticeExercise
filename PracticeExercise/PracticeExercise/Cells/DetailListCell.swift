//
//  DetailListCell.swift
//  PracticeExercise
//
//  Created by User on 12/6/21.
//

import UIKit

class DetailListCell: UITableViewCell {

    @IBOutlet weak var userIdLbl: UILabel!
    @IBOutlet weak var todoIdLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var completedLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
