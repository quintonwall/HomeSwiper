/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#import "SDSFont.h"

#import <CoreText/CoreText.h>
#import <UIKit/UIKit.h>


@implementation SDSFont

static NSString * bodyFontName = @"SalesforceSans-Regular";
static NSString * lightFontName = @"SalesforceSans-Light";
static NSString * strongFontName = @"SalesforceSans-Bold";

+(void) loadFontWithName:(NSString *)fontName {
    if ([UIFont fontWithName:fontName size:10]) {
        return;
    }
    NSURL *bundleURL = [[NSBundle bundleForClass:[self class]] URLForResource:@"SalesforceDesignSystem" withExtension:@"bundle"];
    if(!bundleURL){
        return;
    }
    NSBundle *bundle = [NSBundle bundleWithURL:bundleURL];
    NSURL *fontURL = [bundle URLForResource:fontName withExtension:@"ttf"];
    NSData *fontData = [NSData dataWithContentsOfURL:fontURL];
    
    CGDataProviderRef provider = CGDataProviderCreateWithCFData((CFDataRef)fontData);
    CGFontRef font = CGFontCreateWithDataProvider(provider);
    
    if (font) {
        CFErrorRef error = NULL;
        if (CTFontManagerRegisterGraphicsFont(font, &error) == NO) {
            CFStringRef errorDescription = CFErrorCopyDescription(error);
            @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:(__bridge NSString *)errorDescription userInfo:@{ NSUnderlyingErrorKey: (__bridge NSError *)error }];
        }
        
        CFRelease(font);
    }
    
    CFRelease(provider);
}


+(UIFont *) sdsFontRegularWithSize:(SDSFontSizeType)fontSize{
    static dispatch_once_t predicate = 0;
    dispatch_once(&predicate, ^{
        [self loadFontWithName:bodyFontName];
    });

    switch(fontSize){
		case SDSFontSizeXSmall:{
			static dispatch_once_t predicate = 0;
			static UIFont* font;
			dispatch_once(&predicate, ^{
				font = [UIFont fontWithName:bodyFontName size:[SDSFontSz sdsFontSize:SDSFontSizeXSmall]];
			});
			return font;
		}
		case SDSFontSizeSmall:{
			static dispatch_once_t predicate = 0;
			static UIFont* font;
			dispatch_once(&predicate, ^{
				font = [UIFont fontWithName:bodyFontName size:[SDSFontSz sdsFontSize:SDSFontSizeSmall]];
			});
			return font;
		}
		case SDSFontSizeMedium:{
			static dispatch_once_t predicate = 0;
			static UIFont* font;
			dispatch_once(&predicate, ^{
				font = [UIFont fontWithName:bodyFontName size:[SDSFontSz sdsFontSize:SDSFontSizeMedium]];
			});
			return font;
		}
		case SDSFontSizeLarge:{
			static dispatch_once_t predicate = 0;
			static UIFont* font;
			dispatch_once(&predicate, ^{
				font = [UIFont fontWithName:bodyFontName size:[SDSFontSz sdsFontSize:SDSFontSizeLarge]];
			});
			return font;
		}
		case SDSFontSizeXLarge:{
			static dispatch_once_t predicate = 0;
			static UIFont* font;
			dispatch_once(&predicate, ^{
				font = [UIFont fontWithName:bodyFontName size:[SDSFontSz sdsFontSize:SDSFontSizeXLarge]];
			});
			return font;
		}
		case SDSFontSizeXxLarge:{
			static dispatch_once_t predicate = 0;
			static UIFont* font;
			dispatch_once(&predicate, ^{
				font = [UIFont fontWithName:bodyFontName size:[SDSFontSz sdsFontSize:SDSFontSizeXxLarge]];
			});
			return font;
		}
    }

    
}

