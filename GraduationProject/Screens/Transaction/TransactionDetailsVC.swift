//
//  TransactionDetailsVC.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 31/07/2024.
//

import UIKit

class TransactionDetailsVC: UIViewController {
    @IBOutlet weak var fromView: UIView!
    @IBOutlet weak var toView: UIView!
    @IBOutlet weak var detailView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundedCorners(view: &fromView, radius: 8)
        roundedCorners(view: &toView, radius: 8)
        roundedCorners(view: &detailView, radius: 8)
        
    }
}

