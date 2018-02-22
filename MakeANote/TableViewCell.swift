//
//  TableViewCell.swift
//  MakeANote
//
//  Created by Manasa on 2/21/18.
//  Copyright © 2018 baitinti. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var deleteBt: UIButton!
    @IBOutlet weak var editBT: UIButton!
    var celldata : MyNotes?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(data: MyNotes) {
        self.label.text = data.title
        self.textView.text = data.detail
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    


}
