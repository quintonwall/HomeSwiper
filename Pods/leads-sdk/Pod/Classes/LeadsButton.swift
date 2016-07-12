// The MIT License (MIT)
//
// Copyright (c) 2015 Meng To (meng@designcode.io)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
//
// Custom button for submitting leads into Salesforce Sales Cloud
// Quinton Wall - @quintonwall

import UIKit

public class LeadsButton: UIButton {
    @IBInspectable public var orgid: String = ""
    private var postURL: String = "https://www.salesforce.com/servlet/servlet.WebToLead?encoding=UTF-8"
    @IBInspectable public var retURL: String = "http://mobile/success"
    
       //convenience variables for minimum info
    //@IBInspectable public var firstName: String = ""
    //@IBInspectable public var lastName: String = ""
   // @IBInspectable public var emailAddress: String = ""
    //@IBInspectable public var phoneNumber: String = ""
    
    
    //default lead fields. You can add your own custom fields by adding an element to the dictionary at run time.
    public var formFields: [String : String] = [Leads.StandardFields.FIRST_NAME : "",
       Leads.StandardFields.LAST_NAME : "", Leads.StandardFields.EMAIL : "", Leads.StandardFields.COMPANY : "", Leads.StandardFields.CITY : "", Leads.StandardFields.STATE : ""]
    
    

    
    //on tap, send to salesforce
    public func sendLead() throws {
       
        let request = NSMutableURLRequest(URL: NSURL(string: postURL)!)
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        if (orgid.isEmpty ) {
            throw Leads.LeadError.NoOrgId
        }
        else {
            formFields[Leads.StandardFields.ORGID] = orgid
        }
      
        var bodyData: String = ""
        
        for (key,val) in formFields {
            bodyData.appendContentsOf("&\(key)=\(val)")
            
        }
        request.HTTPBody = bodyData.dataUsingEncoding(NSUTF8StringEncoding);
        
        
        let task = session.dataTaskWithRequest(request, completionHandler:{
            data, response, err -> Void in
            // this code runs asynchronously...
            // ... i.e. later, after the request has completed (or failed)
            if(err != nil) {
                print("Error: \(err)")
            }
            else {
                //print("Response: \(response)")
            }
        })
        task.resume() //actually run the task
    }
}