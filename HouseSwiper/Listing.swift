

import Foundation

import UIKit


class Listing: NSObject {
    
    var Address: NSString?
    var City: NSString?
    var Image: UIImage!
    var ImageUrl: NSString?
    var Bedrooms: NSNumber?
    var Bathrooms: NSNumber?
    var Price: NSNumber?
    var ListingDescription: NSString?
    var ListingTeaser: NSString?
    var NumberOfLikes: NSNumber?
    var NumberOfPhotos: NSNumber?
    
    override var description: String {
        return "Address: \(Address),  \n City: \(City), \n ImageUrl: \(ImageUrl), \n Bedrooms: \(Bedrooms),  \n Bathrooms: \(Bathrooms), \n Price: \(Price) \n Description: \(ListingDescription),  \n NumberofLikes: \(NumberOfLikes), \n NumberOfPhotos/: \(NumberOfPhotos)"
    }
    
    override init() {
        super.init()
    }
    
    func loadListing(address: NSString?, city: NSString?, imageUrl: NSString?, bedrooms: NSNumber?, bathrooms: NSNumber?, price: NSNumber?, description: NSString?, teaser: NSString?, likes:NSNumber?, photos:NSNumber?) {
       self.Address = address ?? ""
        self.City = city ?? ""
        self.ImageUrl = imageUrl ?? ""
        
        if(imageUrl != "") {
            asyncFetchListingImage(imageUrl!)
        } else {
            self.Image = UIImage(named: "likenope-splash")  //placeholder image
        }
        
       // self.image = UIImage(data: data!)
        
        self.Bedrooms = bedrooms ?? 0
        self.Bathrooms = bathrooms ?? 0
        self.Price = price ?? 0
        self.ListingDescription = description ?? ""
        self.ListingTeaser = teaser ?? ""
        self.NumberOfLikes = likes ?? 0
        self.NumberOfPhotos = photos ?? 0
    }
    
    
    func getDataFromUrl(url:String, completion: ((data: NSData?) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: url)!) { (data, response, error) in
            completion(data: NSData(data: data!))
            }.resume()
    }
    
    func asyncFetchListingImage(url:NSString){
        getDataFromUrl(url as String) { data in
            dispatch_async(dispatch_get_main_queue()) {
                self.Image = UIImage(data: data!)
            }
        }
    }
}