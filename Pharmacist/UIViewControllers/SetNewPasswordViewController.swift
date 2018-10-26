//
//  SetNewPasswordViewController.swift
//  Pharmacist
//
//  Created by NCORD LLP on 22/09/18.
//  Copyright © 2018 Aiprous. All rights reserved.
//

import UIKit

class SetNewPasswordViewController: UIViewController {

    @IBOutlet weak var txtVerificationCode: UITextField!
    @IBOutlet weak var txtNewPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtVerificationCode.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        
         txtNewPassword.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true;
        self.navigationItem.hidesBackButton = true;
//        txtVerificationCode.becomeFirstResponder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    func  textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == self.txtVerificationCode{
            
            let maxlength = 4
            let legnth = textField.text?.count
            let currentString : String = textField.text! as String
            var newString = (currentString as NSString).replacingCharacters(in: range, with: string) as? NSString
            //            let newString : String = currentString.replacingCharacters(in: range , with: string) as String
            let allowed =  CharacterSet.decimalDigits
            let characterset = CharacterSet(charactersIn: string)
            txtNewPassword.becomeFirstResponder()
            return newString!.length <= maxlength
            
        } else if textField == self.txtNewPassword{
            
            let maxlength = 10
            let legnth = textField.text?.count
            let currentString : String = textField.text! as String
            var newString = (currentString as NSString).replacingCharacters(in: range, with: string) as? NSString
            //            let newString : String = currentString.replacingCharacters(in: range , with: string) as String
            let allowed =  CharacterSet.decimalDigits
            let characterset = CharacterSet(charactersIn: string)
            return newString!.length <= maxlength
            
        }
        return true;
    }
    
    
    // MARK:- Text Field Delegate methods
    
    @objc func textFieldDidChange(textField: UITextField){
        
        let text = textField.text
        if text?.utf16.count == 10{
            switch textField {
                
            case txtVerificationCode:
                txtNewPassword.becomeFirstResponder()
                
            case txtNewPassword:
                txtNewPassword.resignFirstResponder()

            default:
                break;
            }
        }else{
            
        }
    }
 

    @IBAction func btnSetPasswordAction(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.createMenuView()

        
    }
}
