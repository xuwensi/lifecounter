//
//  itemPlayerTableView.swift
//  lifecounter
//
//  Created by Wensi Xu on 4/23/22.
//

import UIKit

protocol itemActionTeller {
    func plusClicked(_ sender: Any)
    func minusClicked(_ sender: Any)
    func updateClicked(_ sender: Any)
    func getLife(life: Int)
    func getPlayerName(name: String)
    func getUpdatedLife(lifeChange: String)
}

class itemPlayerTableView: UITableViewCell {
    var delegate: itemActionTeller?
    var playerLife = 20
    
    @IBOutlet weak var itemPlayerName: UILabel!
    
    @IBOutlet weak var itemScoreLabel: UILabel!
    
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var itemSignSelected: UISegmentedControl!
    
    @IBOutlet weak var itemNumberInput: UITextField!
 
    @IBAction func itemPlusBtn(_ sender: Any) {
        playerLife += 1
        displayPlayerLife()
        self.delegate?.plusClicked(sender)
    }
    
    @IBAction func itemMinusBtn(_ sender: Any) {
        playerLife -= 1
        displayPlayerLife()
        self.delegate?.minusClicked(sender)
    }
    
    @IBAction func updateCustomLife(_ sender: Any) {
        let value = Int(itemNumberInput.text!)
        if value != nil {
            if itemSignSelected.selectedSegmentIndex == 0{
                playerLife += value!
                self.delegate?.getUpdatedLife(lifeChange: "gained \(value!) life")
            } else {
                playerLife -= value!
                self.delegate?.getUpdatedLife(lifeChange: "lost \(value!) life")
            }
            displayPlayerLife()
        } else {
            print("Numeric Input Required")
        }
        self.delegate?.updateClicked(sender)
    }
    
    func displayPlayerLife() {
        itemScoreLabel.text = "\(playerLife)"
        self.delegate?.getLife(life: playerLife)
        self.delegate?.getPlayerName(name: itemPlayerName.text!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
