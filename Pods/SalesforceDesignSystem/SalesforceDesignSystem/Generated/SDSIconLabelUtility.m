/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#import "SDSIconLabelUtility.h"

#define iconName(enum) [@[\
@"SDSIconUtility3dots",\
@"SDSIconUtilityAdd",\
@"SDSIconUtilityAdduser",\
@"SDSIconUtilityAnnouncement",\
@"SDSIconUtilityApps",\
@"SDSIconUtilityArrowdown",\
@"SDSIconUtilityArrowup",\
@"SDSIconUtilityAttach",\
@"SDSIconUtilityBack",\
@"SDSIconUtilityBan",\
@"SDSIconUtilityBookmark",\
@"SDSIconUtilityBrush",\
@"SDSIconUtilityBucket",\
@"SDSIconUtilityBuilder",\
@"SDSIconUtilityCall",\
@"SDSIconUtilityCapslock",\
@"SDSIconUtilityCases",\
@"SDSIconUtilityCenterAlignText",\
@"SDSIconUtilityChart",\
@"SDSIconUtilityChat",\
@"SDSIconUtilityCheck",\
@"SDSIconUtilityCheckin",\
@"SDSIconUtilityChevrondown",\
@"SDSIconUtilityChevronleft",\
@"SDSIconUtilityChevronright",\
@"SDSIconUtilityChevronup",\
@"SDSIconUtilityClear",\
@"SDSIconUtilityClose",\
@"SDSIconUtilityComments",\
@"SDSIconUtilityCompany",\
@"SDSIconUtilityConnectedApps",\
@"SDSIconUtilityContract",\
@"SDSIconUtilityCopy",\
@"SDSIconUtilityCrossfilter",\
@"SDSIconUtilityCustomApps",\
@"SDSIconUtilityCut",\
@"SDSIconUtilityDash",\
@"SDSIconUtilityDayview",\
@"SDSIconUtilityDelete",\
@"SDSIconUtilityDesktop",\
@"SDSIconUtilityDown",\
@"SDSIconUtilityDownload",\
@"SDSIconUtilityEdit",\
@"SDSIconUtilityEmail",\
@"SDSIconUtilityError",\
@"SDSIconUtilityEvent",\
@"SDSIconUtilityExpand",\
@"SDSIconUtilityFavorite",\
@"SDSIconUtilityFilter",\
@"SDSIconUtilityFilterlist",\
@"SDSIconUtilityFrozen",\
@"SDSIconUtilityGroups",\
@"SDSIconUtilityHelp",\
@"SDSIconUtilityHome",\
@"SDSIconUtilityIdentity",\
@"SDSIconUtilityImage",\
@"SDSIconUtilityInbox",\
@"SDSIconUtilityInfo",\
@"SDSIconUtilityInsertTagField",\
@"SDSIconUtilityInsertTemplate",\
@"SDSIconUtilityJustifyText",\
@"SDSIconUtilityKanban",\
@"SDSIconUtilityKnowledgeBase",\
@"SDSIconUtilityLeft",\
@"SDSIconUtilityLeftAlignText",\
@"SDSIconUtilityLike",\
@"SDSIconUtilityLink",\
@"SDSIconUtilityList",\
@"SDSIconUtilityLocation",\
@"SDSIconUtilityLock",\
@"SDSIconUtilityLogout",\
@"SDSIconUtilityMagicwand",\
@"SDSIconUtilityMatrix",\
@"SDSIconUtilityMonthlyview",\
@"SDSIconUtilityMove",\
@"SDSIconUtilityNew",\
@"SDSIconUtilityNewWindow",\
@"SDSIconUtilityNews",\
@"SDSIconUtilityNotebook",\
@"SDSIconUtilityNotification",\
@"SDSIconUtilityOffice365",\
@"SDSIconUtilityOffline",\
@"SDSIconUtilityOpen",\
@"SDSIconUtilityOpenFolder",\
@"SDSIconUtilityOpenedFolder",\
@"SDSIconUtilityPackage",\
@"SDSIconUtilityPackageOrg",\
@"SDSIconUtilityPackageOrgBeta",\
@"SDSIconUtilityPage",\
@"SDSIconUtilityPalette",\
@"SDSIconUtilityPaste",\
@"SDSIconUtilityPeople",\
@"SDSIconUtilityPhoneLandscape",\
@"SDSIconUtilityPhonePortrait",\
@"SDSIconUtilityPhoto",\
@"SDSIconUtilityPower",\
@"SDSIconUtilityPreview",\
@"SDSIconUtilityPriority",\
@"SDSIconUtilityProcess",\
@"SDSIconUtilityPush",\
@"SDSIconUtilityPuzzle",\
@"SDSIconUtilityQuestion",\
@"SDSIconUtilityQuestionsAndAnswers",\
@"SDSIconUtilityRedo",\
@"SDSIconUtilityRefresh",\
@"SDSIconUtilityRelate",\
@"SDSIconUtilityRemoveFormatting",\
@"SDSIconUtilityRemoveLink",\
@"SDSIconUtilityReplace",\
@"SDSIconUtilityReply",\
@"SDSIconUtilityRetweet",\
@"SDSIconUtilityRichtextbulletedlist",\
@"SDSIconUtilityRichtextindent",\
@"SDSIconUtilityRichtextnumberedlist",\
@"SDSIconUtilityRichtextoutdent",\
@"SDSIconUtilityRight",\
@"SDSIconUtilityRightAlignText",\
@"SDSIconUtilityRotate",\
@"SDSIconUtilityRows",\
@"SDSIconUtilitySalesforce1",\
@"SDSIconUtilitySearch",\
@"SDSIconUtilitySettings",\
@"SDSIconUtilitySetupAssistantGuide",\
@"SDSIconUtilityShare",\
@"SDSIconUtilityShield",\
@"SDSIconUtilitySideList",\
@"SDSIconUtilitySignpost",\
@"SDSIconUtilitySms",\
@"SDSIconUtilitySnippet",\
@"SDSIconUtilitySocialshare",\
@"SDSIconUtilitySort",\
@"SDSIconUtilitySpinner",\
@"SDSIconUtilityStandardObjects",\
@"SDSIconUtilityStrikethrough",\
@"SDSIconUtilitySuccess",\
@"SDSIconUtilitySummary",\
@"SDSIconUtilitySummarydetail",\
@"SDSIconUtilitySwitch",\
@"SDSIconUtilityTable",\
@"SDSIconUtilityTabletLandscape",\
@"SDSIconUtilityTabletPortrait",\
@"SDSIconUtilityTextBackgroundColor",\
@"SDSIconUtilityTextColor",\
@"SDSIconUtilityTileCardList",\
@"SDSIconUtilityTopic",\
@"SDSIconUtilityUndo",\
@"SDSIconUtilityUnlock",\
@"SDSIconUtilityUp",\
@"SDSIconUtilityUpload",\
@"SDSIconUtilityUser",\
@"SDSIconUtilityWarning",\
@"SDSIconUtilityWeeklyview",\
@"SDSIconUtilityZoomin",\
@"SDSIconUtilityZoomout" \
] objectAtIndex:enum]

@implementation SDSIconLabelUtility

+ (NSString *)sdsIconName:(SDSIconUtilType)icon{
    return iconName(icon);
}

@end

