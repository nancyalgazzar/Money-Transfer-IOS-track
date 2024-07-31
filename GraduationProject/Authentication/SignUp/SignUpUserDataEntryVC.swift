//
//  SignUpUserDataEntryVC.swift
//  GraduationProject
//
//  Created by 1234 on 31/07/2024.
//

import UIKit
import FittedSheets

class SignUpUserDataEntryVC: UIViewController {

    @IBOutlet weak var birthDayPicker: CustomTextField!
    @IBOutlet weak var countrySelectOutlet: CustomTextField!
    var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFieldDelegates()
        setGestureForDatePicking()
        setGestureForCountrySelect()
        // Do any additional setup after loading the view.
    }
   
}
//MARK: gesture recognizer of BirthDay
extension SignUpUserDataEntryVC{
    private func setGestureForDatePicking(){
          let tap =  UITapGestureRecognizer(target: self, action: #selector(viewDidTapped))
          tap.delegate = self
          birthDayPicker.addGestureRecognizer(tap)
      }
      @objc private func viewDidTapped(){
          showDatePicker()
          birthDayPicker.becomeFirstResponder()
      }
}
//MARK: Country select
extension SignUpUserDataEntryVC{
    private func setGestureForCountrySelect(){
          let tap =  UITapGestureRecognizer(target: self, action: #selector(selectCountry))
          tap.delegate = self
          countrySelectOutlet.addGestureRecognizer(tap)
      }
      @objc private func selectCountry(){
          let country = CountriesTVC()
          let sheetController = setFittedSheet(VC: country)
          country.didSelectCountry { selectedCountry in
              self.countrySelectOutlet.text = selectedCountry
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
//MARK: private functions
extension SignUpUserDataEntryVC: UIGestureRecognizerDelegate{
  
    private func showDatePicker() {
        datePicker = UIDatePicker()
        datePicker.locale = .current
        datePicker.datePickerMode = .date
        datePicker.maximumDate = .now
        datePicker.preferredDatePickerStyle  = .wheels
        datePicker.tintColor = UIColor(hex: "#521220")
        datePicker.addTarget(self, action: #selector(pickedDate(datePicker:)), for: .valueChanged)
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(finishedPicking))
        toolbar.setItems([doneButton], animated: false)
        birthDayPicker.inputAccessoryView = toolbar
        birthDayPicker.inputView = datePicker

    }
    
    @objc private func pickedDate(datePicker: UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        birthDayPicker.text = formatter.string(from: datePicker.date)
        
    }
    @objc private func finishedPicking(){
        birthDayPicker.resignFirstResponder()
    }
}
//MARK: BirthDay TextField Delegate
extension SignUpUserDataEntryVC: UITextFieldDelegate {
    
    private func setTextFieldDelegates(){
        birthDayPicker.delegate = self
        countrySelectOutlet.delegate = self
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
}
