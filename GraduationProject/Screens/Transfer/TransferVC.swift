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
        guard stepOneView != nil else {return}
        setUpStepOneView()
        
        guard stepThreeView != nil else {return}
        guard stepTwoView != nil else {return}
        setUpStepViews()
        
        guard changeRateFrameView != nil else {return}
        roundedCorners(view: &changeRateFrameView, radius: 8)
        
        continueBtnView.tintColor = #colorLiteral(red: 0.6062087417, green: 0.1836366951, blue: 0.2688316107, alpha: 1)
    }
    
    private func setUpStepOneView() {
        stepOneView.layer.borderWidth = 3
        stepOneView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        stepOneView.layer.borderColor = #colorLiteral(red: 0.6062087417, green: 0.1836366951, blue: 0.2688316107, alpha: 1)
        toCircle(view: &stepOneView)
    }
    
    private func setUpStepViews() {
        stepTwoView.layer.borderWidth = 3
        stepTwoView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        stepTwoView.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        toCircle(view: &stepTwoView)
        
        stepThreeView.layer.borderWidth = 3
        stepThreeView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        stepThreeView.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        toCircle(view: &stepThreeView)
    }
}
