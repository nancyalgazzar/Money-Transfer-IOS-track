//
//  EditProfileVC.swift
//  GraduationProject
//
//  Created by 1234 on 31/07/2024.
//

import UIKit
import FittedSheets
class EditProfileVC: UIViewController {

    @IBOutlet weak var emailTF: CustomTextField!
    @IBOutlet weak var fullNameTF: CustomTextField!
    @IBOutlet weak var datePickerTF: CustomTextField!
    @IBOutlet weak var countryPickerTF: CustomTextField!
    var datePicker: UIDatePicker!
    var editProfileViewModel: EditProfileViewModelProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        editProfileViewModel = EditProfileViewModel()
        bindViewModel()
        initDatePicker()
        setTextFieldDelegates()
        setGestureForDatePicking()
        setGestureForCountrySelect()
        // Do any additional setup after loading the view.
    }

    @IBAction func editProfileBtn(_ sender: UIButton) {
        editProfileViewModel.EditProfile(fullName: fullNameTF.text, email: emailTF.text, country: countryPickerTF.text, birthdate: datePickerTF.text)
    }
}
//MARK: gesture recognizer of BirthDay
extension EditProfileVC{
    private func setGestureForDatePicking(){
          let tap =  UITapGestureRecognizer(target: self, action: #selector(viewDidTapped))
          tap.delegate = self
        datePickerTF.addGestureRecognizer(tap)
      }
      @objc private func viewDidTapped(){
          showDatePicker()
          datePickerTF.becomeFirstResponder()
      }
}
//MARK: Country select
extension EditProfileVC{
    private func setGestureForCountrySelect(){
          let tap =  UITapGestureRecognizer(target: self, action: #selector(selectCountry))
          tap.delegate = self
          countryPickerTF.addGestureRecognizer(tap)
      }
      @objc private func selectCountry(){
          let country = CountriesTVC()
          let sheetController = setFittedSheet(VC: country)
          country.didSelectCountry { selectedCountry in
              self.countryPickerTF.text = selectedCountry
              sheetController.dismiss(animated: true)
          }
          self.present(sheetController, animated: true, completion: nil)
      }
     private func setFittedSheet(VC: UIViewController) -> SheetViewController{
        let sheetController = SheetViewController(controller: VC)
        sheetController.cornerRadius = 35
        sheetController.setSizes([.percent(0.5)])
        return sheetController
     }
}
//MARK: DatePicker Setting
extension EditProfileVC: UIGestureRecognizerDelegate{
  
    private func showDatePicker() {
        
        datePickerTF.inputView = datePicker

    }
    private func initDatePicker(){
        datePicker = UIDatePicker()
        datePicker.locale = .current
        datePicker.datePickerMode = .date
        datePicker.maximumDate = .now
        datePicker.preferredDatePickerStyle  = .wheels
        datePicker.addTarget(self, action: #selector(pickedDate(datePicker:)), for: .valueChanged)
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(finishedPicking))
        doneButton.tintColor = .black
        toolbar.setItems([doneButton], animated: false)
        datePickerTF.inputAccessoryView = toolbar
    }
    @objc private func pickedDate(datePicker: UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        
        datePickerTF.text = formatter.string(from: datePicker.date)
        
    }
    @objc private func finishedPicking(){
        datePickerTF.resignFirstResponder()
    }
}
//MARK:  TextField Delegate
extension EditProfileVC: UITextFieldDelegate {
    
    private func setTextFieldDelegates(){
        datePickerTF.delegate = self
        countryPickerTF.delegate = self
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
}
extension EditProfileVC{
    func bindViewModel(){
        editProfileViewModel.showError = { title, message in
            self.alertMessage(title: title, message: message)
        }
    }
}
