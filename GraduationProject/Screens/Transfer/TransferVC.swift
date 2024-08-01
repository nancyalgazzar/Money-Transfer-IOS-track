//
//  TransferVC.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 31/07/2024.
//

import UIKit

class TransferVC: UIViewController {
    
    @IBOutlet weak var stepOneView: UIView!
    @IBOutlet weak var stepTwoView: UIView!
    @IBOutlet weak var stepThreeView: UIView!
    @IBOutlet weak var changeRateFrameView: UIView!
    @IBOutlet weak var changeRateLabel: UILabel!
    @IBOutlet weak var sendAmountTextFilled: UITextField!
    @IBOutlet weak var getsAmountTextFilled: UITextField!
    @IBOutlet weak var recepentNameTextFilled: UITextField!
    @IBOutlet weak var recepentAccountTextFilled: UITextField!
    @IBOutlet weak var continueBtnView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScreen()
        
    }
}

extension TransferVC {
    private func setUpScreen() {
        stepThreeView = setUpStepView(stepThreeView)
    }
    
    private func setUpStepView(_ view: UIView) -> UIView{
        
        var stepView = view
        stepView.layer.borderWidth = 3
        stepView.layer.borderColor = #colorLiteral(red: 0.6062087417, green: 0.1836366951, blue: 0.2688316107, alpha: 1)
        toCircle(view: &stepView)
        
        return stepView
    }
}
