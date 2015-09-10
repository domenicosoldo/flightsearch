//
//  GeneralUtils.h
//  Flight Search
//
//  Created by Domenico Soldo on 5/08/2015.
//  Copyright (c) 2015 Domenico Soldo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GeneralUtils : NSObject

/*
 @param NSDate
 Return data formatted as yyyy-MM-dd'T'HH:mm:ssZZZZZ
 */
+ (NSString *)getDateFormatted:(NSDate *)date;

@end
