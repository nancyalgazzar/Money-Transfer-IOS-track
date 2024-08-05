//
//  AddNewCardVC.swift
//  GraduationProject
//
//  Created by 1234 on 31/07/2024.
//

import UIKit

class AddNewCardVC: UIViewController {

    @IBOutlet weak var dateTF: CustomTextField!
    @IBOutlet weak var cvvTF: CustomTextField!
    @IBOutlet weak var cardNOTF: CustomTextField!
    @IBOutlet weak var cardholderNameTF: CustomTextField!
    @IBOutlet weak var addCardMessageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       setLabel()
    }

    @IBAction func signOnBtn(_ sender: UIButton) {
        AddCardRouting.goToConnectingProgress(VC: self)
    }
}

//MARK: private functions
extension AddNewCardVC{
    private func setLabel() {
        addCardMessageLabel.numberOfLines = 0
        addCardMessageLabel.lineBreakMode = .byWordWrapping
    }
}

//MARK: navigation Bar
extension AddNewCardVC{
    private func navigationItemFormat(){
        let rightButton  = UIBarButtonItem(title:"cancel", style: .plain, target: self, action: #selector(cancelTransfer))
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.title = "Add Card"
    }
    @objc private func cancelTransfer(){
        navigationController?.popViewController(animated: true)
        
//        navigationController?.popToViewController(SignInVC(), animated: true)
    }
}
