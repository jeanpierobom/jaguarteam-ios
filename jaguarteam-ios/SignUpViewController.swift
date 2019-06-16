//
//  SignUpViewController.swift
//  jaguarteam-ios
//
//  Created by Jean on 6/6/19.
//  Copyright © 2019 Langara. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    //     Custom Colors:
    
    var customOrange = UIColor(red: CGFloat(255.0/255.0), green: CGFloat(110.0/255.0), blue: CGFloat(97.0/255.0), alpha: 1.0);
    var fadedOrange = UIColor(red: CGFloat(255.0/255.0), green: CGFloat(143.0/255.0), blue: CGFloat(169.0/255.0), alpha: 1.0);
    
    //    User Accout Structure:
    
    struct UserAccount: Codable {
        var email: String
        var password: String
        var name: String
        var cityId: Int
        var birthDate: String
        var bio: String
        var motherCountryId: Int
        var teacherType: String
        var teacherPrice: Int
    }
    
    //    Form Data:
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confPassword: UITextField!
    @IBOutlet weak var birthDate: UITextField!
    
    //    Other Components:
    
    @IBOutlet weak var termsSwitch: UISwitch!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var header: UIImageView!
    @IBOutlet weak var footerLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    
    //    Alert Definitions:
    
    let formAlert = UIAlertController(title: "Error", message: "There are incomplete required fields. Please complete them.", preferredStyle: .alert);
    let passAlert = UIAlertController(title: "Error", message: "Passwords don't match.", preferredStyle: .alert);
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        //        Alert Actions:
        
        formAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil));
        passAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil));
    }
    
    //    Switch Event Handler:
    
    @IBAction func onSwitch(_ sender: Any) {
        if (termsSwitch.isOn) {
            signUpButton.isEnabled = true;
            signUpButton.backgroundColor = customOrange;
        } else {
            signUpButton.isEnabled = false;
            signUpButton.backgroundColor = fadedOrange;
        }
    }
    
    //    Sign Up Button Event Handler:
    
    @IBAction func onSignUp(_ sender: Any) {
//        if (name.text == "" || email.text == "" || password.text == "" || confPassword.text == "" || birthDate.text == "") { // Form Check
//            self.present(formAlert, animated: true, completion: nil);
//        } else if (password.text != confPassword.text) { // Password Check
//            self.present(passAlert, animated: true, completion: nil);
//        } else {
            //            Instantiating UserAccount:
            let userData = UserAccount(email: email.text ?? "email@email.com", password: password.text ?? "password", name: name.text ?? "name", cityId: 1, birthDate: "1985-01-01", bio: "bio", motherCountryId: 1, teacherType: "C", teacherPrice: 1);
            signUpRequest(userData: userData);
//        }
    }
    
    
    func signUpRequest(userData: UserAccount) {
        //        Setting Up Session and Request:
        let url = URL(string: "https://1hxwhklro6.execute-api.us-east-1.amazonaws.com/prod/teacher")!;
        let session = URLSession.shared;
        var request = URLRequest(url: url);
        let jsonEncoder = JSONEncoder();
        let jsonData = try? jsonEncoder.encode(userData);
        request.httpBody = jsonData;
        request.httpMethod = "POST";
        request.addValue("application/json", forHTTPHeaderField: "Content-Type");
        request.addValue("application/json", forHTTPHeaderField: "Accept");
        
        //        Declaring Task:
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            if error != nil {
                print(error?.localizedDescription as Any);
                return
            }
            do {
                let result = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:AnyObject];
                print(result ?? "");
            } catch let error {
                print("Error -> \(error)")
            }
        });
        
        //        Making Request:
        task.resume();
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