+(UIFont *) sdsFontLightWithSize:(SDSFontSizeType)fontSize{
    static dispatch_once_t predicate = 0;
    dispatch_once(&predicate, ^{
        [self loadFontWithName:lightFontName];
    });
    switch(fontSize){
		case SDSFontSizeXSmall:{
			static dispatch_once_t predicate = 0;
			static UIFont* font;
			dispatch_once(&predicate, ^{
				font = [UIFont fontWithName:lightFontName size:[SDSFontSz sdsFontSize:SDSFontSizeXSmall]];
			});
			return font;
		}
		case SDSFontSizeSmall:{
			static dispatch_once_t predicate = 0;
			static UIFont* font;
			dispatch_once(&predicate, ^{
				font = [UIFont fontWithName:lightFontName size:[SDSFontSz sdsFontSize:SDSFontSizeSmall]];
			});
			return font;
		}
		case SDSFontSizeMedium:{
			static dispatch_once_t predicate = 0;
			static UIFont* font;
			dispatch_once(&predicate, ^{
				font = [UIFont fontWithName:lightFontName size:[SDSFontSz sdsFontSize:SDSFontSizeMedium]];
			});
			return font;
		}
		case SDSFontSizeLarge:{
			static dispatch_once_t predicate = 0;
			static UIFont* font;
			dispatch_once(&predicate, ^{
				font = [UIFont fontWithName:lightFontName size:[SDSFontSz sdsFontSize:SDSFontSizeLarge]];
			});
			return font;
		}
		case SDSFontSizeXLarge:{
			static dispatch_once_t predicate = 0;
			static UIFont* font;
			dispatch_once(&predicate, ^{
				font = [UIFont fontWithName:lightFontName size:[SDSFontSz sdsFontSize:SDSFontSizeXLarge]];
			});
			return font;
		}
		case SDSFontSizeXxLarge:{
			static dispatch_once_t predicate = 0;
			static UIFont* font;
			dispatch_once(&predicate, ^{
				font = [UIFont fontWithName:lightFontName size:[SDSFontSz sdsFontSize:SDSFontSizeXxLarge]];
			});
			return font;
		}
    }
}

+(UIFont *) sdsFontStrongWithSize:(SDSFontSizeType)fontSize{
    static dispatch_once_t predicate = 0;
    dispatch_once(&predicate, ^{
        [self loadFontWithName:strongFontName];
    });
    switch(fontSize){
		case SDSFontSizeXSmall:{
			static dispatch_once_t predicate = 0;
			static UIFont* font;
			dispatch_once(&predicate, ^{
				font = [UIFont fontWithName:strongFontName size:[SDSFontSz sdsFontSize:SDSFontSizeXSmall]];
			});
			return font;
		}
		case SDSFontSizeSmall:{
			static dispatch_once_t predicate = 0;
			static UIFont* font;
			dispatch_once(&predicate, ^{
				font = [UIFont fontWithName:strongFontName size:[SDSFontSz sdsFontSize:SDSFontSizeSmall]];
			});
			return font;
		}
		case SDSFontSizeMedium:{
			static dispatch_once_t predicate = 0;
			static UIFont* font;
			dispatch_once(&predicate, ^{
				font = [UIFont fontWithName:strongFontName size:[SDSFontSz sdsFontSize:SDSFontSizeMedium]];
			});
			return font;
		}
		case SDSFontSizeLarge:{
			static dispatch_once_t predicate = 0;
			static UIFont* font;
			dispatch_once(&predicate, ^{
				font = [UIFont fontWithName:strongFontName size:[SDSFontSz sdsFontSize:SDSFontSizeLarge]];
			});
			return font;
		}
		case SDSFontSizeXLarge:{
			static dispatch_once_t predicate = 0;
			static UIFont* font;
			dispatch_once(&predicate, ^{
				font = [UIFont fontWithName:strongFontName size:[SDSFontSz sdsFontSize:SDSFontSizeXLarge]];
			});
			return font;
		}
		case SDSFontSizeXxLarge:{
			static dispatch_once_t predicate = 0;
			static UIFont* font;
			dispatch_once(&predicate, ^{
				font = [UIFont fontWithName:strongFontName size:[SDSFontSz sdsFontSize:SDSFontSizeXxLarge]];
			});
			return font;
		}
    }
}

@end
