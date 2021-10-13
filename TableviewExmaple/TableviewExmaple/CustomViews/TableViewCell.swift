//
//  TableViewCell.swift
//  TableviewExmaple
//
//  Created by Dannian Park on 2021/10/14.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var textField: UITextField!
    @IBOutlet var btnSelect: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    public func setData() {
        //?
    }
}
