
import UIKit

class ChooseListingView: MDCSwipeToChooseView {
    
    let ChooseListingViewImageLabelWidth:CGFloat = 42.0;
    var listing: Listing!
    var informationView: UIView!
    var nameLabel: UILabel!
    var addressLabel: UILabel!
    var cameraImageLabelView:ImagelabelView!
    var bathroomsImageLabelView: ImagelabelView!
    var bedroomsImageLabelView: ImagelabelView!
    
    init(frame: CGRect, listing: Listing, options: MDCSwipeToChooseViewOptions) {
        
        super.init(frame: frame, options: options)
        self.listing = listing
        
        if let image = self.listing.Image {
           
            self.imageView.image = image
            var defaults = NSUserDefaults.standardUserDefaults()
            var scaleImages:Bool = false
            scaleImages = defaults.valueForKey("scaleListingImages") as! Bool
            if (scaleImages) {
                self.imageView.contentMode = .ScaleAspectFit
            }
            self.imageView.backgroundColor = UIColor.whiteColor()
     
        }
        
        self.autoresizingMask = UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleWidth
        UIViewAutoresizing.FlexibleBottomMargin
        
       self.imageView.autoresizingMask = self.autoresizingMask
        
        constructInformationView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func constructInformationView() -> Void{
        var bottomHeight:CGFloat = 60.0
        var bottomFrame:CGRect = CGRectMake(0,
            CGRectGetHeight(self.bounds) - bottomHeight,
            CGRectGetWidth(self.bounds),
            bottomHeight);
        self.informationView = UIView(frame:bottomFrame)
        self.informationView.backgroundColor =  UIColor.whiteColor()

        self.informationView.clipsToBounds = true
        self.informationView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleTopMargin
        self.addSubview(self.informationView)
        constructNameLabel()
        constructCameraImageLabelView()
        constructBathroomsImageLabelView()
        constructBedroomsImageLabelView()
    }
    
    func constructNameLabel() -> Void{
        
        var leftPadding:CGFloat = 12.0
        var topPadding:CGFloat = -25.0
        
        //address
        var frame:CGRect = CGRectMake(leftPadding,
            topPadding,
            floor(CGRectGetWidth(self.informationView.frame)/2),
            CGRectGetHeight(self.informationView.frame) - topPadding)
        self.addressLabel = UILabel(frame:frame)
        self.addressLabel.font = UIFont.sdsFontLightWithSize(SDSFontSizeType.Small)
        self.addressLabel.text = "\(listing.Address!), \(listing.City!)"
        self.informationView .addSubview(self.addressLabel)
        
        //price
        
        topPadding = 17.0
        var frame2:CGRect = CGRectMake(leftPadding,
            topPadding,
            floor(CGRectGetWidth(self.informationView.frame)/2),
            CGRectGetHeight(self.informationView.frame) - topPadding)
        self.nameLabel = UILabel(frame:frame2)
        self.nameLabel.font = UIFont.sdsFontStrongWithSize(SDSFontSizeType.XLarge)
        var formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.maximumFractionDigits = 0
        var s = formatter.stringFromNumber(listing.Price!)
        self.nameLabel.text = s
        self.informationView.addSubview(self.nameLabel)
       
    }
    func constructCameraImageLabelView() -> Void{
        var rightPadding:CGFloat = 10.0
        var image:UIImage = UIImage.sdsIconAction(SDSIconActionType.NewCustom38, withSize: 25)!
        self.cameraImageLabelView = buildImageLabelViewLeftOf(CGRectGetWidth(self.informationView.bounds), image:image, text:listing.NumberOfPhotos!.stringValue)
        self.informationView.addSubview(self.cameraImageLabelView)
    }
    func constructBathroomsImageLabelView() -> Void{
        var image: UIImage = UIImage.sdsIconAction(SDSIconActionType.NewCustom84, withSize: 25)!
        self.bathroomsImageLabelView = self.buildImageLabelViewLeftOf(CGRectGetMinX(self.cameraImageLabelView.frame), image: image, text:listing.Bathrooms!.stringValue)
        self.informationView.addSubview(self.bathroomsImageLabelView)
    }
    
    func constructBedroomsImageLabelView() -> Void{
        var image:UIImage = UIImage.sdsIconAction(SDSIconActionType.NewCustom10, withSize: 25)!
        self.bedroomsImageLabelView = buildImageLabelViewLeftOf(CGRectGetMinX(self.bathroomsImageLabelView.frame), image:image,text:listing.Bedrooms!.stringValue)
        self.informationView.addSubview(self.bedroomsImageLabelView)
    }
    
    func buildImageLabelViewLeftOf(x:CGFloat, image:UIImage, text:String) -> ImagelabelView{
        var frame:CGRect = CGRect(x:x-ChooseListingViewImageLabelWidth, y: 0,
            width: ChooseListingViewImageLabelWidth,
            height: CGRectGetHeight(self.informationView.bounds))
        var view:ImagelabelView = ImagelabelView(frame:frame, image:image, text:text)
        view.autoresizingMask = UIViewAutoresizing.FlexibleLeftMargin
        return view
    }
    
    
}
