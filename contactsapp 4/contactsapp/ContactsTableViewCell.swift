//
//  ContactsTableViewCell.swift
//  contactsapp
//
//  Created by Navneet Kang on 11/30/20.
//  Copyright © 2020. All rights reserved.
//
import UIKit

class ContactsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contactIcon: UIImageView!
    @IBOutlet weak var star: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var heartImage: UIImageView!
    var doubleTapped : (() -> ())?
      var cellTapped : (() -> ())?
      
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        let doubleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(sender:)))
//        doubleTapGestureRecognizer.numberOfTapsRequired = 2
//        contactIcon.addGestureRecognizer(doubleTapGestureRecognizer)
    }
    
    
    @objc func cellDoubleTapped(){
          self.doubleTapped?()
      }
      
      @objc func tapCell(){
          self.cellTapped?()
      }
    
    @objc func handleDoubleTap(sender: UITapGestureRecognizer) {
        print("sdfdsf")
//        let touchPoint = sender.location(in: tableView)
//        if let indexPath = tableView.indexPathForRow(at: touchPoint) {
//            print("handleDoubleTap",indexPath)
//        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
