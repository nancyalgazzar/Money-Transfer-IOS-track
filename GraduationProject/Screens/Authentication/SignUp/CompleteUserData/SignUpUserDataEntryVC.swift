//
//  SignUpUserDataEntryVC.swift
//  GraduationProject
//
//  Created by 1234 on 31/07/2024.
//

import UIKit
import FittedSheets

class SignUpUserDataEntryVC: UIViewController {

    @IBOutlet weak var nationalIDTF: CustomTextField!
    @IBOutlet weak var birthDayPicker: CustomTextField!
    @IBOutlet weak var countrySelectOutlet: CustomTextField!
    var signUpUserDataEntry: SignUpUserDataEntryViewModelProtocol!
    var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpUserDataEntry = SignUpUserDataEntryViewModel()
        bindViewModel()
        navigationItem.hidesBackButton = true
        initDatePicker()
        setTextFieldDelegates()
        setGestureForDatePicking()
        setGestureForCountrySelect()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func continueBtn(_ sender: UIButton) {
        signUpUserDataEntry.checkDateAndCountryPicking(country: countrySelectOutlet.text, date: birthDayPicker.text, nationalID: nationalIDTF.text)
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
        sheetController.setSizes([.percent(0.7)])
        return sheetController
     }
}
//MARK: DatePicker Setting
extension SignUpUserDataEntryVC: UIGestureRecognizerDelegate{
  
    private func showDatePicker() {
        
        birthDayPicker.inputView = datePicker

    }
    private func initDatePicker(){
        datePicker = UIDatePicker()
        datePicker.locale = .current
        datePicker.datePickerMode = .date
        datePicker.maximumDate = .now
        datePicker.preferredDatePickerStyle  = .compact
        datePicker.addTarget(self, action: #selector(pickedDate(datePicker:)), for: .valueChanged)
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(finishedPicking))
        doneButton.tintColor = .black
        toolbar.setItems([doneButton], animated: false)
        birthDayPicker.inputAccessoryView = toolbar
    }
    @objc private func pickedDate(datePicker: UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        
        birthDayPicker.text = formatter.string(from: datePicker.date)
        
    }
    @objc private func finishedPicking(){
        birthDayPicker.resignFirstResponder()
    }
}
//MARK:  TextField Delegate
extension SignUpUserDataEntryVC: UITextFieldDelegate {
    
    private func setTextFieldDelegates(){
        birthDayPicker.delegate = self
        countrySelectOutlet.delegate = self
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
}
extension SignUpUserDataEntryVC{
    func bindViewModel() {
        signUpUserDataEntry.showError = {title, message in
            self.alertMessage(title: title, message: message)
        }
        signUpUserDataEntry.goToHome = {
            HomeRouting.goToHome(VC: self)
        }
    }
}
