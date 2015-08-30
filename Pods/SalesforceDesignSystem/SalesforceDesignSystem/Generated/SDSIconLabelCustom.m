/*
 Copyright (c) 2015, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#import "SDSIconLabelCustom.h"

#define iconName(enum) [@[\
@"SDSIconCustom1",\
@"SDSIconCustom10",\
@"SDSIconCustom100",\
@"SDSIconCustom11",\
@"SDSIconCustom12",\
@"SDSIconCustom13",\
@"SDSIconCustom14",\
@"SDSIconCustom15",\
@"SDSIconCustom16",\
@"SDSIconCustom17",\
@"SDSIconCustom18",\
@"SDSIconCustom19",\
@"SDSIconCustom2",\
@"SDSIconCustom20",\
@"SDSIconCustom21",\
@"SDSIconCustom22",\
@"SDSIconCustom23",\
@"SDSIconCustom24",\
@"SDSIconCustom25",\
@"SDSIconCustom26",\
@"SDSIconCustom27",\
@"SDSIconCustom28",\
@"SDSIconCustom29",\
@"SDSIconCustom3",\
@"SDSIconCustom30",\
@"SDSIconCustom31",\
@"SDSIconCustom32",\
@"SDSIconCustom33",\
@"SDSIconCustom34",\
@"SDSIconCustom35",\
@"SDSIconCustom36",\
@"SDSIconCustom37",\
@"SDSIconCustom38",\
@"SDSIconCustom39",\
@"SDSIconCustom4",\
@"SDSIconCustom40",\
@"SDSIconCustom41",\
@"SDSIconCustom42",\
@"SDSIconCustom43",\
@"SDSIconCustom44",\
@"SDSIconCustom45",\
@"SDSIconCustom46",\
@"SDSIconCustom47",\
@"SDSIconCustom48",\
@"SDSIconCustom49",\
@"SDSIconCustom5",\
@"SDSIconCustom50",\
@"SDSIconCustom51",\
@"SDSIconCustom52",\
@"SDSIconCustom53",\
@"SDSIconCustom54",\
@"SDSIconCustom55",\
@"SDSIconCustom56",\
@"SDSIconCustom57",\
@"SDSIconCustom58",\
@"SDSIconCustom59",\
@"SDSIconCustom6",\
@"SDSIconCustom60",\
@"SDSIconCustom61",\
@"SDSIconCustom62",\
@"SDSIconCustom63",\
@"SDSIconCustom64",\
@"SDSIconCustom65",\
@"SDSIconCustom66",\
@"SDSIconCustom67",\
@"SDSIconCustom68",\
@"SDSIconCustom69",\
@"SDSIconCustom7",\
@"SDSIconCustom70",\
@"SDSIconCustom71",\
@"SDSIconCustom72",\
@"SDSIconCustom73",\
@"SDSIconCustom74",\
@"SDSIconCustom75",\
@"SDSIconCustom76",\
@"SDSIconCustom77",\
@"SDSIconCustom78",\
@"SDSIconCustom79",\
@"SDSIconCustom8",\
@"SDSIconCustom80",\
@"SDSIconCustom81",\
@"SDSIconCustom82",\
@"SDSIconCustom83",\
@"SDSIconCustom84",\
@"SDSIconCustom85",\
@"SDSIconCustom86",\
@"SDSIconCustom87",\
@"SDSIconCustom88",\
@"SDSIconCustom89",\
@"SDSIconCustom9",\
@"SDSIconCustom90",\
@"SDSIconCustom91",\
@"SDSIconCustom92",\
@"SDSIconCustom93",\
@"SDSIconCustom94",\
@"SDSIconCustom95",\
@"SDSIconCustom96",\
@"SDSIconCustom97",\
@"SDSIconCustom98",\
@"SDSIconCustom99" \
] objectAtIndex:enum]


@implementation SDSIconLabelCustom

+ (NSString *)sdsIconName:(SDSIconCustomType)icon{
    return iconName(icon);
}

@end
