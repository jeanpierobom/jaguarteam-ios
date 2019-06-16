//
//  RequestClassViewController.swift
//  jaguarteam-ios
//
//  Created by Jean on 6/6/19.
//  Copyright © 2019 Langara. All rights reserved.
//

import UIKit

class RequestClassViewController: UIViewController {
//STRUCT update Class Schedule TEACHER
    struct updateClassSchedule: Codable {
        var id: Int
//        var teacherType: String
        var teacherPrice: Int
//        var dayOfWeek: String
//        var timeStart: String
//        var timeEnd: String
//        var availability: [String] = []
    }
    
    
    //PRICE COMPONENT AND BUTTON

    
    // MONDAY COMPONENTS
    
    @IBOutlet weak var switchMonday: UISwitch!
    @IBOutlet weak var startMonday: UITextField!
    @IBOutlet weak var endMonday: UITextField!
    @IBOutlet weak var addMonday: UIButton!
        // TUESDAY COMPONENTS
    
    @IBOutlet weak var switchTuesday: UISwitch!
    @IBOutlet weak var startTuesday: UITextField!
    @IBOutlet weak var endTuesday: UITextField!
    @IBOutlet weak var addTuesday: UIButton!
    
    // WEDNESDAY COMPONENTS
    
    @IBOutlet weak var switchWednesday: UISwitch!
    @IBOutlet weak var startWednesday: UITextField!
    @IBOutlet weak var endWednesday: UITextField!
    @IBOutlet weak var addWednesday: UIButton!
    
    // THURSDAY COMPONENTS
    
    @IBOutlet weak var switchThursday: UISwitch!
    @IBOutlet weak var startThursday: UITextField!
    @IBOutlet weak var endThursday: UITextField!
    @IBOutlet weak var addThursday: UIButton!
    
    // FRIDAY COMPONENTS
    
    @IBOutlet weak var switchFriday: UISwitch!
    @IBOutlet weak var startFriday: UITextField!
    @IBOutlet weak var endFriday: UITextField!
    @IBOutlet weak var addFriday: UIButton!
    
    // SATURDAY COMPONENTS
    
    @IBOutlet weak var switchSaturday: UISwitch!
    @IBOutlet weak var startSaturday: UITextField!
    @IBOutlet weak var endSaturday: UITextField!
    @IBOutlet weak var addSaturday: UIButton!
    
    // SUNDAY COMPONENTS
    
    @IBOutlet weak var switchSunday: UISwitch!
    @IBOutlet weak var startSunday: UITextField!
    @IBOutlet weak var endSunday: UITextField!
    @IBOutlet weak var addSunday: UIButton!
    
    // NEXT/SUBMIT BUTTON
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MONDAY
    @IBAction func onSwitchMonday(_ sender: Any) {
        if (switchMonday.isOn) {
            startMonday.isEnabled = true;
            endMonday.isEnabled = true;
            addMonday.isEnabled = true;
        }else{
            startMonday.isEnabled = false;
            endMonday.isEnabled = false;
            addMonday.isEnabled = false;
        }
    }
    
    // TUESDAY
    @IBAction func onSwitchTuesday(_ sender: Any) {
        if (switchTuesday.isOn) {
            startTuesday.isEnabled = true;
            endTuesday.isEnabled = true;
            addTuesday.isEnabled = true;
        }else{
            startTuesday.isEnabled = false;
            endTuesday.isEnabled = false;
            addTuesday.isEnabled = false;
        }
    }
    
    // WEDNESDAY
    @IBAction func onSwitchWednesday(_ sender: Any) {
        if (switchWednesday.isOn) {
            startWednesday.isEnabled = true;
            endWednesday.isEnabled = true;
            addWednesday.isEnabled = true;
        }else{
            startWednesday.isEnabled = false;
            endWednesday.isEnabled = false;
            addWednesday.isEnabled = false;
        }
    }
    
    // THURSDAY
    @IBAction func onSwitchThursday(_ sender: Any) {
        if (switchThursday.isOn) {
            startThursday.isEnabled = true;
            endThursday.isEnabled = true;
            addThursday.isEnabled = true;
        }else{
            startThursday.isEnabled = false;
            endThursday.isEnabled = false;
            addThursday.isEnabled = false;
        }
    }
    
    // FRIDAY
    @IBAction func onSwitchFriday(_ sender: Any) {
        if (switchFriday.isOn) {
            startFriday.isEnabled = true;
            endFriday.isEnabled = true;
            addFriday.isEnabled = true;
        }else{
            startFriday.isEnabled = false;
            endFriday.isEnabled = false;
            addFriday.isEnabled = false;
        }
    }
    
    // SATURDAY
    @IBAction func onSwitchSaturday(_ sender: Any) {
        if (switchSaturday.isOn) {
            startSaturday.isEnabled = true;
            endSaturday.isEnabled = true;
            addSaturday.isEnabled = true;
        }else{
            startSaturday.isEnabled = false;
            endSaturday.isEnabled = false;
            addSaturday.isEnabled = false;
        }
    }
    
    // SUNDAY
    @IBAction func onSwitchSunday(_ sender: Any) {
        if (switchSunday.isOn) {
            startSunday.isEnabled = true;
            endSunday.isEnabled = true;
            addSaturday.isEnabled = true;
        }else{
            startSunday.isEnabled = false;
            endSunday.isEnabled = false;
            addSunday.isEnabled = false;
        }
    }
    
    
    // PUT REQUEST BY NEXT BUTTON
    

    @IBAction func updateSchedule(_ sender: Any) {
//FIX THIS ONE
//        let mondayClass = updateClassSchedule(id: 1,availability:(dayOfWeek: "1", timeStart: startMonday.text ?? "StartTime", timeEnd: endMonday.text ?? "EndTime"))
//
        
        // TESTING TO UPDATE PRICE(WORKING, JUST REMOVE VARIABLES ON updateClassSchedule)
        let mondayClass = updateClassSchedule(id: 4, teacherPrice: 35 )
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
