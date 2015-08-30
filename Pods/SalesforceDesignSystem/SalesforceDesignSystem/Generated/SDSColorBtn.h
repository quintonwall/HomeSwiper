/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#import <UIKit/UIKit.h>
#import "SDSColorAlias.h"

typedef NS_ENUM(NSInteger, SDSColorBtnType) {
    
    SDSColorBtnTextButtonBrand,
	SDSColorBtnTextButtonBrandHover,
	SDSColorBtnTextButtonBrandActive,
	SDSColorBtnTextButtonBrandDisabled,
	SDSColorBtnTextButtonDefault,
	SDSColorBtnTextButtonDefaultHover,
	SDSColorBtnTextButtonDefaultActive,
	SDSColorBtnTextButtonDefaultDisabled,
	SDSColorBtnTextButtonDefaultHint,
	SDSColorBtnTextButtonInverse,
	SDSColorBtnTextButtonInverseDisabled,
	SDSColorBtnTextIconDefault,
	SDSColorBtnTextIconDefaultHint,
	SDSColorBtnTextIconDefaultHover,
	SDSColorBtnTextIconDefaultActive,
	SDSColorBtnTextIconDefaultDisabled,
	SDSColorBtnTextIconInverse,
	SDSColorBtnTextIconInverseHover,
	SDSColorBtnTextIconInverseActive,
	SDSColorBtnTextIconInverseDisabled,
	SDSColorBtnBackgroundButtonBrand,
	SDSColorBtnBackgroundButtonBrandActive,
	SDSColorBtnBackgroundButtonBrandHover,
	SDSColorBtnBackgroundButtonBrandDisabled,
	SDSColorBtnBackgroundButtonDefault,
	SDSColorBtnBackgroundButtonDefaultHover,
	SDSColorBtnBackgroundButtonDefaultFocus,
	SDSColorBtnBackgroundButtonDefaultActive,
	SDSColorBtnBackgroundButtonDefaultDisabled,
	SDSColorBtnBackgroundButtonIcon,
	SDSColorBtnBackgroundButtonIconHover,
	SDSColorBtnBackgroundButtonIconFocus,
	SDSColorBtnBackgroundButtonIconActive,
	SDSColorBtnBackgroundButtonIconDisabled,
	SDSColorBtnBackgroundButtonInverse,
	SDSColorBtnBackgroundButtonInverseActive,
	SDSColorBtnBackgroundButtonInverseDisabled,
	SDSColorBtnBackgroundModalButton,
	SDSColorBtnBackgroundModalButtonActive,
	SDSColorBtnBorderButtonBrand,
	SDSColorBtnBorderButtonBrandDisabled,
	SDSColorBtnBorderButtonDefault,
	SDSColorBtnBorderButtonInverseDisabled
};

@interface SDSColorBtn : NSObject
+ (UIColor *)sdsColor:(SDSColorBtnType)color;
+ (NSString *)sdsColorEnumName:(SDSColorBtnType)color;
@end
