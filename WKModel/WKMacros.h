//
//  WKMacros.h
//  WKModel
//
//  Created by ZHXW on 2018/8/14.
//  Copyright © 2018年 ZHXW. All rights reserved.
//

#ifndef WKMacros_h
#define WKMacros_h

typedef NS_ENUM(NSUInteger, WKEncodingType){
    WKEncodingTypeUnknown                   = 0,
    WKEncodingTypeChar                      = 1, //'c'
    WKEncodingTypeInt                       = 2, //'i'
    WKEncodingTypeShort                     = 3, //'s'
    WKEncodingTypeLong                      = 4, //'l'
    WKEncodingTypeLongLong                  = 5, //'q'
    WKEncodingTypeUnsignedChar              = 6, //'C'
    WKEncodingTypeUnsignedInt               = 7, //'I'
    WKEncodingTypeUnsignedShort             = 8, //'S'
    WKEncodingTypeUnsignedLong              = 9, //'L'
    WKEncodingTypeUnsignedLongLong          = 10, //'Q'
    WKEncodingTypeFloat                     = 11, //'f'
    WKEncodingTypeDouble                    = 12, //'d'
    WKEncodingTypeBool                      = 13, //'B'
    WKEncodingTypeVoid                      = 14, //'v'
    WKEncodingTypeString                    = 15, //'*'
    WKEncodingTypeObject                    = 16, //'@'
    WKEncodingTypeClass                     = 17, //'#'
    WKEncodingTypeSelector                  = 18, //':'
    WKEncodingTypeArray                     = 19, ///'['
    WKEncodingTypeStructure                 = 20, //'{'
    WKEncodingTypeUnion                     = 21, //'('
    WKEncodingTypeNumBits                   = 22, //'b'
    WKEncodingTypePoint                     = 23, //'^'
    WKEncodingTypeBlock                     = 24, //'@?'
    //
    WKEncodingTypeQualifierConst            = 1 << 8, //'r'
    WKEncodingTypeQualifierIn               = 1 << 9, //'n'
    WKEncodingTypeQualifierInout            = 1 << 10, //'N'
    WKEncodingTypeQualifierOut              = 1 << 17, //'o'
    WKEncodingTypeQualifierBycopy           = 1 << 12, //'O'
    WKEncodingTypeQualifierByref            = 1 << 13, //'R'
    WKEncodingTypeQualifierOneway           = 1 << 14, //'V'
};

#endif /* WKMacros_h */
