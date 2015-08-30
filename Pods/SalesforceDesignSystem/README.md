#LightningDesignSystem Tokens + iOS

iOS static library for Salesforce Design System [Design Tokens](https://git.soma.salesforce.com/ux/landmark/)


## Simple Install

Add to your Podfile:

```ruby

pod 'SalesforceDesignSystem', :git => 'https://git.soma.salesforce.com/ux/SalesforceDesignSystem-iOS.git'

```

run

```
pod install
```

## Manual Submodule/Subproject Setup

```
git init
git submodule add git@git.soma.salesforce.com:ux/SalesforceDesignSystem-iOS.git
```

Step 1. in your App target Build Settings:
'Other Linker Flags' should have: -ObjC 

[![browser support](/readmeAssets/readme-image-other-linker-flags.png)](/readme-image-other-linker-flags.png)

Step 2. in App target Build Phases:
add SalesforceDesignSystem to 'Target Dependencies'

[![browser support](/readmeAssets/readme-image-target-dependency.png)](/readme-image-target-dependency.png)

Step 3. in App target Build Phases:
add SalesforceDesignSystem.a to 'Link Binary with Libraries' 

[![browser support](/readmeAssets/readme-image-link-binary.png)](/readme-image-link-binary.png)

Step 4. drag SalesforceDesignSystem.bundle from SalesforceDesignSystem.xcodeproj folder in the left panel to 'Copy Bundle Resources' section in Build Phases. Choose 'Create folder references' in the dialog window:

[![browser support](/readmeAssets/readme-image-drag-bundle.png)](/readmeAssets/readme-image-drag-bundle.png)


## Usage 


#### Colors

```objc

#import <SalesforceDesignSystem/SalesforceDesignSystem.h> 

...

UIColor* c = [UIColor sdsColorText:SDSColorTextInverse];



```


#### Fonts and text sizes

```objc

#import <SalesforceDesignSystem/SalesforceDesignSystem.h> 

...

UIFont* f = [UIFont sdsFontLightWithSize:SDSFontSizeXLarge];



```


#### Icons

##### Action Icons

```objc

#import <SalesforceDesignSystem/SalesforceDesignSystem.h> 

...

UIImage *icon = [UIImage sdsIconAction:SDSIconActionNewCustom98 withSize:20.0f];

```

[![browser support](/readmeAssets/readme-icons-action.png)](/readmeAssets/readme-icons-action.png)

##### Custom Icons

```objc

#import <SalesforceDesignSystem/SalesforceDesignSystem.h> 

...

UIImage *icon = [UIImage sdsIconCustom:SDSIconCustom1 withSize:20.0f];

```

[![browser support](/readmeAssets/readme-icons-custom.png)](/readmeAssets/readme-icons-custom.png)


##### Standard Icons

```objc

#import <SalesforceDesignSystem/SalesforceDesignSystem.h> 

...

UIImage *icon = [UIImage sdsIconStandard:SDSIconStandardAccount withSize:20.0f];

```

[![browser support](/readmeAssets/readme-icons-standard.png)](/readmeAssets/readme-icons-standard.png)


##### Utility Icons

```objc

#import <SalesforceDesignSystem/SalesforceDesignSystem.h> 

...

UIImage *icon = [UIImage sdsIconUtility:SDSIconUtility3dots withSize:20.0f];

```

[![browser support](/readmeAssets/readme-icons-utility.png)](/readmeAssets/readme-icons-utility.png)


## Sample Code 

See [Demo App](/Demo) for sample code:


[![browser support](/readmeAssets/readme-image.png)](/readme-image.png)



## Library Build (not required)
```
  $ npm install
  $ npm start
```

## Contact #

* ibogdanov@salesforce.com
