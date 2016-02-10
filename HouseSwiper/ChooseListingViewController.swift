

import UIKit
import DesignSystem
import MDCSwipeToChoose
import Alamofire
import SwiftyJSON


class ChooseListingViewController: UIViewController, MDCSwipeToChooseDelegate {
    
    var listings:[Listing] = []
    let ChooseListingButtonHorizontalPadding:CGFloat = 80.0
    let ChooseListingButtonVerticalPadding:CGFloat = 20.0
    var currentListing:Listing!
    var frontCardView:ChooseListingView!
    var backCardView:ChooseListingView!
    var bgColor:String = "B8BDB9"
    
    @IBOutlet weak var reloadButton: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        
         self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bgblur-sm")!)
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
       
        
        reloadButton.setBackgroundImage( UIImage.sldsIconAction(SLDSIconActionType.ResetPassword, withSize: 60)!, forState: UIControlState.Normal)
        
         fetchListings()
    }
    
    @IBAction func reloadCards(sender: AnyObject) {
        fetchListings()
    }
    
    func setUpCards() {
        self.setTheFrontCardView(self.popListingViewWithFrame(frontCardViewFrame())!)
        self.view.addSubview(self.frontCardView)
        
        
        self.backCardView = self.popListingViewWithFrame(backCardViewFrame())!
        self.view.insertSubview(self.backCardView, belowSubview: self.frontCardView)
        
        
        // Add buttons to programmatically swipe the view left or right.
        // See the `nopeFrontCardView` and `likeFrontCardView` methods.
        constructNopeButton()
        constructContactMeButton()
        constructLikedButton()
        
        
    }
    
    func suportedInterfaceOrientations() -> UIInterfaceOrientationMask{
        return UIInterfaceOrientationMask.Portrait
    }
    
    
    // This is called when a user didn't fully swipe left or right.
    func viewDidCancelSwipe(view: UIView) -> Void{
        
        print("You couldn't decide on \(self.currentListing.Address)");
    }
    
    // This is called then a user swipes the view fully left or right.
    func view(view: UIView, wasChosenWithDirection: MDCSwipeDirection) -> Void{
        
        // MDCSwipeToChooseView shows "NOPE" on swipes to the left,
        // and "LIKED" on swipes to the right.
        if(wasChosenWithDirection == MDCSwipeDirection.Left){
            print("You noped: \(self.currentListing.Address)")
        }
        else{
            
            print("You liked: \(self.currentListing.Address)")
        }
        
        // MDCSwipeToChooseView removes the view from the view hierarchy
        // after it is swiped (this behavior can be customized via the
        // MDCSwipeOptions class). Since the front card view is gone, we
        // move the back card to the front, and create a new back card.
        if(self.backCardView != nil){
            self.setTheFrontCardView(self.backCardView)
        }
        
        backCardView = self.popListingViewWithFrame(self.backCardViewFrame())
        //if(true){
        // Fade the back card into view.
        if(backCardView != nil){
            self.backCardView.alpha = 0.0
            self.view.insertSubview(self.backCardView, belowSubview: self.frontCardView)
            UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseInOut, animations: {
                self.backCardView.alpha = 1.0
                },completion:nil)
        }
    }
    func setTheFrontCardView(frontCardView:ChooseListingView) -> Void{
       
        self.frontCardView = frontCardView
        self.currentListing = frontCardView.listing
    }
    
    
    
    // service url should look something like this: https://pacific-reef-6131.herokuapp.com/properties
    //and based on this app: https://github.com/ccoenraets/lightning-react-app
    func fetchListings(){
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
       
       
        
        if (defaults.objectForKey("listingsServiceURL") == nil) {
            let alert = UIAlertController(title: "Oh Snap!", message: "Looks like you have no listings service URL set. Please go to settings and add one.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else {
            
             let listingUrl:String = defaults.valueForKey("listingsServiceURL") as! String
        
        request(.GET, listingUrl, parameters: nil)
            .responseJSON { response in
               
                let JSONstr = response.result.value
                
                
                let json = JSON(JSONstr!)
                
                var currListing:Listing
                
                
                
              
                for (_,subJson):(String, JSON) in json {
                    
                    let address = subJson["address"].stringValue
                    
                    currListing = Listing()

                    currListing.loadListing(subJson["sfid"].stringValue, address: subJson["address"].stringValue, city: subJson["city"].stringValue, imageUrl: subJson["pic"].stringValue, bedrooms: subJson["bedrooms"].numberValue, bathrooms: subJson["bathrooms"].numberValue, price: subJson["price"].numberValue, description: subJson["description"].stringValue, teaser: subJson["teaser"].stringValue, likes: 0, photos: 0)
                    
                    self.listings.append(currListing)
                    
                                    
                }
                
                //always add the instructions as the first element
                self.listings.insert(self.initInstructionListing(), atIndex: 0)
                self.setUpCards()
                
          }
        }
    }
    
    func initInstructionListing() -> Listing {
        
        var infoListing:Listing
         infoListing = Listing()
        infoListing.loadListing("0000", address: "1 Here St", city: "San Francisco", imageUrl: "", bedrooms: 2, bathrooms: 2, price: 100000, description: "Nice place", teaser: "Hot Property", likes: 1, photos: 4)
        
        return infoListing
    }
    
    func popListingViewWithFrame(frame:CGRect) -> ChooseListingView?{
        if(self.listings.count == 0){
            return nil;
        }
        
        // UIView+MDCSwipeToChoose and MDCSwipeToChooseView are heavily customizable.
        // Each take an "options" argument. Here, we specify the view controller as
        // a delegate, and provide a custom callback that moves the back card view
        // based on how far the user has panned the front card view.
        let options:MDCSwipeToChooseViewOptions = MDCSwipeToChooseViewOptions()
        options.delegate = self
        //options.threshold = 160.0
        options.onPan = { state -> Void in
            if(self.backCardView != nil){
                let frame:CGRect = self.frontCardViewFrame()
                self.backCardView.frame = CGRectMake(frame.origin.x, frame.origin.y-(state.thresholdRatio * 10.0), CGRectGetWidth(frame), CGRectGetHeight(frame))
            }
        }
        
        // Create a listingView with the top listing in the listings array, then pop
        // that listing off the stack.
        
        let listingView:ChooseListingView = ChooseListingView(frame: frame, listing: self.listings[0], options: options)
        self.listings.removeAtIndex(0)
        return listingView
        
    }
    func frontCardViewFrame() -> CGRect{
        let horizontalPadding:CGFloat = 20.0
        let topPadding:CGFloat = 60.0
        let bottomPadding:CGFloat = 200.0
        return CGRectMake(horizontalPadding,topPadding,CGRectGetWidth(self.view.frame) - (horizontalPadding * 2), CGRectGetHeight(self.view.frame) - bottomPadding)
    }
    func backCardViewFrame() ->CGRect{
        let frontFrame:CGRect = frontCardViewFrame()
        return CGRectMake(frontFrame.origin.x, frontFrame.origin.y + 10.0, CGRectGetWidth(frontFrame), CGRectGetHeight(frontFrame))
    }
    func constructNopeButton() -> Void{
        let button:UIButton =  UIButton(type: .System)
        let image:UIImage = UIImage.sldsIconAction(SLDSIconActionType.Close, withSize: 60)!
        button.frame = CGRectMake(ChooseListingButtonHorizontalPadding, CGRectGetMaxY(self.backCardView.frame) + ChooseListingButtonVerticalPadding, image.size.width, image.size.height)
        button.setBackgroundImage(image, forState: UIControlState.Normal)
       // button.tintColor = UIColor(red: 247.0/255.0, green: 91.0/255.0, blue: 37.0/255.0, alpha: 1.0)
        button.addTarget(self, action: "nopeFrontCardView", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }
    
    func constructContactMeButton() -> Void{
        
       let button:UIButton = UIButton(type: .System)
        let image:UIImage = UIImage.sldsIconAction(SLDSIconActionType.NewOpportunity, withSize: 40)!
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.whiteColor().CGColor
        
        
        button.frame = CGRectMake(CGRectGetMaxX(self.view.frame) - image.size.width - 167, CGRectGetMaxY(self.backCardView.frame) + ChooseListingButtonVerticalPadding+10, image.size.width, image.size.height)
        button.setBackgroundImage(image, forState:UIControlState.Normal)
        //button.tintColor = UIColor(red: 29.0/255.0, green: 245.0/255.0, blue: 106.0/255.0, alpha: 1.0)
        button.addTarget(self, action: "contactMePopup", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
    }

    
    func constructLikedButton() -> Void{
        

       
        let button:UIButton = UIButton(type: .System)
        let image:UIImage = UIImage.sldsIconAction(SLDSIconActionType.Approval, withSize: 60)!
        
        button.frame = CGRectMake(CGRectGetMaxX(self.view.frame) - image.size.width - ChooseListingButtonHorizontalPadding, CGRectGetMaxY(self.backCardView.frame) + ChooseListingButtonVerticalPadding, image.size.width, image.size.height)
        button.setBackgroundImage(image, forState:UIControlState.Normal)
        //button.tintColor = UIColor(red: 29.0/255.0, green: 245.0/255.0, blue: 106.0/255.0, alpha: 1.0)
        button.addTarget(self, action: "likeFrontCardView", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
    }
    func nopeFrontCardView() -> Void{
        self.frontCardView.mdc_swipe(MDCSwipeDirection.Left)
    }
    func likeFrontCardView() -> Void{
        self.frontCardView.mdc_swipe(MDCSwipeDirection.Right)
    }
    
    func contactMePopup() -> Void {
        self.performSegueWithIdentifier("test", sender: self)
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let popup = segue.destinationViewController as! LeadPopupViewController
        popup.listing = self.currentListing
    }
}