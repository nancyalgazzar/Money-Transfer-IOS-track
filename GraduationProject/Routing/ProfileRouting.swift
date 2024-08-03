//
//  ProfileRouting.swift
//  GraduationProject
//
//  Created by 1234 on 03/08/2024.
//

import UIKit

struct ProfileRouting{
 static func navigateBetweenScreens(_ root: UIViewController, and child : UIViewController){
        root.navigationController?.pushViewController(child, animated: true)
    }
}
