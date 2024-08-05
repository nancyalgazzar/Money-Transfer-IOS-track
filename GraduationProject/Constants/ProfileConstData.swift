//
//  ProfileConstData.swift
//  GraduationProject
//
//  Created by 1234 on 31/07/2024.
//

import Foundation
import UIKit

struct ProfileConstData{
    private  let settingsList = [ProfileCellModel(iconImage: "password-outline 1", title: "Change password", subTitle: "Change Password", vcName: ChangePasswordVC()), ProfileCellModel(iconImage: "edit 1", title: "Edit Profile", subTitle: "Change your information", vcName: EditProfileVC())]
    
      func getSettingsList() -> [ProfileCellModel]{
        return settingsList
    }
     func getSettingsListCount() -> Int{return settingsList.count}
     func getVCNameOfIndex(_ index: Int)-> UIViewController{
        return settingsList[index].vcName
    }
     func getDataOfIndex(_ index: Int)-> ProfileCellModel{
        return settingsList[index]
    }
    
}
struct ProfileInfoConstData{
    static  let fullName = "Full Name"
    static let email = "Email"
    static let birthdate = "Date Of Birth"
    static  let country = "Country"
    static let bankAccount = "Bank Account"
    private  let names = ["Full Name", "Email", "Date Of Birth", "Country","Bank Account"]
    func getNamesCount() -> Int {return names.count}
    func getEntryOfIndex(_ index: Int)->String{return names[index]}
}
struct ProfileGeneralConstData{
    let generalProfileConst = [ProfileCellModel(iconImage: "user 1", title: "Personal information", subTitle: "Your information", vcName: ProfileInfoTVC()), ProfileCellModel(iconImage: "Setting 1", title: "Setting", subTitle: "Change your settings", vcName: SettingsTVC())
    ]
    // ,payment history,  my Favourite list

    func getGeneralListCount() -> Int{return generalProfileConst.count}
    func getVCNameOfIndex(_ index: Int)-> UIViewController{
       return generalProfileConst[index].vcName
    }
     func getDataOfIndex(_ index: Int)-> ProfileCellModel{
        return generalProfileConst[index]
   }
}
