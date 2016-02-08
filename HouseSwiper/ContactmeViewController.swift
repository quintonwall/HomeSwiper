//
//  ContactmeViewController.swift
//  HouseSwiper
//
//  Created by Quinton Wall on 2/5/16.
//  

import UIKit
import leads_sdk

class ContactmeViewController: UITableViewController {

    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var submitButton: LeadsButton!
    
    @IBOutlet var tview: UITableView!
    
    var listing: Listing?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //make window 30% the size of the app to give us a little popup effect.
        self.view.bounds = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width * 0.30, 300)
        self.view.clipsToBounds = true
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitTapped(sender: AnyObject) {
        
        
        var d :Dictionary = [String: String]()
        
        //populate the standard fields
        d[Leads.StandardFields.FIRST_NAME] = firstNameTF.text
        d[Leads.StandardFields.LAST_NAME] = lastNameTF.text
        d[Leads.StandardFields.EMAIL] = emailTF.text
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
