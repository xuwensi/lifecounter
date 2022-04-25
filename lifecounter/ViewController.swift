//
//  ViewController.swift
//  lifecounter
//
//  Created by Wensi Xu on 4/20/22.
//

import UIKit

class ViewController: UIViewController, itemActionTeller {
    final let TABLE_ROW_HEIGHT = 150.0
    
    var playerLife = 20
    var playerName = ""
    var historyText = ""
    var updatedLife = ""
    var NumPlayer = 4
    
    func plusClicked(_ sender: Any) {
        playerBtn.isEnabled = false
        historyText.append("\(playerName) gained 1 life.\n")
    }
    
    func minusClicked(_ sender: Any) {
        playerBtn.isEnabled = false
        if playerLife <= 0 {
            displayLoseMessage()
        }
        historyText.append("\(playerName) lost 1 life.\n")
    }
    
    func updateClicked(_ sender: Any) {
        playerBtn.isEnabled = false
        if playerLife <= 0 {
            displayLoseMessage()
        }
        historyText.append("\(playerName) \(updatedLife).\n")
    }
    
    func getLife(life: Int) {
        playerLife = life
    }
    
    func getPlayerName(name: String) {
        playerName = name
    }
    
    func getUpdatedLife(lifeChange: String) {
        updatedLife = lifeChange
    }
    
    func displayLoseMessage() {
        loseMessageLabel.text = "\(playerName) LOSES!"
        loseMessageLabel.textColor = UIColor.red
    }
    
    @IBOutlet weak var loseMessageLabel: UILabel!
    @IBOutlet weak var playerViewPlaceHolder: UITableView!
    @IBOutlet weak var playerBtn: UIButton!
    
    
    @IBAction func addPlayerBtn(_ sender: Any) {
        NumPlayer += 1
        playerViewPlaceHolder.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let customTableView = itemPlayerTableView()
//        customTableView.delegate = self
        setUpTableView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier
        {
        case Optional("fromMainToHistory"):
            let destination = segue.destination as! HistoryViewController
            destination.history = historyText
            break;
        default:
            print("segue identifier error")
        }
    }
    
    private func setUpTableView() {
        let playerViewNib = UINib(nibName: "itemPlayerTableView", bundle: nil)
        playerViewPlaceHolder.register(playerViewNib, forCellReuseIdentifier: "itemPlayerTableView")
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NumPlayer
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemPlayerTableView", for: indexPath) as! itemPlayerTableView
        cell.delegate = self
        cell.itemPlayerName.text = "Player \(indexPath.row + 1)"
        return cell
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TABLE_ROW_HEIGHT
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Select row at \(indexPath)")
    }

}




