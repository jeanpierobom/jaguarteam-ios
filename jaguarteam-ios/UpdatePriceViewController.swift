//
//  RequestClassViewController.swift
//  jaguarteam-ios
//
//  Created by Jean on 6/6/19.
//  Copyright © 2019 Langara. All rights reserved.
//

import UIKit

class UpdatePriceViewController: UIViewController {
    //STRUCT update Class Schedule TEACHER
    struct updateClassSchedule: Codable {
        var id: Int
        
        var teacherPrice: Int
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var editPrice: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    
    @IBAction func updateSchedule(_ sender: Any) {
        //FIX THIS ONE
        //        let mondayClass = updateClassSchedule(id: 1,availability:(dayOfWeek: "1", timeStart: startMonday.text ?? "StartTime", timeEnd: endMonday.text ?? "EndTime"))
        
        // TESTING TO UPDATE PRICE(WORKING, JUST REMOVE VARIABLES ON updateClassSchedule)
        
        let mondayClass = updateClassSchedule(id: 4, teacherPrice: Int(editPrice.text!) ?? 35 )
        updateScheduleRequest(dayClass: mondayClass)
    }
    
    
    
    
    func updateScheduleRequest(dayClass:updateClassSchedule) {
        //        Setting Up Session and Request:
        let url = URL(string: "https://1hxwhklro6.execute-api.us-east-1.amazonaws.com/prod/teacher")!;
        let session = URLSession.shared;
        var request = URLRequest(url: url);
        let jsonEncoder = JSONEncoder();
        let jsonData = try? jsonEncoder.encode(dayClass);
        request.httpBody = jsonData;
        request.httpMethod = "PUT";
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
