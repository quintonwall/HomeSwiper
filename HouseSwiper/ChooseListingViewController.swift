

import UIKit

class ChooseListingViewController: UIViewController, MDCSwipeToChooseDelegate {
    
    var listings:[Listing] = []
    let ChooseListingButtonHorizontalPadding:CGFloat = 80.0
    let ChooseListingButtonVerticalPadding:CGFloat = 20.0
    var currentListing:Listing!
    var frontCardView:ChooseListingView!
    var backCardView:ChooseListingView!
    var bgColor:String = "B8BDB9"
    let listingsServiceURL = "https://pacific-reef-6131.herokuapp.com/properties"
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fetchListings()
        
   
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        fetchListings()
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
       // self.view.backgroundColor = self.hexStringToUIColor(bgColor)
         self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bgblur-sm")!)
        
        
    }
    
    func setUpCards() {
        self.setTheFrontCardView(self.popListingViewWithFrame(frontCardViewFrame())!)
        self.view.addSubview(self.frontCardView)
        
        self.backCardView = self.popListingViewWithFrame(backCardViewFrame())!
        self.view.insertSubview(self.backCardView, belowSubview: self.frontCardView)
        
        
        // Add buttons to programmatically swipe the view left or right.
        // See the `nopeFrontCardView` and `likeFrontCardView` methods.
        constructNopeButton()
        constructLikedButton()
        
        
    }
    
    func suportedInterfaceOrientations() -> UIInterfaceOrientationMask{
        return UIInterfaceOrientationMask.Portrait
    }
    
    
    // This is called when a user didn't fully swipe left or right.
    func viewDidCancelSwipe(view: UIView) -> Void{
        
        println("You couldn't decide on \(self.currentListing.Address)");
    }
    
    // This is called then a user swipes the view fully left or right.
    func view(view: UIView, wasChosenWithDirection: MDCSwipeDirection) -> Void{
        
        // MDCSwipeToChooseView shows "NOPE" on swipes to the left,
        // and "LIKED" on swipes to the right.
        if(wasChosenWithDirection == MDCSwipeDirection.Left){
            println("You noped: \(self.currentListing.Address)")
        }
        else{
            
            println("You liked: \(self.currentListing.Address)")
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
    
    
    func fetchListings(){
  
        request(.GET, listingsServiceURL, parameters: nil)
            .responseJSON { _, _, JSONstr, _ in
                //println(JSONstr)
                
                let json = JSON(JSONstr!)
                
                var currListing:Listing
                
                for (index: String, subJson: JSON) in json {
                    let address = subJson["address"].stringValue
                    
                    currListing = Listing()
                    currListing.loadListing(subJson["address"].stringValue, city: subJson["city"].stringValue, imageUrl: subJson["pic"].stringValue, bedrooms: subJson["bedrooms"].numberValue, bathrooms: subJson["bathrooms"].numberValue, price: subJson["price"].numberValue, description: "NOT IMPLEMENTED", likes: 0, photos: 0)
                    
                    self.listings.append(currListing)
                    
                }
                
                self.setUpCards()
                
        }
  
    }
    
    
    
    func popListingViewWithFrame(frame:CGRect) -> ChooseListingView?{
        if(self.listings.count == 0){
            return nil;
        }
        
        // UIView+MDCSwipeToChoose and MDCSwipeToChooseView are heavily customizable.
        // Each take an "options" argument. Here, we specify the view controller as
        // a delegate, and provide a custom callback that moves the back card view
        // based on how far the user has panned the front card view.
        var options:MDCSwipeToChooseViewOptions = MDCSwipeToChooseViewOptions()
        options.delegate = self
        //options.threshold = 160.0
        options.onPan = { state -> Void in
            if(self.backCardView != nil){
                var frame:CGRect = self.frontCardViewFrame()
                self.backCardView.frame = CGRectMake(frame.origin.x, frame.origin.y-(state.thresholdRatio * 10.0), CGRectGetWidth(frame), CGRectGetHeight(frame))
            }
        }
        
        // Create a listingView with the top listing in the listings array, then pop
        // that listing off the stack.
        
        var listingView:ChooseListingView = ChooseListingView(frame: frame, listing: self.listings[0], options: options)
        self.listings.removeAtIndex(0)
        return listingView
        
    }
    func frontCardViewFrame() -> CGRect{
        var horizontalPadding:CGFloat = 20.0
        var topPadding:CGFloat = 60.0
        var bottomPadding:CGFloat = 200.0
        return CGRectMake(horizontalPadding,topPadding,CGRectGetWidth(self.view.frame) - (horizontalPadding * 2), CGRectGetHeight(self.view.frame) - bottomPadding)
    }
    func backCardViewFrame() ->CGRect{
        var frontFrame:CGRect = frontCardViewFrame()
        return CGRectMake(frontFrame.origin.x, frontFrame.origin.y + 10.0, CGRectGetWidth(frontFrame), CGRectGetHeight(frontFrame))
    }
    func constructNopeButton() -> Void{
        let button:UIButton =  UIButton.buttonWithType(UIButtonType.System) as! UIButton
        let image:UIImage = UIImage.sdsIconAction(SDSIconActionType.Close, withSize: 60)!
        button.frame = CGRectMake(ChooseListingButtonHorizontalPadding, CGRectGetMaxY(self.backCardView.frame) + ChooseListingButtonVerticalPadding, image.size.width, image.size.height)
        button.setBackgroundImage(image, forState: UIControlState.Normal)
       // button.tintColor = UIColor(red: 247.0/255.0, green: 91.0/255.0, blue: 37.0/255.0, alpha: 1.0)
        button.addTarget(self, action: "nopeFrontCardView", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }
    
    func constructLikedButton() -> Void{
        
       // let b2:UIButton = UIButton as! UIButton
       
        let button:UIButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        let image:UIImage = UIImage.sdsIconAction(SDSIconActionType.Approval, withSize: 60)!
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
    
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet() as NSCharacterSet).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = cString.substringFromIndex(advance(cString.startIndex, 1))
        }
        
        if (count(cString) != 6) {
            return UIColor.grayColor()
        }
        
        var rgbValue:UInt32 = 0
        NSScanner(string: cString).scanHexInt(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}