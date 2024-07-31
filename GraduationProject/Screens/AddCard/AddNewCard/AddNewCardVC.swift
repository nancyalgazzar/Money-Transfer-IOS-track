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
        // Do any additional setup after loading the view.
    }

    @IBAction func signOnBtn(_ sender: UIButton) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
