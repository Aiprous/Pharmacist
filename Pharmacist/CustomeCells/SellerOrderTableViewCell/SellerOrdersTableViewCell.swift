 //
//  SellerOrdersTableViewCell.swift
//  Pharmacist
//
//  Created by SBC on 25/10/18.
//  Copyright © 2018 Aiprous. All rights reserved.
//

import UIKit

class SellerOrdersTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblOrderTotal: UILabel!
    @IBOutlet weak var btnViewDetails: DesignableButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
