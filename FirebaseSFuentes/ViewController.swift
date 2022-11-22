//
//  ViewController.swift
//  FirebaseSFuentes
//
//  Created by Samuel Fuentes Navarrete on 21/11/22.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var textFielNamedInput: UITextField!
    @IBOutlet weak var textViewNameList: UITextView!
    
    var refrences: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
// MARK: Test Firebase Crashlytics
        let button = UIButton(type: .roundedRect)
              button.frame = CGRect(x: 20, y: 50, width: 100, height: 30)
              button.setTitle("Test Crash", for: [])
              button.addTarget(self, action: #selector(self.crashButtonTapped(_:)), for: .touchUpInside)
              view.addSubview(button)
   
        
        self.refrences = Database.database().reference()
        observeData()
        
        
    }
// MARK: Test Firebase Crashlytics
    @IBAction func crashButtonTapped(_ sender:          AnyObject) {
          let numbers = [0]
          let _ = numbers[1]
      }
    
    
    
    @IBAction func addName(_ sender: Any) {
        
        if textFielNamedInput.text != "" {
            self.refrences.child("MyDataBaseTest").child("User").child(textFielNamedInput.text!).setValue(textFielNamedInput.text)
            textFielNamedInput.text = ""
        }
        
    }
   
    
    func observeData()
    {
        self.refrences.child("MyDataBaseTest").child("User").observe(.value, with: {(snapshot) in
            self.textViewNameList.text = ""
            
            if let oSnapShot = snapshot.children.allObjects as? [DataSnapshot]{
                
                for oSnap in oSnapShot{
                    if let sName = oSnap.value as? String{
                        print("Name: \(sName)")
                        self.textViewNameList.text = self.textViewNameList.text + sName + "\n"
                    }
                }
            }
         })
    }

}

