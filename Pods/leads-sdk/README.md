# leads-sdk
![Version](https://img.shields.io/cocoapods/v/leads-sdk.svg?style=flat)
![License](https://img.shields.io/cocoapods/l/leads-sdk.svg?style=flat)
![Platform](https://img.shields.io/cocoapods/p/leads-sdk.svg?style=flat)

The Leads SDK provides an embeddable button for iOS apps to make lead capture from native apps incredibly easy. Leads are stored in the [Salesforce Sales Cloud](http://salesforce.com/sales-cloud) for sales teams to quickly action and drive further sales from any mobile application.

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

leads-sdk is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
use_frameworks!

pod "leads-sdk"
```

or, to fetch the latest

```ruby
use_frameworks!

pod 'leads-sdk' :git => 'https://github.com/quintonwall/leads-sdk.git'
```


###Add the LeadsButton to a UIView
Within your storyboard, drag a standard button from the palette, then change its type to lead button

![](https://github.com/quintonwall/leads-sdk/blob/master/readme-assets/customClass.png?raw=true)

Then, in the properties editor, add the [Salesforce org id](https://help.salesforce.com/HTViewSolution?id=000006019) provided by your Salesforce administrator. The return url is not really used in mobile apps. You can leave it set to the default. The pod currently does not use it, but future releases may support a webview sort of confirmation.

![](https://github.com/quintonwall/leads-sdk/blob/master/readme-assets/setOrgId.png?raw=true)

###Pass lead information to LeadsButton
To add fields to the LeadsButton, create an outlet to your ViewController, and import the leads_sdk module.

```swift
import leads_sdk

class ViewController: UIViewController {

    @IBOutlet weak var myLeadButton: LeadsButton!

```


####Add Standard Fields
LeadsButton is preconfigured to support the typical standard lead fields (fist name, last name, email, company, city, and state). When using standard fields, Salesforce administrators do no need to create a custom  [web-to-lead](https://help.salesforce.com/apex/HTViewHelpDoc?id=setting_up_web_to_lead.htm&language=en_US) field. As long as web-to-lead is enabled in the Salesforce org, that is all you need.

```swift
  var d :Dictionary = [String: String]()

  //populate the standard fields
  d[Leads.StandardFields.FIRST_NAME] = "Quinton"
  d[Leads.StandardFields.LAST_NAME] = "Wall"
  d[Leads.StandardFields.EMAIL] = "quinton@here.com"
  d[Leads.StandardFields.COMPANY] = "Salesforce"
  d[Leads.StandardFields.CITY] = "San Francisco"
  d[Leads.StandardFields.STATE] = "CA"
```

####Add Custom Fields
Salesforce Leads also support custom fields. Your administrator will need to use the [web-to-lead](https://help.salesforce.com/apex/HTViewHelpDoc?id=setting_up_web_to_lead.htm&language=en_US) feature within Salesforce to generate the unique custom field Ids. If you are only collecting standard lead fields, there is no need to generate a web-to-lead form. Once you have these field ids, simply add them to the dictionary object.

```swift
  //populate custom fields
  d["00NG000000CZxsC"] = "MyCustomValue"
```

####Send the Leads to Salesforce
Once you have your fields Dictionary create, add the dictionary to the LeadsButton and call sendLead(). SendLead also checks to ensure that you have specified an Org Id throwing an error if it is not set correctly.

```swift
  myLeadButton.formFields = d
  do {
         try myLeadButton.sendLead()
    }
    catch Leads.LeadError.NoOrgId {
        print("no org id set!")
    }
    catch Leads.LeadError.CommsFailure {
        //comms problem
    }
    catch {
        //unexpected error
    }

```

###Adding Themes
Three UI themes have been included in LeadsButton:

1. Default: ![Default](https://github.com/quintonwall/leads-sdk/blob/master/readme-assets/default.png?raw=true)
2. Dark: ![Dark](https://github.com/quintonwall/leads-sdk/blob/master/readme-assets/dark.png?raw=true)
3. Graphical ![Graphical](https://github.com/quintonwall/leads-sdk/blob/master/readme-assets/graphical.png?raw=true)

You can add a theme with the following command. If you do not specify any theme, you can set colors and styles manually.

```swift
  LeadsThemeManager.applyTheme(LeadsTheme.[Default | Dark | Graphical], leadsbutton: myLeadButton)
```

##Sample Application
For a complete example of using the LeadsButton, please check out the sample app included in this project.

## Author

Quinton Wall, [@quintonwall](http://twitter.com/quintonwall)

## License

leads-sdk is available under the MIT license. See the LICENSE file for more info.
