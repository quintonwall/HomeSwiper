//
//  LeadPopupViewController.swift
//  HouseSwiper
//
//  Created by Quinton Wall on 2/5/16.
//  Copyright © 2016 Richard Burdish. All rights reserved.
//

import UIKit
import leads_sdk

class LeadPopupViewController: UIViewController, UITextFieldDelegate {

    var listing:Listing?
    
    @IBOutlet weak var dialogView: UIView!
   
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var submitButton: LeadsButton!
    @IBOutlet weak var closeButton: UIButton!
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        dialogView.layer.cornerRadius = 5
        dialogView.layer.borderWidth = 5
        dialogView.layer.borderColor = UIColor.whiteColor().CGColor
        
        firstNameTF.layer.borderColor = UIColor.whiteColor().CGColor
        firstNameTF.layer.borderWidth = 1
        lastNameTF.layer.borderColor = UIColor.whiteColor().CGColor
        lastNameTF.layer.borderWidth = 1
        emailTF.layer.borderColor = UIColor.whiteColor().CGColor
        emailTF.layer.borderWidth = 1
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitLead(sender: AnyObject) {
        
        var d :Dictionary = [String: String]()
        
        //populate the standard fields
        d[Leads.StandardFields.FIRST_NAME] = firstNameTF.text
        d[Leads.StandardFields.LAST_NAME] = lastNameTF.text
        d[Leads.StandardFields.EMAIL] = emailTF.text
        d["lead_source"] = "Mobile App"
        d["00NB0000001jonm"] = listing!.PropertyId as! String
        
        //todo: add custom fields to lead object and generate web-to-lead to capture.
        
        
        submitButton.formFields = d
        
        do {
            try submitButton.sendLead()
            self.dismissViewControllerAnimated(true, completion: {})
        }
        catch Leads.LeadError.NoOrgId {
            print("no ord id set!")
        }
        catch Leads.LeadError.CommsFailure {
            //comms problem
        }
        catch {
            //unexpected error
        }
        

    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    @IBAction func closeTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {});
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
