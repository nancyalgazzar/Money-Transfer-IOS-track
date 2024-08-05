//
//  ProfileInfoViewModel.swift
//  GraduationProject
//
//  Created by 1234 on 05/08/2024.
//

import Foundation

protocol ProfileInfoViewModelProtocol: DisplayErrorMessageProtocol{
    func fetchData(completion:@escaping()->())
    func getProfileInfoCount()->Int
    func getProfileDataAtIndex(_ index: Int)->(String, String?)
}
class ProfileInfoViewModel:ProfileInfoViewModelProtocol {
    var showError: ((String, String) -> Void)?
    
    var infoData: [(String, String?)] = []
    
    func fetchData( completion:@escaping()->()) {
//        GetProfileInfoAPIManager.getProfileInfo(completion:{
//            error, profileInfo in
//
//            if let error = error {
//                print(error.localizedDescription)
//        self.showError?("sorry", error.localizedDescription)
//            }
//            if let profileInfo = profileInfo {
//                self.formateData(profileData: profileInfo)
//                completion()
//            }
//        })
        formateData(profileData: nil)
        completion()
    }
    
    func formateData (profileData: ProfileInfoModel?) {
        let data = [(ProfileInfoConstData.fullName,"\(profileData?.firstName ?? "") \(profileData?.lastName ?? "") "),
                    (ProfileInfoConstData.email, profileData?.email),
                    (ProfileInfoConstData.birthdate, profileData?.birthdate),
                   ( ProfileInfoConstData.country, profileData?.country),
                   ( ProfileInfoConstData.bankAccount, profileData?
                        .bankAccount)]
        
        infoData = data
        
    }
    func getProfileInfoCount()->Int {
        return infoData.count
    }
    func getProfileDataAtIndex(_ index: Int)->(String, String?){
        return infoData[index]
    }
}
