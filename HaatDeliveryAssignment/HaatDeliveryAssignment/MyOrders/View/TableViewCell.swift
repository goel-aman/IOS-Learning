//
//  TableViewCell.swift
//  HaatDeliveryAssignment
//
//  Created by aman on 12/10/24.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var orderId: UILabel!
    @IBOutlet weak var dateTime: UILabel!
    @IBOutlet weak var referenceNumber: UILabel!
    
    @IBOutlet weak var arrivedAt: UILabel!
    @IBOutlet weak var businessName: UILabel!
    @IBOutlet weak var businessImage: UIImageView!
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemQuantity: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    
    @IBOutlet weak var subTotal: UILabel!
    @IBOutlet weak var deliveryFee: UILabel!
    @IBOutlet weak var serviceFee: UILabel!
    @IBOutlet weak var redeemedCoin: UILabel!
    @IBOutlet weak var totalCoin: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
